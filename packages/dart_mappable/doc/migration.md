`dart_mappable` is meant as an alternative to other popular serialization and data-class packages. To make migration
away from these easier it provides basic compatibility and configuration options to enable partial migration.

### json_serializable

[json_serializable](https://pub.dev/packages/json_serializable) is a popular serialization package
for simple applications. 

There are two migration cases related to this package:

1. You want to migrate your own classes to `dart_mappable` and away from `json_serializable`.
2. You want to make (your own or external) classes that use `json_serializable` compatible with `dart_mappable`.

This also allows for partially migrating only a subset of your classes to `dart_mappable` while still being able to
include and access your *legacy* models.

#### Migrating classes to `dart_mappable`

To migrate your classes to `dart_mappable` follow the normal steps outlined in the [Models](../topics/Models-topic.html) page.

A **very important difference** between the packages is that the `toJson()` method returns
- a `String` in `dart_mappable`,
- a `Map<String, dynamic>` in `json_serializable`.

The equivalent in `dart_mappable` is instead named `toMap()` to better reflect the return type.

Thereby, `dart_mappable` provides the following equivalent of methods when coming from `json_serializable`:

- `toJson()` from `json_serializable` is equivalent to `toMap()` in `dart_mappable` and returns a `Map<String, dynamic>`
- `jsonEncode(toJson())` from `json_serializable` is equivalent to `.toJson()` in `dart_mappable` and returns a `String`

It is **recommended** that you adapt any code that previously used the `toJson()` method of any class to instead use `toMap()`.

--- 

Because we recognize that this might be tedious for a larger codebase, we provide a faster migration path by allowing
a configuration override to change the naming of the generated methods to the `json_serializable` way.

To change the naming of the generated methods, add the following to the `build.yaml` file in your project root:

```yaml
global_options:
  dart_mappable_builder:
    options:
      # ... other dart_mappable options
      renameMethods:
        fromJson: fromJsonString
        toJson: toJsonString
        fromMap: fromJson
        toMap: toJson
```

This generates `Map<String, dynamic> toJson()` instead of `Map<String, dynamic> toMap()` and changes other methods accordingly.

#### Add compatibility for packages requiring `json_serializable`

By now there are a number of packages on pub.dev that expect the `json_serializable`s version of the `toJson()` method
when dealing with data classes, for example packages like `retrofit` or `chopper`.

To make your data classes using `dart_mappable` work well with these packages, you need to use the same 
`renameMethods` config as shown above. Additionally, you need to make sure that the `dart_mappable` code generator runs
before the other code generators of these packages. To do that, adjust your `build.yaml` to the following:

```yaml
global_options:
  dart_mappable_builder:
    runs_before:
      # list the generator packages you depend on, e.g.
      - retrofit_generator
      - chopper_generator
    options:
      # ... other dart_mappable options, including 'renameMethods'
```

#### Add compatibility for classes using `json_serializable`

Classes using `json_serializable` always have the same structure:

1. A factory constructor `MyClass.fromJson(Map<String, Object?> json)` to deserialize an instance of the class, and
2. A `Map<String, dynamic> toJson()` method to serialize an instance of your class.

To use these classes with `dart_mappable`, you can use the `SerializableMapper` like this:

```dart
void main() {
  // Create a compatibe mapper for your class.
  var myClassMapper = SerializableMapper<MyClass, Map<String, dynamic>>(
    // Pass the 'fromJson' method (without parenteses!).
    decode: MyClass.fromJson,
    // Pass an arrow function returning the 'toJson' method (without parenteses!).
    encode: (myClass) => myClass.toJson,
  );
  
  // Make it accessible by all other mappers (Including being used as fields on other classes).
  MapperContainer.globals.use(myClassMapper);
}
```

For generic classes with one or two type parameters, use the `SerializableMapper.arg1` or
`SerializableMapper.arg2` constructors respectively.

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
