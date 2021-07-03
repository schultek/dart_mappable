Imagine a mapping & serialization package with:

- **NO** nasty boilerplate code
- **NO** minified/uglified generated files
- **NO** workarounds
- **NO** compromises

while being able to

- **decode & encode** json
- come with built-in **type & null-safety**
- be **fully configurable**
- support **custom types**, **generics**, **polymorphism** and more.

Sounds too good to be true? Not anymore.

# Dart Mappable

> Have a look at the example!

- [Get Started](#get-started)
- [Configuration](#configuration)
    - [Builder Config](#builder-config)
    - [Annotations](#annotations)
- [Generation Methods](#generation-methods)
- [Utilize Constructors](#utilize-constructors)
- [Case Styles](#case-styles)
- [Lists, Sets and Maps](#lists-sets-and-maps)
  - [Non-Trivial Maps](#non-trivial-maps)
- [Polymorphism and Discriminators](#polymorphism-and-discriminators)
  - [Null and Default Values](#null-and-default-values)
- [Encoding / Decoding Hooks](#encoding--decoding-hooks)
  - [Unmapped Properties](#unmapped-properties)
- [Custom Mappers](#custom-mappers)
  - [Generic Custom Types](#generic-custom-types)
  - [Custom Iterables and Maps](#custom-iterables-and-maps)

> This package is still in active development. If you have any feedback or feature requests, write me and issue on github.

### TODOs

- Different copyWith modi (Basic, Optional, Advanced)
- Choose properties for toString / equals
- Use CaseStyle type in annotations

## Get Started

To get started, add the following lines to your `pubspec.yaml`:

```yaml
dependencies:
  dart_mappable: ^0.6.1
dev_dependencies:
  build_runner: ^1.12.2
```

Next, create a `build.yaml` in the root directory of your package and add this snippet:

```yaml
targets:
  $default:
    builders:
      dart_mappable:
        generate_for:
          - lib/main.dart # modify this if you have a different entry point
        options:
          - include: [YourModelClass, SomeOtherClass] # add the classes you want to enable code generation for
```

In order to generate the serialization code, run the following command:

```shell script
pub run build_runner build
```

You'll need to re-run code generation each time you are making changes to your code. So for development time, use `watch` like this

```shell script
pub run build_runner watch
```

This will generate a `.mapper.g.dart` file for each of your entry points specified in the `build.yaml` file.
Last step is to `import` the generated files wherever you want / need them.

> Hint: This package will generate clean, formatted, and easy to understand code. Have a look at the generated files. 
> I guarantee you won't be drowned in uglified code.

## Configuration

You can use this package and configure the code generation in two different ways. 

- On a global, or library-specific level use the [Builder Config](#builder-config). 
- To configure class-specific options, use [Annotations](#annotations).

You can use either of them, or mix them as you like. 

### Builder Config

This package uses a variety builder options inside your `build.yaml` file 
to specify how your classes should behave when serializing / deserializing. There are a few key-aspects when using build options:

1. All options are optional!
2. Options are inherited by libraries and classes. This means that you can e.g. specify the case style on global, library or class level. 
3. Options on deeper levels override higher level options.
4. Most general properties that you set in the **Builder Config** can be overridden on a class-by-class basis with [Annotations](#annotations).

```yaml
targets:
  $default:
    builders:
      dart_mappable:
        generate_for:
          - lib/main.dart
          - lib/models.dart # multiple independent entry files
        options:

          # use only one of (exclude, include)
          exclude: [ClassA, ClassB] # ignores specific classes, generates code for all else
          include: [ClassC, ClassD] # generates code for specified classes, ignores all else

          # the case style for the map keys, defaults to 'none'
          caseStyle: none # or 'camelCase', 'snakeCase', etc.
          # the case style for stringified enum values, defaults to 'none'
          enumCaseStyle: none # or 'camelCase', 'snakeCase', etc.
          # if true removes all map keys with null values
          ignoreNull: false # or true
          # used as property name for type discriminators
          discriminatorKey: isOfType
          
          # overwrite options for specific libraries
          libraries: 

            # referenced by its entry point (works with files and directory paths)
            lib/main.dart: 
              include: [ClassA] # here: include only class 'ClassA'
              generateMethods: [equals, copy] # here: only generate equals and copy methods
        
            # referenced by its name
            models: 
              exclude: [] # here: include everything
              ignoreNull: true # here: overwrite property to remove keys with null values
              caseStyle: custom(lc,+) # here: set a custom case style (see below)
```

### Annotations

In some cases it is easier to use **Annotations** on classes, that require some special configurations.

There are a total of **five** Annotations that you can use in your code:

1. `@MappableClass()` can be used on a class to specify options like the `caseStyle` of the json keys, whether to ignore null values, or [hooks](#encoding--decoding-hooks).
2. `@MappableEnum()` can be used on a enum to specify the `caseStyle` of the stringified enum values, or the `defaultValue`.
3. `@MappableConstructor()` can be used on a constructor to mark this to be used for decoding. It has no properties.
4. `@MappableField()` can be used on a constructor parameter or a field to specify a json key to be used instead of the field name, or [hooks](#encoding--decoding-hooks). *Note: This can only be used on a field if it is directly assigned as a constructor parameter (`MyClass(this.myField)`). Setting this Annotation on any other field will have no effect. (See [Utilize Constructors](#utilize-constructors) for an explanation why this is.)*
5. `@CustomMapper()` can be used to specify a custom mapper, used alongside the generated mappers. See [Custom Mappers](#custom-mappers) for a details explanation.

> For a more detailed explanation of all the annotation properties, head to the [Api Documentation](https://pub.dev/documentation/dart_mappable/latest/dart_mappable/dart_mappable-library.html).

## Generation Methods

This package can generate a few different sets of methods, which can be activated or deactivated. This makes sure that only code is generated that you actually need.
By default, all methods are generated for each class.

You can set the `generateMethods` property to specify which methods to generate. Either in the **Builder Config** using a List of Strings, or with the **Annotation** using the `GenerateMethods` flags. 
The following methods are supported:

- **decode**: Will generate code used by `Mapper.fromJson`, `Mapper.fromMap` and `Mapper.fromValue`.
- **encode**: Will generate code used by `Mapper.toJson`, `Mapper.toMap` and `Mapper.toValue` as well as the extension methods `toJson` and `toMap`.
- **copy**: Will generate the extension method `copyWith` or `copy`.
- **stringify**: Will generate code used by `Mapper.asString` or when using the `Mappable` mixin's `toString` override.
- **equals**: Will generate code used by `Mapper.isEqual` or when using the `Mappable` mixin's `==` or `hashCode` overrides.

When using **Annotations**, you can specify multiple methods using the *bitwise-or* operator like this: `@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify)`.

## Utilize Constructors

There exist a lot of custom use cases, when it comes to mapping any object. Common ones include renaming fields, ignoring fields, computing values, or custom date or number formats.
Instead of providing custom tailored serialization options for each use-case, this package utilizes the power of constructor arguments to cover all of them. Thereby, you keep full control
over your models, while writing pure and easy dart code.

How does that work exactly: When analysing your code, `dart_mappable` **never looks at the fields** of your model, but rather only at the **constructor arguments**; 
What you do with them - writing to fields, renaming, etc. - is up to your model's implementation. To illustrate this, here are some examples for the above mentioned use cases:

```dart
class Person {
  String name;
  int age;
    
  // basic example, nothing special going on
  Person.base(this.name, this.age);

  // renamed argument, will be 'years': ... in json
  Person.renamed(this.name, int years) : age = years;
  // when renaming arguments, make sure to always have a matching getter for serialization *
  int get years => age;
  
  // ignores the age field completely
  Person.ignored(this.name);
 
  // computed name value
  Person.computed(String firstName, String lastName, this.age) : name = '$firstName $lastName';
  // again: have matching getters for all arguments, reversing the computed value
  String get firstName => name.split(' ')[0];
  String get lastName => name.split(' ')[1];
}

class Event {
  DateTime date;

  // custom formatting as unix timestamp
  Car.format(int timestamp) : date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  int get timestamp => date.millisecondsSinceEpoch;
}
```

> Tip regarding the matching getters: Not-having them won't break your code. 
> However this will lead to desynched serialization (keys missing in your json) and eventually to errors when trying to deserialize back.

> Tip: dart_mappable will always use the first constructor it sees, but you can use a specific constructor using the `@MappableConstructor()` annotation.

## Case Styles

You can specify the case style for the json keys and your stringified enum values. Choose one of the existing styles or specify a custom one.

Currently supported are:
```yaml
none / unmodified: keeps your field names as the are (default)
camelCase: myFieldName -> myFieldName (dart default)
pascalCase: myFieldName -> MyFieldName
snakeCase: myFieldName -> my_field_name
paramCase: myFieldName -> my-field-name
lowerCase: myFieldName -> myfieldname
upperCase: myFieldName -> MYFIELDNAME
```

You can also specify a custom case style using the `custom(ab,c)` syntax. 
- The letters before the comma define how to transform each word of a field name. They can be either `l` for `lowerCase`, `u` for `upperCase`, or `c` for `capitalCase`.
When using only one letter, it is applied to all words. When using two letters, the first one is applied to only the first word and the second one to all 
remaining words.
- The one letter after the comma defines the separator between each word, like `_` or `-`. This can be any character or empty.

Here are some examples that can be achieved using this syntax:
```yaml
custom(u,_): myFieldName -> MY_FIELD_NAME
custom(uc,+): myFieldName -> MY+Field+Name
custom(cl,): myFieldName -> Myfieldname
```


## Lists, Sets and Maps

We support lists, sets and maps out of the box, without any special syntax, workarounds or hacks. Just use `Mapper.fromJson` as you normally would:

```dart

class Dog with Mappable {
  String name;
  Dog(this.name);
}

class Box<T> with Mappable {
  T content;
  Box(this.content);
}

void main() {

  // simple list
  List<int> nums = Mapper.fromJson('[2, 4, 105]');
  print(nums); // [2, 4, 105]

  // set of objects
  Set<Dog> dogs = Mapper.fromJson('[{"name": "Thor"}, {"name": "Lasse"}, {"name": "Thor"}]');
  print(dogs); // {Dog(name: Thor), Dog(name: Lasse)}

  // or more complex lists, like generics
  List<Box<double>> boxes = Mapper.fromJson('[{"content": 0.1}, {"content": 12.34}]');
  print(boxes); // [Box(content: 0.1), Box(content: 12.34)]
}
```

There is also the `Mapper.fromIterable` method. This can be used if you already have a list of dynamic objects instead of the raw json string.
Additionally this can get handy to decode a dynamic list of partly-encoded values:

```dart
List<double> myNumbers = Mapper.fromIterable([2.312, '1.32', 500, '1e4']);
print(myNumbers); // [2.312, 1.32, 500.0, 10000.0]
```
  
### Non-Trivial Maps  
  
We also support decoding of non-trivial maps.
Although the use-cases might be rare, you can decode to something other than a map of string keys like this:

```dart
var encodedMap = {
  {'name': 'Bonny'}: 1,
  {'name': 'Clyde'}: 5,
};

Map<Dog, int> treatsPerDog = Mapper.fromValue(encodedMap);
print(treatsPerDog[Dog('Clyde')]!); // 5

var myMap = Mapper.toValue(treatsPerDog);
print(myMap); // {{name: Bonny}: 1, {name: Clyde}: 5}
```

> Make sure to mixin `Mappable` on your key class, in order to enable easy property access

> Since json only supports string keys, we can't do `Mapper.fromJson` or `Mapper.toJson` on these maps. You would have to decode / encode your keys and values separately.



## Polymorphism and Discriminators

A common pattern that you might want to use for your classes is polymorphism. As a simple example see the classes below. 

```dart
abstract class Animal with Mappable {
  String name;
  Animal(this.name);
}

class Cat extends Animal {
  String color;
  Cat(String name, this.color) : super(name);
}

class Dog extends Animal {
  int age;
  Dog(String name, this.age) : super(name);
}
```

Now when we want to encode a `Home` object, the `pet` property can either be a `Cat` or a `Dog`. 
To make sure that this information isn't lost when converting to json, we need to add a **discriminator property**, that keeps track of the specific type of the `pet`.

By default no discriminator is applied, but you can change this by setting the `discriminatorKey` annotation property or in the build configuration. The value
of this property will default to the name of the class, but you can change this as well with the `discriminatorValue` annotation property.
Make sure to specify the `discriminatorKey` property globally or on the base class - `Animal` in our example - and the `discriminatorValue` property
on each of the child classes - `Cat` and `Dog` in our case.

```dart

@MappableClass(discriminatorKey: 'type')
abstract class Animal with Mappable {
  ...
}

...

void main() {
  // encode a polymorphic class
  String catJson = Mapper.toJson(Cat('Judy', 'Black'));
  print(catJson); // {"name":"Judy","color":"Black","type":"Cat"}

  Animal myPet = Mapper.fromJson(catJson); // implicit decoding as an 'Animal'
  print(myPet.runtimeType); // Cat

  // explicit decoding also works as usual without a discriminator
  Cat myCat = Mapper.fromJson('{"name": "Kitty", "color": "Brown"}');
  print(myCat.name); // Kitty
}
```

### Null and Default Values

There are two additional cases that you might want to cover. Either your discriminator property is `null`, or some other value, that you did not specify.

1. For the `null` case, you can explicitly set the `discriminatorValue` property to `null` and this will work as expected.
2. For the other case, you can specify a fallback class to be used whenever we come across an unknown discriminator value. On this class set the `discriminatorValue` to `MappableClass.useAsDefault`.
  
```dart
@MappableClass(discriminatorValue: null)
class NullAnimal extends Animal {
  NullAnimal(String name) : super(name);
}

@MappableClass(discriminatorValue: MappableClass.useAsDefault)
class DefaultAnimal extends Animal {
  String type;
  DefaultAnimal(String name, this.type) : super(name);
}

void main() {
  // decode json with the discriminator set to null (same as missing property)
  Animal animal1 = Mapper.fromJson('{"name": "Scar", "type": null}');
  print(animal1.runtimeType); // NullAnimal

  // decode json with unknown discriminator value
  Animal animal2 = Mapper.fromJson('{"name": "Balu", "type": "Bear"}');
  print(animal2.runtimeType); // DefaultAnimal
  print(animal2.type); // Bear
}
```

## Encoding / Decoding Hooks

Hooks provide a way to hook into the encoding and decoding process for a class or single field. 
When using hooks, you have the possibility to inspect and modify values before and after they are encoded or decoded.

To use hooks, create a custom class extending the `MappingHooks` class, and set this as the `hooks` argument of either the `MappableClass` or `MappableField` annotation like this:

```dart
class GameHooks extends MappingHooks {
  const GameHooks();
}

class PlayerHooks extends MappingHooks {
  const PlayerHooks();
}

@MappableClass(hooks: GameHooks())
class Game {
  @MappableField(hooks: PlayerHooks())
  Player player;

  Game(this.player);
}

class Player {
  String id;
  Player(this.id);
}
```

Now, whenever an instance of `Game` is encoded or decoded, the `GameHooks` will be applied to the class and the `PlayerHooks` will be applied to the `player` field. 
Inside your hooks class, you have four methods that you can override:

- `dynamic beforeDecode(dynamic value)`
- `dynamic afterDecode(dynamic value)`
- `dynamic beforeEncode(dynamic value)`
- `dynamic afterEncode(dynamic value)`

Each method takes a dynamic value and returns an optionally modified value.

> Tip: If the `beforeDecode` hook already returns an instance of the target type, the normal decoding logic is effectively skipped. The same is true for the `beforeEncode` hook.
> This gives you the possibility to effectively define custom mappers, especially on a field-by-field level.

A simple use-case for this would be to modify the input json before an object is decoded. 
In the example below, the player field can either be a full json object, or a single string. 
The string would then be treated as the id of the player.

```dart
class PlayerHooks extends MappingHooks {
  const PlayerHooks();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is String) {
      return {'id': value};
    }
    return value;
  }
}

...

void main() {
  // This works as usual
  Game game = Mapper.fromJson('{"player": {"id": "Tom"}}');
  print(game.player.id); // Tom;

  // Special case: 'player' is a string instead of an object
  Game game2 = Mapper.fromJson('{"player": "John"}');
  print(game.player.id); // John
}
```

Additionally, it is important to note that field- and class-hooks are inherited by any subclasses. 
When both the superclass and the subclass define class-hooks, both are applied in the following order:
`super.beforeDecode -> sub.beforeDecode -> decode -> sub.afterDecode -> super.afterDecode`. For field-hooks, only the sub-class-hook is applied.

### Unmapped Properties

A frequently needed use-case for hooks is to catch additional, unmapped properties from json when decoding an object. 
Because of this, we provide a ready-to-use `MappingHook` called `UnmappedPropertiesHooks`.

To use this hook, define a `Map<String, dynamic>` field in your class, and provide it's name to the `UnmappedPropertiesHooks` constructor. 
Be aware that you have to provide the matching json key of the field (after applying the case style, etc.) instead of the dart field name.

```dart
@MappableClass(hooks: UnmappedPropertiesHooks('unmapped_props'))
class Game {
  String id;
  Map<String, dynamic> unmappedProps;

  Game(this.id, this.unmappedProps);
}

void main() {
  Game game = Mapper.fromJson('{"id": 1, "type": "pacman", "score": 100}');
  print(game.id); // 1
  print(game.unmappedProps); // {type: pacman, score: 100}
}
```

## Custom Mappers

You can create custom mappers to serialize / deserialize custom types that are not part of the generated code like this:

```dart
@CustomMapper()
class CustomStringMapper extends SimpleMapper<String> {
  @override
  String decode(dynamic value) {
    return (value as String).substring(1);
  }
  
  @override
  dynamic encode(String self) {
    return '_$self';
  }
}
```

There are also additional methods you can override, like `stringify`, or `equals`.
This will enable `Mapper.isEqual` and `Mapper.asString` on this type.

Using the `@CustomMapper()` annotation, this mapper will automatically be registered and used by the library. 
Or, you can instead register a custom mapper dynamically using `Mapper.use<MyClass>(MyCustomMapper())` and unregister using `Mapper.unuse<MyClass>()`.
This might come in handy if you want to switch between different custom mappers for the same type. Also, be aware that you can also `unuse()` (and replace) any mappers, both custom, generated, and mappers of primitive types. 

### Generic Custom Types

When dealing with generic types, we need a more sophisticated syntax for decoding. 
Instead of extending `SimpleMapper` you have to extend `BaseMapper` when wanting to decode a generic class.
Next, instead of overriding the `decode` function, specify a `decoder` getter, which must be a function that can accept up to three additional type arguments.

You also need to construct a `typeFactory` as shown below.

```dart
class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

@CustomMapper()
class CustomGenericMapper extends BaseMapper<GenericBox> { // only use the base type here

  @override
  Function decoder = <T>(dynamic value) { // specify the decoder as a generic function
    return GenericBox<T>(Mapper.fromValue<T>(value)); // use the type parameter in your decoding logic
  };
  
  @override
  Function encoder = (GenericBox self) { // no need for type parameters here
    return Mapper.toValue(self.content);
  };

  // in case of generic types, we also must specify a type factory. This is a special type of 
  // function used internally to construct generic instances of your type.
  // specify any type arguments in alignment to the decoder function
  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}
```

### Custom Iterables and Maps

For special Iterable and Map types, you can of course specify `CustomMapper`s as described in the previous section.
However, we provide ready-to-use `IterableMapper` and `MapMapper` to make your life a little bit easier:

For both you have to provide 
1. a factory function, which converts a generic iterable / map to your special implementation, 
2. a type factory, similar to the one used in generic custom mappers.

```dart
Mapper.use(IterableMapper<HashSet>(
  <T>(Iterable<T> i) => HashSet.of(i),
  <T>(f) => f<HashSet<T>>(),
));

Mapper.use(MapMapper<HashMap>(
  <K, V>(Map<K, V> m) => HashMap.of(m),
  <K, V>(f) => f<HashMap<K, V>>(),
));

HashSet<Brand> brands = Mapper.fromJson('["toyota", "audi", "audi"]');
print(brands); // {Brands.Toyota, Brands.Audi}
```