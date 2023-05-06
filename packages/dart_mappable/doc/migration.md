`dart_mappable` tries to be compatible with other code-generation packages. Check the `examples` directory for some 
common use-cases. Following are some popular packages that you can use together with `dart_mappable`.

### freezed

[freezed](https://pub.dev/packages/freezed) is a "code generator for unions/pattern-matching/copy";
With this package, it is easy to create union or sealed classes.

While `dart_mappable` can do everything freezed can do and more, it provides compatibility to give you an easy migration
path when you are considering switching to `dart_mappable`.

Here is a simple model taken from `freezed` readme:

```dart
part 'myfile.freezed.dart';

@freezed
class Union with _$Union {
  const factory Union(int value) = Data;
  const factory Union.loading() = Loading;
  const factory Union.error([String? message]) = ErrorDetails;
}
```

To make it compatible with dart_mappable, just add your `@MappableClass` annotations to both the parent class, and all **factory constructors**, as if they were the child classes.
For a description of the `discriminatorKey` and `discriminatorValue` properties refer to the [Polymorphism](https://pub.dev/documentation/dart_mappable/latest/topics/Polymorphism-topic.html) documentation.
You can also add the `@MappableField()` annotation to any of the fields.

```dart
part 'myfile.freezed.dart';
part 'myfile.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'type')
class Union with _$Union {
  @MappableClass(discriminatorValue: 'data')
  const factory Union.data(@MappableField(key: 'mykey') int value) = Data;
  @MappableClass(discriminatorValue: 'loading')
  const factory Union.loading() = Loading;
  @MappableClass(discriminatorValue: 'error')
  const factory Union.error([String? message]) = ErrorDetails;
}
```

This will now allow you to use this and the resulting `Data`, `Loading` and `ErrorDetails` classes as usual:

```dart
void main() {
  var data = Union.data(42);

  var dataJson = data.toJson();
  print(dataJson); // {"mykey":42,"type":"data"}

  var parsedData = UnionMapper.fromJson(dataJson);
  print(parsedData); // Union.data(value: 42)
}
```

For the full example and generated files, check out the `examples/example_freezed` directory.

### json_serializable

[json_serializable](https://pub.dev/packages/json_serializable) is a popular serialization package
for simple applications. 

While this package was designed as a replacement / alternative for `json_serializable`, you may come across 
situations where you need to deal with classes that either use this package directly, or are designed to be compatible with it.

Also when you want to switch from `json_serializable` to `dart_mappable`, you have an easy migration path where you can 
start by only partly migrating models over to `dart_mappable` while still having full access to your *legacy* models.

Classes using `json_serializable` always have the same structure:

1. A factory constructor `MyClass.fromJson(Map<String, Object?> json)` to decode json to an instance of the class, and
2. A `myClass.toJson()` method to encode an instance to json.

To use these classes with `dart_mappable`, you can use the `SerializableMapper` like this:

```dart
void main() {
  var myClassMapper = SerializableMapper<MyClass, Map<String, dynamic>>(
    decode: MyClass.fromJson,
    encode: (myClass) => myClass.toJson,
  );
  // This makes it accessible by all other mappers.
  MapperContainer.globals.use(myClassMapper);
}
```

For generic classes with one or two type parameters, use the `SerializableMapper.arg1` or
`SerializableMapper.arg2` constructors respectively.

### fast_immutable_collections

[fast_immutable_collections](https://pub.dev/packages/fast_immutable_collections) adds immutable
variants for the standard collections types (`List`, `Map`, `Set`). These types are compatible with
`json_serializable`, so we can use the `SerializableMapper` from above as follows:

```dart
final iListMapper = SerializableMapper<IList, dynamic>.arg1(
  decode: IList.fromJson,
  encode: (list) => list.toJson,
  type: <E>(f) => f<IList<E>>(),
);

final iMapMapper = SerializableMapper<IMap, Map<String, dynamic>.arg2(
decode: IMap.fromJson,
encode: (map) => map.toJson,
type: <Key, Val>(f) => f<IMap<Key, Val>>(),
);
```

For a complete working example see the [fic_mappable example](https://github.com/schultek/dart_mappable/tree/main/examples/fic_mappable) on github.
