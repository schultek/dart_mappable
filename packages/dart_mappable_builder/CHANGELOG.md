# 2.0.0-dev.13

- Bug fixes and documentation.

# 2.0.0-dev.12

- Boost performance by caching mappers.
- Small bug fixes.

# 2.0.0-dev.11

- Fixed missing linked enums ([#50](https://github.com/schultek/dart_mappable/issues/50))

# 2.0.0-dev.10

- Fixed analysis issues.

# 2.0.0-dev.9

- Added generating combined container using `@MappableLib(createCombinedContainer: true)`.

# 2.0.0-dev.8

- Added compatibility support for `json_serializable` models and `fast_immutable_collections`.

# 2.0.0-dev.7

- Mappers are now generated for each file containing annotated classes. This removes the
  need to specify entry points in the `build.yaml`.
  
  > This is now similar to how packages like `json_serializable` or `freezed` generate code.
  
  - Generated files are now `part` files and need to be included as such.
  - Instead of one global `Mapper` each class has its own mapper.
  - Mappers can be linked together to enable working with multiple classes.
  - Removed `@CustomMapper` annotation in favor of `includeCustomMappers` property on `@MappableClass()`.
  
  For a detailed migration guide, see [this issue](https://github.com/schultek/dart_mappable/issues/46).

- Documentation is now separated from the README using the official pub.dev documentation topics.
  Find the new documentation [here](https://pub.dev/documentation/dart_mappable/latest/topics/Introduction-topic.html)

# 2.0.0-dev.6

- Fixed issue where code where wrongly generated for models outside the package.

  While the builder now stops at package boundaries by default, this can be overruled
  by explicitly using the `@MappableLib()` annotation on an import statement.

- Added the [CheckTypesHook] to allow for custom discriminator checks on subclasses in a
  polymorphic class structure.

# 2.0.0-dev.5

- Removed the `Mappable` mixin in favor of the new class-specific mixins.

  All annotated classes must now mixin their respective `<MyClass>Mappable` mixin.
  More details [here](https://pub.dev/packages/dart_mappable/versions/2.0.0-dev.5#get-started).

# 2.0.0-dev.4

- Fixed bug with incorrect type args in copyWith

# 2.0.0-dev.3

- Fixed various issues with the copyWith implementation for inherited classes.

  CopyWith now works on a wider range of parameters and is completely subtype-safe.
  Specifically a parameter of static type `A` but concrete type `B extends A` keeps
  it concrete type through any `.copyWith` call, including lists and maps.

# 2.0.0-dev.2

- Fixed bug with missing copyWith parameters.

# 2.0.0-dev.1

- Added support for inherited copyWith implementations.

  When using polymorphism or any inheritance, you will now be able to call
  `.copyWith` on the superclass to change any field that is inherited by all
  sub-classes. The concrete subclass types will be retained through such a
  `.copyWith` call and also respects generics.

  ```dart
    // with `class A` and `class B extends A`
    A a = B(); // static type A, dynamic type B
  
    // signature will be `A copyWith()`, so static type A
    A a2 = a.copyWith(); 
  
    // this will still resolve to a dynamic type of B
    assert(a2 is B);
  ```

  Classes using this must mixin the newly generated `<MyClass>Mixin`. More details
  [here](https://pub.dev/packages/dart_mappable/versions/2.0.0-dev.1#copywith-and-polymorphism).

# 2.0.0-dev.0

- Depend on `analyzer: ^5.0.0`
- Imports in the generated code are now prefixed to allow 
  for same names in different libs.
- Improved encoding of generic instances.
  
  Any encoding method (Mapper.toValue, Mapper.toMap, Mapper.toJson) now also takes a 
  generic type argument `T`, which must be an assignable type for the passed value.
  When `T` and the values `runtimeType` match exactly, it is encoded as normal. If not, a `__type` 
  property is added with the specific type of `value`. This can then be used to decode the value 
  without specifying a target type.
  
  ```dart
    // this will encode normal without '__type'
    Mapper.toValue<MyClass>>(myClassInstance);
    Mapper.toValue(MyClass()); // works because of type inference
    Mapper.toValue<MyGenericClass<int>>(myGenericClassInstance);
  
    // this will add the '__type' property
    Mapper.toValue<dynamic>(myClassInstance);
    Mapper.toValue(someDynamicVariable); // where type inference does not work
    Mapper.toValue<MyGenericClass>(myGenericClassInstance); // because the instance has a specific type
  ```

# 1.2.0

- Added support for `2.17` super parameters

# 1.1.3

- Fixed import paths on windows

# 1.1.2

- Improved Readme for constructor utilization
- Fixed missing imports for custom hooks

# 1.1.1

- Updated description

# 1.1.0

- Added support for custom enum values
  - Choose between `ValuesMode.named` and `ValuesMode.indexed` for automatic generation of encoded values
  - Use `@MappableValue(myCustomValue)` on an enum value to specify a custom encoded value
  - Deprecated the `String toStringValue()` extension method in favor of the more general `dynamic toValue()`

# 1.0.2

- Fixed unrecognized type issue for `equals`, `hashCode` and `toString` methods

# 1.0.1

- Improved resolving of constructor parameters, which fixed various issues 
  in `copyWith` and `toMap` methods

# 1.0.0

- Initial release of builder package