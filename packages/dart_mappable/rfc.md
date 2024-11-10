# RFC: Codable protocol for Dart

This RFC outlines a new serialization protocol for Dart. Designed for use across codebases, packages, generators and tools.

> Originally, I planned this as part of a new dart_mappable v5 release, but I was inspired to make this a separate proposal as it is potentially usable for a lot more. dart_mappable would in the end just use this protocol for its own implementations.

*by @schultek*

# Preface

During the last three years, I created the most powerful and feature-complete mapping and serialization package for Dart, called dart_mappable. During this time I learned a lot about serialization, API design and the state of Darts ecosystem around this topic. This proposal is the result of all these learnings and tries to bring forward a new take on a unified serialization protocol for the ecosystem.

## The Problem with Serialization

Serialization, aka transforming a data class into a serialized data format and back to be sent, received or stored, is a key part of almost all applications. And a key problem to figure out for every programming language and ecosystem. Swift has Codable, Python has pydantic, Rust has serde. Dart has ...?

Currently, the Dart ecosystem around serialization is in a bad state. There is no coherent story around serialization at all. The defacto-standard package `json_serialization` is neither doing serialization nor handling JSON. The core `jsonEncode`s reliance on an implicit `toJson()` method is just bad API design. Both completely ignore the fact that there are other serialization formats than JSON. Both are pretty bad in performance, considering what could be achieved.

> Looking at `json_serializable`, I never got its name. Its neither dealing with JSON, nor does it actually serialize anything. It's just **converting** a model to a **Map**. This isn't just a weird naming though, as, especially for less experienced devs, it is misrepresenting important concepts.

An additional challenge is the positioning of `json_serializable` as the (semi-)official or "standard" solution. Many other packages depend either on `json_serializable` directly or its conventions (e.g. having a specific `toJson()` on the model) to support serialization, like `freezed`, `retrofit` or `serverpod`. On the one hand this locks users in, without having much control over serialization. On the other hand packages are [kind of forced](https://github.com/schultek/dart_mappable/issues/82) to be compatible to it if they want to be adopted in the ecosystem. This causes a negative feedback loop.

<details>
  <summary>More on why `json_serializable` is **not a good standard**.</summary>
  <br/>

First of all, I don't dislike the package itself. It does the things it does very well. And it solved a problem that was previously unsolved. My problem is, as stated above, that it's naming is **not** reflecting what it actually does..

What it does (or specifically the generated `toJson()` method) is more precisely described as "mapping", which is transforming an object-oriented class into a `Map` of key-value pairs. While the Dart syntax for a `Map` does have similarities to it, this is **not JSON**. It is a structured in-memory representation of your data. JSON on the other hand is a **serial data format**, where the information (bytes) is stored one after another. A `String` in Dart. This is why you have to call `jsonEncode(myMap)` to get *actual* JSON that you can send to an API or store in a file.

And therein lies the second problem of `json_serializable` (and dart_mappable v4 for that matter, as well as many other tools that work in a similar way). To get from a model class to actual json, you first need to convert the class to a Map (using `.toJson()`), and then do a second conversion from a Map to JSON (using `jsonEncode`). This is very inefficient, and a lot slower than if you would directly go from model to JSON, without creating the `Map` in between. And this is true for *any* serialization format, not just JSON.
</details>

**It is time we rethink serialization in Dart and aim for a standard that is modular, performant and allows to convert to and from *any* data format (structured or serial) efficiently.**

# Design Goals

The goal of the protocol is to have a **modular** and **universally usable** protocol for serializing and deserializing Dart classes in an **optimally performant** way.

**[1] "Modular"** means that the protocol is flexible in how it is used. Developers may use as much or as little of it as they need, have control over its parts and extend it

**[2] "Universally usable"** means that the protocol can be used for **any** serialized data format (json, csv, yaml, ...) as well as structured objects (like Map). It also means that it can be used by both app developers, package authors or as a generation target for build_runner, or (in the future) macros or other tools (like ide extensions or cli tools).

**[3] "Optimally performant"** means that it should be designed for performance, as serialization is a performance critical part of many apps and often a bottleneck. **"Optimally"** specifically means that the protocol should make **no** performance compromises. Therefore its not about enabling "good" performance, its about enabling "optimal" performance.

> My personal reason for **[3]** is that "I can't use it because I need better performance" should never be an argument here. Not because everyone needs optimal performance, but because many *think* they do.

> A fourth goal is obviously acceptance and adaption in the ecosystem, but this can only be done together with the community and (maybe even) the Dart team. Therefore spread the word about the proposal and lets discuss.

# Core Concept

The core protocol consists of the following interfaces:

- `Encoding` & `Decoding`, for defining the target format (use e.g. `JsonEncoding implements Encoding` for JSON)
- `Encoder` & `Decoder`, for converting a specific type (use e.g. `UriEncoder implements Encoder<Uri>` for Uri)

As you see this separates the *how* from the *what* in terms of encoding and decoding.

- the `Encoding` / `Decoding` defines **how** to en/decode (e.g. Map, JSON, YAML, CSV, ...)
- the `Encoder` / `Decoder` defines **what** to en/decode (your own or external models, e.g. Person, Uri, ...)

The protocol only defines the interfaces here, the actual implementation is up to the consumer (developer or packages).

> I made reference implementations though for Map, JSON and CSV. Mainly for benchmarking, but this could also ship as a default set of implementations alongside the protocol.

This separation of interfaces (`-ing` and `-er`) allows for a modular approach to serialization. The implementation of the format no longer needs to know (or make implicit assumptions) about the target models. As well as the other way around, where the model does not need to know about the format.

Let's look at some implications and use-cases of this:

1. Any code-gen tool (using build_runner, macros or other) would only need to care about creating `Encoder`s/`Decoder`s, not handle the actual serialization. Meaning less work for the author, and more flexibility for the consumer.
2. Packages like `yaml` could expose a custom de/encoding (e.g. `YamlEncoding`) and directly work with any model using the protocol.
3. Packages defining custom models could directly work with any other package or codebase using the protocol.
4. Frameworks like Serverpod or Jaspr or backends like Firebase could acccept any model using the protocol without needing to ship their own serialization solution.

> The following sections are meant to be read in order. We start with the core, assess assumptions, discover interfaces, explain reasoning and eventually reclaim the `fromX()` and `toX()` methods. Stay with me.

# Model Definition

The following shows an example implementation for de/encoding a `Person` class:

```dart
// Pseudocode for now, not the real interfaces.

class Person {
  final String name;
  final int age;
}

class PersonEncoder implements Encoder<Person>  {
  @override
  void encode(Person value, Encoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    
    keyed.encodeString('name', value.name);
    keyed.encodeInt('age', value.age);
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

As you see we create two classes `PersonEncoder` and `PersonDecoder` that implement the respective interfaces. 
In the overridden `encode` and `decode` methods use the provided `Encoding` and `Decoding` instances.

> This proposal does not specify how the above implementations are created. You can use code-gen, 
> ide tools or write it manually. Or even use different approaches for different models.

---

An important aspect to note here is why the `encode()` or `decode()` methods are not diretly on the model class,
but instead use separate `Encoder` and `Decoder` classes.

First, this way nicely separates the encoding logic from the model class itself.

More importantly, it allows anyone to define `Encoders` for any type, especially third party or core sdk ones that you don't have control over (you can't add an `encode()` method to `DateTime`, but you can create a `DateTimeEncoder`).

Additionally, some models might have (1) different ways to encode them (e.g. `DateTime` can be encoded either as a unix int, or timestamp String), or (2) need to be configurable in how they encode (e.g. `DateTime` can be encoded as local time, or utc time). (1) is solved by having multiple `Encoder` classes for the same model (e.g. `UnixDateTimeEncoder()` and `IsoDateTimeEncoder()`), which the user can choose from and (2) by making the `Encoder` subclass take constructor parameters (e.g. `DateTimeEncoder({bool convertToUtc})`).

There is also another reason to support more complex setups like generic classes or polymorphism, which are discussed later. Though these are not directly part 
of the protocol, they are enabled by it.

Lastly, it is a soft goal of the protocol to be equivalent for both encoding and decoding, as it makes the API more predictable.

However, this means we always need to provide a separate companion object (the `Encoder`) when wanting to encode a value. There is a solution to this though:

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

Sadly, this only works for encoding, not decoding, as we cannot define interfaces for static members in Dart. 
So an equivalent `Decodable<Person` interface on `Person` that requires a `static Decoder<Person> decoder();` method is not possible.


## Interface variants

Before we go into further detail, we need to assess goal **[2]** (universally usable) and **[3]** (optimally performant).

For **[2]** the `Encoding` / `Decoding` interfaces must be able to en/decode to both **structured objects** (aka Map, List, etc) as well as **serialized data** (like a JSON String). 
However these two types are so different in nature (structured vs serial) that it is not feasible to define one common protocol that also respects **[3]**.

<details><summary>More on why its not feasible.</summary>
  <br/>
Lets look at the following example:

Say we want to decode `Person` from both a `Map<String, dynamic>` and a JSON `String`. The **optimal** implementations looks something like this:

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

For the map, the optimal implementation is just to access the values using the key. As it is hash based, the order of which the fields are read is irrelevant.
However, for serial decoding the optimal implementation reads the fields in order of how they occur. Here the encoded value (the JSON String) defines the order in which the fields are decoded, not the implementation.

> This difference also exists, although not that drastic, for encoding.

**Therefore, abstracting this into one common interface with separate implementations would have great performance compromises for both sides.**

---

</details>

As a result, the protocol actually defines **two sets** of interfaces:

- `StructuredEncoding` / `StructuredDecoding`, to convert a model to structured data (Map, etc.)
- `SerialEncoding` / `SerialDecoding`, to convert a model to serial data (JSON, etc.)

with slight, but important differences in their API.

Consequently, the `Encoder` and `Decoder` APIs need to implement **two** methods, one for structured en/decoding and one for serial en/decoding:


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

and

```dart
class PersonEncoder implements Encoder<Person>  {
  @override
  void encodeStructured(Person value, StructuredEncoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    
    keyed.encodeValue('name', value.name);
    keyed.encodeValue('age', value.age);
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

While this ensures the optimal performance, it might seem undesirable to have always two methods to implement for the same task.

The reasoning here is that you will rarely actually have to implement the interfaces yourself. Most of the time
the code will be auto-generated by code-gen, or (in the future) macros, or external tooling. In those cases conciseness
is not a concern.

If you want to implement these interfaces manually though - and don't want to implement both methods - the protocol comes with
and additional utility called `EncoderMixin` / `DecoderMixin` that wraps both structured and serial encoding into one common API.
This then has the performance cost as described above, but only for the specific model this is used for.

> In conclusion, I think **many** more users will profit from the performance gains of the two interfaces than would profit from a more concise API.

# Performance benchmarks

Talking about performance, lets look at what we can expect from this protocol.
For this benchmark, I compare the protocol ("codable") to the "common" way of encoding objects ("baseline").

```text
// Interpret as:
// - This encodes / decodes around 10MB of sample data, running in JIT mode
// - The absolute values are less important, the difference is what counts
// - The "baseline" way does not have a specialized implementation for json en/decoding, 
     it uses `.toJson()` with an additional `jsonEncode` or `utf8.encode()` call.
  
== MAP DECODING ==
codable: 21.773ms
baseline: 37.764ms
== JSON STRING DECODING ==
codable: 111.153ms
baseline: 177.185ms
== JSON BYTE DECODING ==
codable: 68.462ms
baseline: 323.199ms

== MAP ENCODING ==
codable: 99.498ms
baseline: 120.8ms
== JSON STRING ENCODING ==
codable: 77.439ms
baseline: 254.927ms
== JSON BYTE ENCODING ==
codable: 62.786ms
baseline: 264.513ms
```

Key takeaways:
- The protocol is always faster ;)
- For map de/encoding, the performance difference is negligible. The added interfaces and abstraction layer of the protocol does not have a negative impact on the performance.
- For json de/encoding, the protocol implementation is significantly faster than the baseline, since it avoids the overhead of converting to a Map first.

# Consuming the protocol

> "Consuming" as in actually de/encoding something using the protocol and its implementations.

Actually, the protocol itself does not strictly define in code how to consume it, in terms of using and combining its different parts. This
is because:

1. It should be flexible enough to be used in both user codebases and packages
2. There are different usage patterns depending on whether the consuming code is in a user codebase, a package that
extends the protocol (e.g. provides a format, provides data models, other utility) or a package that only uses the protocol internally.

> A result of having a super flexible protocol ...  
> ....it can be used very flexibly.

However, there are of course rules that consumers should adhere to in order to make things play nicely with each other.

The general gist of things is:

- Models should at minimum expose a `Decoder` and `Encoder` for itself.
- Formats should at minimum accept any `Decoder` and `Encoder`.
- Both can add additional convenience objects, methods or extensions.

Tools like code-generators or macros may wrap this with their own API, as long as they don't prevent the user from accessing
the underlying protocol, as this would defeat the purpose of being usable across packages.

> For example with dart_mappable I will create additional abstractions around this, with escape hatches to access the underlying protocol.

## Model Rules

*Rules that models implementations should adhere to. Using Person as an example.*

### 1. Implement `Encodable` where possible.

If you control a model, add the `Encodable` interface to it. This exposes a `Encoder` directly on the model:

  ```dart
  class Person implements Encodable<Person> {
    @override
    Encoder<Person> encoder() => /* ... e.g. PersonEncoder() */;
  }
  ```

### 2. Create a `Codable` implementation.

The `Codable` interface simply combines both the `Encodable` and `Decodable` interfaces. It should be used
to create a wrapper object that can be passed around and knows how to decode and encode a model.

```dart
class PersonCodable implements Codable<Person> {
  // Should have a public constructor. Const if possible.
  const PersonCodable();
  
  // Inherited from the Encodable interface.
  @override
  Encoder<Person> encoder() => /* ... e.g. PersonEncoder() */;
  
  // Inherited from the Decodable interface .
  @override
  Decoder<Person> decoder() => /* ... e.g. PersonDecoder() */;
}
```

With this, the `Encoder` and `Decoder` implementations itself don't need to be public anymore, as third parties can 
get them through `PersonCodable().encoder()` and `PersonCodable().decoder()` respectively.

### 3. Expose the `Codable` implementation where possible.

If you control a model, expose the `Codable` implementation of a model as a static method:

```dart
class Person {
  static Codable<Person> codable() => const PersonCodable();
}
```

With this, the `Codable` implementation itself doesn't need to be public anymore, as third parties can
get them through `Person.codable()`.

---

By combining **2** and **3** users can:

- get a `Codable` for `Person` via `Person.codable()`
- get a `Encoder` for `Person` via `Person.codable().encoder()`
- get a `Decoder` for `Person` via `Person.codable().decoder()`

> Read on to see everything come together.

## Format Rules

*Rules that format implementations should adhere to. Using JSON as an example.*

### 1. Use private constructors.

On the `Decoding` and `Encoding` implementations use private constructors so no third-party code
can create instances.

```dart
class JsonDecoding implements SerialDecoding {
  JsonDecoding._();
}

class JsonEncoding implements SerialEncoding {
  JsonEncoding._();
}
```

### 2. Expose static `decode` and `encode` methods.

On the `Decoding` implementation expose a static `decode` method accepting the raw value and a `Decoder`:

```dart
class JsonDecoding implements SerialDecoding {
  
  static T decode<T>(String json, Decoder<T> decoder) {
    // Implement the decoding, usually:
    // 1. Create a new instance: `final decoding = JsonDecoding._();`
    // 2. Call `decodeObject`: `return decoding.decodeObject(decoder);`
  }
}
```

Others can call this using:

`JsonDecoding.decode(json, Person.codable().decoder())`.

---

On the `Encoding` implementation expose a static `encode` method accepting the model and an `Encoder`:

```dart
class JsonEncoding implements SerialEncoding {
  
  static String encode<T>(T value, Encoder<T> encoder) {
    // Implement the encoding, usually:
    // 1. Create a new instance: `final encoding = JsonEncoding._();`
    // 2. Call `encodeSerial`: `encoder.encodeSerial(value, encoding);`
    // 3. Return the encoded value: `return encoding.output.toString();`
  }
}
```

Others can call this using:

`JsonEncoding.encode(person, Person.codable().encoder())`.

### 3. Create `fromX()`/`toX()` extensions on `Decodable` and `Encodable`

> Now we are harvesting the fruits of our labor.

A format should create extensions to add `fromX()` and `toX()` methods
to the interfaces. This allows for a convenient and familiar (de)serialization experience.

```dart
extension JsonDecodable<T> on Decodable<T> {
  T fromJson(String json) {
    return JsonDecoding.decode<T>(json, decoder());
  }
}

// Variant A, on an external Encodable
extension JsonEncodable<T> on Encodable<T> {
  String toJson(T value) {
    return JsonEncoding.encode<T>(value, encoder());
  }
}

// Variant B, on a model Encodable.
//
// This works (and overrides the other toJson) as the 
// extension has a higher specificity as variant A.
extension JsonEncodableModel<T extends Encodable<T>> on T {
  String toJson() {
    return JsonEncoding.encode<T>(this, encoder());
  }
}
```

Which can be used like this, respectively:

- `final Person person = Person.codable().fromJson(json);`
- `final String json = Person.codable().toJson(person);`
- `final String json = person.toJson();`

---

Enabling the `fromX()` / `toX()` paradigm like this has a lot of advantages:

1. Separate methods for each used format, e.g. `toMap()`, `toJson()`, `toYaml()`, etc.
2. You can control access to these methods simply by importing the formats, and without modifying each model (e.g. importing `package:yaml` would instantly add `.toYaml()` to all your models).
3. You can create your own extensions if you prefer a different naming (e.g. `Map<String, dynamic> toJson()` instead of `Map<String, dynamic> toMap()`).
4. You can freely and without conflict add methods to your models, as instance methods override extensions (e.g. adding a `toJson()` directly to the model is still possible).
5. Adding a static `fromX` directly on the model class is of course also still possible, but not required.

---

---

# Thanks for reading

> Thanks for reading this far. You've reached the end of the core RFC.
> Next step: Give feedback and spread the word. We can only make this a reality together. 💙

Things to check out:

- Core protocol: [tbd]()
- Benchmark: [tbd]()
- JSON reference implementation: [tbd]()
- Map reference implementation: [tbd]()
- CSV reference implementation: [tbd]()

> Below are some more special considerations for generics and polymorphism. 

---

---

# Generics

TODO

# Polymorphism

TODO