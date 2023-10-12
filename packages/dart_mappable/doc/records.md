## Record Fields

`dart_mappable` supports record fields out of the box.
When you define a class, any field using a record type will be automatically included in the serialization.

```dart
@MappableClass()
class Location with LocationMappable {
  
  const Location({
    required this.name,
    required this.coordinates, 
  });

  final (String, String) name;
  final ({double lat, double lng}) coordinates;
}
```

An instance of this class would be encoded to:

```json
{
  "name": {
    "$1": "John",
    "$2": "Doe"
  },
  "coordinates": {
    "lat": 123,
    "lng": 456
  }
}
```

## Record Aliases

Additionally, you can create record type aliases using annotated typedefs:

```dart
@MappableRecord()
typedef Coordinates = ({double lat, double lng});
```

When using this type for a field of another class, it will be serialized as expected.

This also allows you to serialize records using the standalone generated mapper class as well as the generated extension methods:

```dart
void main() {
  // Using the generated mapper class.
  Coordinates coords  = CoordinatesMapper.fromJson('{"lat": 123, "lng": 456}');
  
  // Using the generated extension methods.
  String json = coords.toJson();
}
```

### Renaming Record Properties

You can also annotate individual fields of a record alias to change the key or add a hook:

```dart
@MappableRecord()
typedef FullName = (@MappableField(key: 'firstName') String, @MappableField(hook: MyHook()) String);
```

This will only work on annotated record type aliases, not inline record fields. 

***Note:** Since typedefs are just an alias for a type, you cannot define two aliases for the same type 
with different `@MappableField()` modifiers. Only one will be used for serialization.*

---

<p align="right"><a href="../topics/Configuration-topic.html">Next: Configuration</a></p>
