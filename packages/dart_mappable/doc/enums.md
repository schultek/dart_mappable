To use an enum with `dart_mappable` add the `@MappableEnum` annotation like this:

```dart
@MappableEnum()
enum MyEnum { ... }
```

By default, each enum value will be serialized to its **name** as a `String`. You can also use the **caseStyle** 
configuration option to change the generated values.

## Custom Values

When using the `@MappableEnum()` annotation you can set the `mode` property to one of two `ValuesMode`s for the encoding of enum values:

- `ValuesMode.named` (default) will encode all values to their respective names as `String`s, after applying the optional `caseStyle`.
- `ValuesMode.indexed` will encode all values to their respective index as `int`s.

You can also specify a custom encoded value for each enum value using the `@MappableValue(myCustomValue)` annotation.
It is possible to mix the encoding mode with custom values, and use values of different types.

```dart
@MappableEnum(mode: ValuesMode.indexed)
enum Status {
  zero,                         // encodes to 0
  @MappableValue(200) success,  // encodes to 200
  @MappableValue('error') error // encodes to 'error'
}
```

## Custom Enum Names

You can specify a custom enum name using `@MappableName("myCustomName")`.
If omitted, `toName()` / `name` default to the original enum case name.

```dart
@MappableEnum(mode: ValuesMode.indexed)
enum Status {
  zero,                                // toName: 'zero'
  
  @MappableValue(200) 
  success,                             // toName: 'success'
  
  @MappableValue(r'error$val')
  @MappableName('exception')
  error                                // toName: 'exception'
}

void main() {
  
  // toValue and value are interchangeable
  print(Status.error.toValue()); // error$val
  print(Status.error.value);     // error$val

  // toName and name are interchangeable
  print(Status.error.toName());  // exception
  print(Status.error.name);      // exception
}
```

---

<p align="right"><a href="../topics/Records-topic.html">Next: Records</a></p>
