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