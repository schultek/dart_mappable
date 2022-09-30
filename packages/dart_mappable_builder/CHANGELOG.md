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