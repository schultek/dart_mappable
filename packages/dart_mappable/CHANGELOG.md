# 3.0.0-dev.3

- Fixed bug with null in encoding hook

# 3.0.0-dev.2

- Performance improvements & bug fixes

# 3.0.0-dev.1

- Bug fixes

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

  For a detailed migration guide, see [this issue](https://github.com/schultek/dart_mappable/issues/71).

# 2.0.3

- Fixed typo in readme (by [@timmaffett](https://github.com/schultek/dart_mappable/pull/67))
- Fixed generated container for private libraries.

# 2.0.2

- Fixed yet another unresolved type bug.

# 2.0.1

- Fixed unresolved type bug with custom mappers.

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

# 1.0.3

- Fixed issue with minified standard types on web

# 1.0.2

- Fixed unrecognized type issue for `equals`, `hashCode` and `toString` methods

# 1.0.1

- Improved resolving of constructor parameters, which fixed various issues
  in `copyWith` and `toMap` methods
- Now printing comprehensive warning in the builder output if a parameter cannot be resolved

# 1.0.0

- Large refactoring and restructuring
  - Restructured builder implementation
  - Moved code out of generated files into package
  - Split package int `dart_mappable` and `dart_mappable_builder`
  
- `Mapper` is now a singleton class
  - `fromValue`, `toValue` and all other methods are now instance methods accessible with `Mapper.i.fromValue()`
  - the legacy static methods are still available, but forward to the instance methods
  
- Improved Readme, added **How to use** section and documented `copyWith` functionalities
- Added `@MappableLib()` annotation and moved library-level configuration logic from build options to annotation properties
- Switched to using the `type_plus` package for internal handling of generics
- Added `ChainedHooks`, `UnescapeNewlinesHooks` and `EmptyToNullHooks`
- Added descriptive and comprehensible exception handling

# 0.9.1

- Fixed README

# 0.9.0

- Changed implementation of UnmappedPropertiesHook to allow target parameter at any position in constructor

# 0.8.7

- Added support for lists in copyWith chains

# 0.8.6

- Fixed bug in isEquals method

# 0.8.5

- Restructured and improved tests

# 0.8.4

- Added get, getAll and useAll methods to Mapper

# 0.8.3

- Fixed unmapped properties hook

# 0.8.2

- Fixed enum caseStyle bug

# 0.8.1

- Fixed missing copyWith implementation bug

# 0.8.0

- Use CaseStyle in annotations
- Respect null in copyWith methods
- Chained copyWith methods

# 0.7.2

- Fix equals bug

# 0.7.1

- Deep equality for lists and maps

# 0.7.0

- Update license

# 0.6.5

- Fixed imports on windows

# 0.6.4

- Upgrade dependencies

# 0.6.3

- Fixed missing default values of constructor parameters

# 0.6.2

- Added support for factory constructors and sealed classes
- Added example for usage with freezed package

# 0.6.1

- Fixed imports issue
- Fixed platform analysis

# 0.6.0

- Removed usage-support as dev_dependency in favor of safer generation

# 0.5.1

- Added @CustomMapper annotation to auto-add custom mappers without needing to do `Mapper.use`
- Fixed decoding issue with nullable types
- Added missing documentation comments

# 0.5.0

- Reworked configuration system - build.yaml now only support global and library level options
- Added support for disabling generation of single methods
- Simplified CustomMappers
- Improved documentation

# 0.4.6

- Changed code generation to handle polymorphism explicitly (using switch statement)
- Fixed issue with multiple levels of inheritance

# 0.4.5

- Added default enum values

# 0.4.4

- Added support for class-specific hooks

# 0.4.3

- Subclasses now inherit field annotations

# 0.4.2

- Added support for encoding/decoding hooks

# 0.4.1

- Added support for null and default discriminators
- Fixed toString generation
- `discriminatorValue` can now be any constant expression

# 0.4.0

- Added support for annotations
- Added some initial tests

# 0.3.8

- Added support for custom discriminator values

# 0.3.7

- Added support for custom iterables and maps
- Improved documentation on decoding lists, sets and maps

# 0.3.6

- Added support for abstract classes and polymorphism using type discriminators

# 0.3.5

- Fixed minified types issue on web

# 0.3.4

- Ignore classes with only private constructors

# 0.3.3

- Changed auto_apply to none

# 0.3.2

- Added support for DateTime

# 0.3.1

- Conditionally apply ignoreNull

# 0.3.0

- Generic type support
- Improved documentation

# 0.2.1+1

- Fixed formatting
- Export BuildOptions and CaseStyle classes

# 0.2.1

- Added support for `.toString()`, `==` and `hashCode` using the `Mappable` mixin

# 0.2.0+1

- Changed builder signature

# 0.2.0

- Support null-safety
- Added code documentation

# 0.1.1+1

- Improved example
- Improved README

# 0.1.1

- Added initial documentation to README
- Added yaml configuration options

# 0.1.0

- Initial development release
