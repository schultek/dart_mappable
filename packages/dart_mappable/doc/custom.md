
You can create custom mappers to **support custom types** that are not part of the generated code.
You can create a custom mapper in two ways:

- Inherit from the low-level `MapperBase` and `MapperElementBase` interfaces, or
- inherit from the high-level `SimpleMapper` interface.

For most use-cases it is recommended to use the `SimpleMapper` interface and only use the base interfaces when
required for more advanced uses.

## Simple Mapper

Create a class extending `SimpleMapper<T>` with `T` being the type that you want to decode to / encode from.
Then implement the `decode()` and `encode()` methods.

A custom mapper for the `Uri` type would look like this:

```dart
class UriMapper extends SimpleMapper<Uri> {
  const UriMapper();
  
  @override
  Uri decode(dynamic value) {
    return Uri.parse(value as String);
  }

  @override
  dynamic encode(Uri self) {
    return self.toString();
  }
}
```

In the `encode()` method you should return a **primitive serializable type**, like `String`, `int`,
`bool`, etc. or a `List` or `Map` of those types. There are also additional methods you can override,
    like `stringify`, or `equals`. This will enable `==` checks and `toString` on classes using this type.

## Usage

To use a custom mapper, add it to the `MappableClass.includeCustomMappers` annotation property of the target
class:

```dart
@MappableClass(includeCustomMappers: [UriMapper()])
class Domain {
  final Uri uri;

  const Domain(this.uri);
}
```

This will **globally** register the custom mapper when the class is initialized and is afterwards available for all models.

Alternatively you can manually add this to the `MapperContainer.globals`:

```dart
void main() {
  // Add this as the global [Uri] mapper for all models.
  MapperContainer.globals.use(UriMapper());
}
```

***Tip**: Be aware that you can also `unuse()` (and replace) any mappers, both custom, generated, and for primitive types.
This might come in handy if you want to switch between different custom mappers for the same type.*

## Generic Custom Types

When dealing with generic types with one or two type parameters, you can use the `SimpleMapper1` 
or `SimpleMapper2` variants. Here the decoding and encoding functions are generic functions for
receiving the correct type parameters:

You also need to construct a `typeFactory` as shown below.

```dart
class GenericBox<T> {
  T content;
  
  GenericBox(this.content);
}

class CustomBoxMapper extends SimpleMapper1<GenericBox> {

  @override
  // use the type parameter [T] in the return type [GenericBox<T>]
  GenericBox<T> decode<T>(dynamic value) { 
    // use the type parameter [T] in your decoding logic
    T content = container.fromValue<T>(value);
    return GenericBox<T>(container.fromValue<T>(value)); 
  }

  @override
  // use the type parameter [T] in the parameter type [GenericBox<T>]
  dynamic encode<T>(GenericBox<T> self) {
    // use the type parameter [T] in your encoding logic
    return container.toValue<T>(self.content); 
  }

  // In case of generic types, we also must specify a type factory. This is a special type of 
  // function used internally to construct generic instances of your type.
  // Specify any type arguments in alignment to the decode/encode functions.
  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}
```

If your generic class has one or two bounded type parameters (e.g. `class NumberBox<T extends num>`) use the `SimpleMapper1Bounded`
and `SimpleMapper2Bounded` variants:

```dart
class NumberBox<T extends num> {
  NumberBox(this.content);

  final T content;
}

class NumberBoxMapper extends SimpleMapper1Bounded<NumberBox, num> {
  const NumberBoxMapper();

  @override
  NumberBox<A> decode<A extends num>(Object value) {
    return NumberBox<A>(container.fromValue<A>(value));
  }

  @override
  Object? encode<A extends num>(NumberBox<A> self) {
    return container.toValue(self.content);
  }

  @override
  Function get typeFactory => <T extends num>(f) => f<NumberBox<T>>();
}
```

## Custom Iterables and Maps

For special Iterable and Map types, you can of course specify custom mappers as described in the previous section.
However, we provide ready-to-use `IterableMapper` and `MapMapper` to make your life a little bit easier:

For both you have to provide
1. a factory function, which converts a generic iterable / map to your special implementation,
2. a type factory, similar to the one used in generic custom mappers.

```dart
void main() {
  MapperContainer.globals.use(IterableMapper<HashSet>(
    <T>(Iterable<T> i) => HashSet.of(i),
    <T>(f) => f<HashSet<T>>(),
  ));

  MapperContainer.globals.use(MapMapper<HashMap>(
    <K, V>(Map<K, V> m) => HashMap.of(m),
    <K, V>(f) => f<HashMap<K, V>>(),
  ));

  HashSet<String> brands = MapperContainer.globals.fromJson('["Toyota", "Audi", "Audi"]');
  print(String); // {"Toyota", "Audi"}
}
```

## Advanced Uses

For more advanced uses, extend from the `MapperBase` class instead of the `SimpleMapper`.

Here the setup requires a bit more boilerplate, but you get full control over your types:

```dart
// extend [MapperBase] and provide your type
class MyClassMapper extends MapperBase<MyClass> {
  
  // If your type is generic, specify a type factory. Else this can be skipped.
  @override
  Function get typeFactory => <T>(f) => f<MyClass<T>>();
  
  // all the following overrides are optional
  
  @override
  MyClass decoder(DecodingContext<Object> context) {
    // your decoding logic here
    // you can access the encoded value using 'context.value'
    throw UnimplementedError();
  }
  
  @override
  Object? encoder(EncodingContext<Object> context) {
    // your encoding logic here
    // you can access the decoded value using 'context.value'
    throw UnimplementedError();
  }
  
  @override
  bool equals(MappingContext<Object> context, MyClass other) {
    // your equals logic here
    throw UnimplementedError();
  }
  
  @override
  int hash(MappingContext<Object> context) {
    // your hashcode logic here
    throw UnimplementedError();
  }

  @override
  String stringify(MappingContext<Object> context) {
    // your stringify logic here
    throw UnimplementedError();
  }
}
```

---

<p align="right"><a href="../topics/Mapper%20Container-topic.html">Next: Mapper Container</a></p>
