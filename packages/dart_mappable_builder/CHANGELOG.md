# 3.0.0-dev.0

- Simplified internal mapper implementation and removed `MapperElementBase` class.
- Added `MappingContext` being passed to mapper methods.
- Added `EncodingOptions` to `toValue` method.
- Added support for third-party models by using annotated `typedef`s.
- Removed `<MyClass>Mapper.container` in favor of `MapperContainer.globals`.
- Removed `@MappableLib.createCombinedContainer` in favor of `@MappableLib.generateInitializerForScope`.
- Renamed `.copyWith.apply()` method to `.copyWith.$update()`.
- Removed `CheckTypesHook` in favor of discriminator functions.
- Added `.copyWith.$merge()` and `.copyWith.$delta()`.

# 2.0.2

- Fixed an analysis error when using core interfaces.

# 2.0.1

- Fixed generated container for private libraries.

# 2.0.0

- Mappers are now generated for each file containing annotated classes. This removes the
  need to specify entry points in the `build.yaml`.

  > This is now similar to how packages like `json_serializable` or `freezed` generate code.

  - Generated files are now `part` files and need to be included as such.
  - All annotated classes must now use their respective `<MyClass>Mappable` mixin.
  - Instead of one global `Mapper` each class has its own `<ClassName>Mapper`.
    - A new global container that includes all models can now be generated using 
      `@MappableLib(createCombinedContainer: true)`.
  - Mappers can be linked together to enable working with multiple classes.
  - Removed `@CustomMapper` annotation in favor of `includeCustomMappers` property on `@MappableClass()`.

  For a detailed migration guide, see [this issue](https://github.com/schultek/dart_mappable/issues/46).

- Documentation is now separated from the README using the official pub.dev documentation topics.
  Find the new documentation [here](https://pub.dev/documentation/dart_mappable/latest/topics/Introduction-topic.html)

- Improvements in performance and support for generics and inheritance.

- Added the [CheckTypesHook] to allow for custom discriminator checks on subclasses in a
  polymorphic class structure.

- CopyWith is now more powerful and also works for generic or polymorphic classes, while being 
  completely type-safe.
  
  When called on a superclass, the concrete subtype will be retained through a
  `.copyWith` call, which also respects generics:

  ```dart
    // with `class A` and `class B<T> extends A`
    A a = B<int>(); // static type A, dynamic type B<int>
  
    // signature will be `A copyWith()`, so static type A
    A a2 = a.copyWith(); 
  
    // this will still resolve to a dynamic type of B<int>
    assert(a2 is B<int>);
  ```

  For more checkout the [docs](https://pub.dev/documentation/dart_mappable/latest/topics/Copy-With-topic.html)
  or [example](https://github.com/schultek/dart_mappable/tree/main/examples/polymorph_copywith)

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
