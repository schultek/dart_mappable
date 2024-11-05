# RFC: Codable protocol for Dart

This RFC outlines a new serialization protocol for Dart. Designed for use across codebases, packages, generators and tools.

> Originally, I planned this as part of a new dart_mappable v5 release, but I was inspired to make this a separate proposal as it is potentially usable for a lot more. dart_mappable would in the end just use this protocol for its own implementations.

*by @schultek*

# Preface

During the last three years, I created the most powerful and feature-complete mapping and serialization package for Dart, called dart_mappable. During this time I learned a lot about serialization, API design and the state of Darts ecosystem around this topic. This proposal is the result of all these learnings and tries to bring forward a new take on a unified serialization protocol for the ecosystem.

## The Problem with Serialization

Serialization, aka transforming a data class into a serialized data format and back to be sent, received or stored, is a key part of almost all applications. And a key problem to figure out for every programming language and ecosystem. Swift has Codable, Python has pydantic, Rust has serde. Dart has ...?

Currently the Dart ecosystem around serialization is in a bad state. There is no coherent story around serialization at all. The defacto-standard package `json_serialization` is neither doing serialization nor handling JSON. The core `jsonEncode`s reliance on an implicit `toJson()` method is just bad API design. Both completely ignore the fact that there are other serialization formats than JSON. Both are pretty bad in performance, considering what could be achieved.

> Looking at `json_serializable`, I never got its name. Its neither dealing with JSON, nor does it actually serialize anything. It's just **converting** a model to a **Map**. This isn't just a weird naming though, as, especially for less experienced devs, it is misrepresenting important concepts.

An additional challenge is the positioning of `json_serializable` as the (semi-)official or "standard" solution, which makes it exceedingly hard for other good ideas and packages (like dart_mappable, crimson or dogs_core) to gain traction. There is also the `Codec` API, but it is only suitable for low level encodings like base64 or utf8.

<details>
  <summary>More on why `json_serializable` is **not a good standard**.</summary>
  <br/>

First of all, I don't dislike the package itself. It does the things it does very well. My problem is, as stated above, that it's naming is **not** reflecting what it actually does.

What it does is more precisely described as "mapping", which is transforming a object-oriented class into a `Map` of key-value pairs. While the Dart syntax for a `Map` does have similarities to it, this is **not JSON**. It is a structured in-memory representation of your data. JSON on the other hand is a **serial data format**, where the information (bytes) is stored one after another. A `String` in Dart. This is why you have to call `jsonEncode(myMap)` to get *actual* JSON that you can send to an API or store in a file.

And therein lies the second problem of `json_serializable` (and dart_mappable v4 for that matter, as well as many other tools that work in a similar way). To get from a model class to actual json, you first need to convert the class to a Map, and then do a second conversion from a Map to JSON. This is inefficient and slow. A lot slower that if you would just directly go from class to JSON. And this is true for *any* serialization format, not just JSON.

So instead we should aim for a standard that allows you to convert to a Map if you need to, but also allows to directly convert to a serial data format without using the Map in between.

</details>

---

# Design Goals

The goal of the protocol is to have a **universally usable** and **encapsulated** protocol for serializing and deserializing Dart classes in an **optimally performant** way.

**[1] "Universally usable"** means that the protocol can be used for **any** serialized data format (json, csv, yaml, ...) as well as converting to primitive dart objects (Map, List, String, int, double, bool). It also means that it can be used by both "normal" devs and packages or as a generation target for build_runner, or (in the future) macros or other tools (like ide extensions or cli tools).

**[2] "Encapsulated"** means that the protocol has no outside dependencies and, in theory, could even part of dart:convert. *How this could look in practice may be part of the discussion.*

**[3] "Optimally performant"** means that it should be designed for performance, as serialization is a performance critical part of many apps and often a bottleneck. **"Optimally"** specifically means that the protocol should make **no** performance compromises. Therefore its not about enabling "good" performance, its about enabling "optimal" performance.

> My personal reason for **[3]** is that "I can't use it because I need better performance" should never be an argument here. Not because everyone needs optimal performance, but because many *think* they do.

---

# Core Concept

The core protocol consists of the following interfaces:

- `Encoding`/ `Decoding`, for defining the target format (use e.g. `JsonEncoding implements Encoding` for JSON)
- `Encoder` / `Decoder`, for converting a specific type (use e.g. `UriEncoder implements Encoder<Uri>` for Uri)

These can be used together like this:


TODO usage (consuming, example)



The convention is:

- the `Encoder` / `Decoder` defines **what** to en/decode (an Uri)
- the `Encoding` / `Decoding` defines **how** to en/decode (e.g. JSON)

The protocol only defines the interfaces here, the actual implementation is up to the consumer (or packages).

> I made a reference implementation though for JSON, CSV and some example models.

This separation of interfaces (`-ing` and `-er`) allows for a modular approach to serialization. The implementation of the format no longer needs to know (or make implicit assumptions) about the target models.

> Some use-case inspirations:
> - Any code-gen tool (using build_runner, macros or other) would only need to care about creating `Encoder`s/`Decoder`s, not handle the actual serialization. Meaning less fragmentation and more re-use across packages.
> - Packages like `yaml` could expose a custom de/encoding (e.g. `YamlEncoding`) and directly work with any model using the protocol.
> - Packages defining custom models could directly work with any other package or codebase using the protocol.
> - Frameworks like Serverpod or Jaspr or backends like Firebase could acccept any model using the protocol without needing to ship their own serialization solution.

---

## Encodable interface

## Codable interface

## Implementing models

```dart
// Pseudocode for now, not the real interfaces.

class UriEncoder implements Encoder<Uri> {
  @override
  Object? encode(Uri value, Encoding encoding) {
    return encoding.encodeString(value.toString());
  }
}

class UriDecoder with DecoderMixin<Uri> implements Decoder<Uri> {
  @override
  Uri decode(Decoding decoding) {
    return Uri.parse(decoding.decodeString());
  }
}
```

We only looked at a very simple example so far. Here is how this would look for classes with fields:

```dart
// Pseudocode for now, not the real interfaces.

class Person {
  final String name;
  final int age;
}

class PersonEncoder implements Encoder<Person>  {
  @override
  Object? encode(Person value, Encoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    
    keyed.encodeString('name', value.name);
    keyed.encodeInt('age', value.age);
    
    return keyed;
  }
}

class PersonDecoder implements Decoder<Person>  {
  @override
  Person decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    
    return Person(
      name: keyed.decodeString('name'),
      age: keyed.decodeInt('age'),
    );
  }
}
```

---

An important aspect to note here is why the `encode()` or `decode()` methods are not diretly on the model class,
but instead are separate `Encoder` and `Decoder` classes.

First, this way the encoding logic is nicely separated from the model class itself.

More importantly, it allows anyone to define `Encoders` for any type, especially third party or core sdk ones that you don't have control over (you can't add an `encode()` method to `DateTime`, but you can create a `DateTimeEncoder`).

Additionally, some models might have (1) different ways to encode them (e.g. `DateTime` can be encoded either as a unix int, or timestamp String), or (2) need to be configurable in how they encode (e.g. `DateTime` can be encoded as local time, or utc time). (1) is solved by having multiple `Encoder` classes for the same model (e.g. `UnixDateTimeEncoder()` and `IsoDateTimeEncoder()`), which the user can choose from and (2) by making the `Encoder` subclass take constructor parameters (e.g. `DateTimeEncoder({bool convertToUtc})`).

Lastly, it is a soft goal of the protocol to be equivalent for both encoding and decoding, as it makes the API more predictable.

However this means we always need to provide a separate companion object (the `Encoder`) when wanting to encode a value. There is a solution to this though:

## Model Interface

To still 'self-define' a class as being encodable, we introduce the `Encodable<T>` interface, that exposes a `Encoder<T> encoder()` method on the class.

```dart
class Person implements Encodable<Person> {
  final String name;
  final int age;
  
  @override
  Encoder<Person> encoder() => const PersonEncoder();
}
```

That way, a consuming method can accept any `Encodable` model and access its encoder.

---

Sadly, this only works for encoding, not decoding, as we cannot define interfaces for static members in Dart. So an equivalent `Decodable<Person` interface on `Person` that requires a `static Decoder<Person> decoder();` method is not possible.

---

## Interface variants

Before we go into further detail, we need to assess goal **[1]** (universally usable) and **[3]** (optimally performant).

For **[1]** the `Encoding` / `Decoding` interfaces must be able to en/decode to both **structured objects** (aka Map, List, etc) as well as **serialized data** (like a JSON String). However these two types are so different in nature (structured vs serial) that it is not feasible to define one common protocol that also respects **[3]**.

<details><summary>More on why its not feasible.</summary>
  <br/>
Lets look at the following example:

Say we want to encode `Person` to both a `Map<String, dynamic>` and a JSON `String`. The **optimal** implementations looks something like this:

```dart
// Pseudocode

Map encodeToMap(Person value) {
  var map = {};
  map['name'] = value.name;
  map['age'] = value.age;
  return map;
}

String encodeToJson(Person value) {
  var json = StringBuffer('{');
  json.write('"name":');
  json.write('"${value.name}"');
  json.write(',"age":');
  json.write('${value.age}');
  json.write('}');
  return json.toString();
}
```

Whereas for the map, the optimal implementation is just to set the values, the optimal implementation for serial encoding is writing everything in-order into a string buffer.

This becomes even more apparent for decoding:

```dart
// Pseudocode

Person decodeFromMap(Map value) {
  return Person(
    name: value['name'],
    age: value['age'],
  );
}

Person decodeFromJson(String value) {
  final reader = StringReader(value); // suppose this exists
  
  String name;
  int age;
  
  while (reader.hasNextKey()) {
    var key = reader.readNextKey();
    if (key == 'name') {
      name = reader.readNextString();
    } else if (key == 'age') {
      age = reader.readNextInt();
    }
  }
  
  return Person(name: name, age: age);
}
```

For the map, the optimal implementation is just to get the values using the key. As its hash based, the order of which the fields are read is irrelevant.
However for serial decoding the optimal implementation reads the fields in order of how they are encoded. Here the encoded value defines the order in which the fields are decoded, not the implementation.

**Therefore abstracting this into one common interface with separate implementations will have great performance compromises for both sides.**

---

</details>

As a result, there are actual **two sets** of interfaces:

- `StructuredEncoding` / `StructuredDecoding`, to convert a model to structured objects (Map, List, ...)
- `SerialEncoding` / `SerialDecoding`, to convert a model to serial data (JSON, etc.)

with slight, but important differences in their API.

This results in that the `Encoder` and `Decoder` APIs actually need to implement **two** methods, one for structured en/decoding and one for serial en/decoding:

```dart
class PersonEncoder implements Encoder<Person>  {
  @override
  Object? encodeStructured(Person value, StructuredEncoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    
    keyed.encodeValue('name', value.name);
    keyed.encodeValue('age', value.age);
    
    return keyed;
  }
  
  @override
  void encodeSerial(Person value, SerialEncoding encoding) {
    encoding.startObject<String>();
  
    encoder.encodeKey('name');
    encoding.encodeString(value.name);
    encoder.encodeKey('age');
    encoding.encodeInt(value.age);
  
    encoding.endObject();
  }
}
```

and

```dart
class PersonDecoder implements Decoder<Person>  {
  @override
  Person decodeStructured(StructuredDeoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return Person(
      name: keyed.decodeString('name'),
      age: keyed.decodeInt('age'),
    );
  }
  
  @override
  Person decodeSerial(SerialDecoding decoding) {
    late String name;
    late int age;

    for (Object? key; (key = decoding.nextKey()) != null;) {
      switch (key) {
        case 'name': name = decoding.decodeString();
        case 'age': age = decoding.decodeInt();
        default: decoding.skipNext();
      }
    }

    return Person(name: name, age: age);
  }
}
```

While this ensures the optimal performance, it might seem undesirable to have always two methods to implement for the same task.

The reasoning here is that you will rarely actually have to implement the interfaces yourself. Most of the time
the code will be auto-generated by code-gen, or (in the future) macros, or external tooling. Therefore conciseness
is not really a concern for the design of this protocol.

In other words, many many more users will profit from the performance gains than would profit from a more concise API.

BUT: There is an additional utility in the protocol (called `EncoderMixin` / `DecoderMixin`), that does wrap both structured and serial encoding to one common API and lets the user only implement a single method. This can be used where the need for conciseness does outweigh performance requirements, while not affecting everyone else.
  
---

## Creating custom Encodings and Decoding


Also, while the serial variants are abstract and meant to be implemented for a specific format (like `JsonEncoding implements SerialEncoding`), the structured variants are not meant to be subclassed and come with a default implementation that uses extension types for optimal performance.

  
---

# Usage

So far we only looked at how to implement the core interfaces for a model. Let's now look at how to use these together to actually encode or decode something.

But before that we take a quick detour and look at the achieved performance of the reference implementation.

## Performance benchmarks

To benchmark the performance, I compare the protocol ("self") to the "common" way of encoding objects ("other") (commonly `toMap()`, as implemented by `json_serializable`, which is also kinda the same as the usual by-hand implementation).

```text
// Interpret as:
// - This encodes / decodes around 5MB of sample data, running in JIT mode
// - The absolute values are less important, the difference is what counts
// - The "other" way does not have a specialized implementation for json en/decoding, 
     it uses `.toMap()` with an additional `jsonEncode` or `utf8.encode()` call.
  
== MAP DECODING ==
self: 10.04ms
other: 13.652ms
== JSON STRING DECODING ==
self: 53.187ms
other: 82.256ms
== JSON BYTE DECODING ==
self: 34.37ms
other: 110.9ms

== MAP ENCODING ==
self: 37.66ms
other: 55.348ms
== JSON STRING ENCODING ==
self: 41.205ms
other: 134.168ms
== JSON BYTE ENCODING ==
self: 17.735ms
other: 120.372ms
```




  
---

# Current

## Global vs Local Mappers

Currently all mappers are used globally, which has the following implications:

- There can only be a single mapper for a type at a time. (inflexible)
- Mappers must be registered before being able to be used. (easy to forget)
- Once registered, mappers are used for any and all models. (unwanted sideeffects, hard to catch bugs)
- Mappers can be freely registered and un-registered. (unwanted breakage)


## Primitive and Default Mappers

Currently there is no difference in how primitive types, user types and custom types are handled.
All are just mappers. This has the following implications:

- The handling of primitive values goes through the full code path for finding and executing mappers. (slow)
- Primitive mappers can be un-registered or overridden. (unwanted breakage)



# Proposal

The new system should follow these rules:

- No global registry of mappers, mappers are only used "locally".
- "locally" means for zone. Mappers are registered for a zone (and its descendant zones).
- Mapping options (e.g. includeTypeId) are also set based on the zone.
- Primitive types are handled inline and have no mappers.
- Statically inferred mappers are used explicitly and won't use the discovery code path.
- Dynamically used mappers can be used for statically unknown types, but not override statically inferred mappers.
- There will be new APIs for specifying dynamic mappers and options for a zone.

The following APIs will be removed:

- `MapperContainer.globals`
- `MyClassMapper.ensureInitialized()`
- `includeCustomMappers`

The following new APIs will be introduced:

- `fromJson<T>(..., mappers: [...])` and others (top-level functions) (tbd)
- `MyClass.fromJson<T>(..., mappers: [...])`, specifies extra mappers
- `useMappers` on both MappableClass and MappableField, specifies extra mappers statically
- `withMappers(mappers: [...], options: ..., () { ... })`, creates a new zone with mappers and options
- `MyClassMapper()`, generated factory constructor creating singleton instance