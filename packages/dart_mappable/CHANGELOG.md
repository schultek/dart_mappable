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