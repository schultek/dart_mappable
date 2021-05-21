Imagine a mapping & serialization package with:

- **NO** boilerplate code (Nothing at all, ZERO lines of code)
- **NO** minified/uglified generated files
- **NO** need for annotations ("Don't @ me...")
- **NO** extra dependencies (Yes, not even to this package*)

while still being able to

- **decode & encode** json
- come with built-in **type & null-safety**
- be **fully configurable**
- support **custom types**, **generics** and **polymorphism**

Sounds too good to be true? Not anymore.

# Dart Mappable

> Have a look at the example!

- [Coming Soon](#coming-soon)
- [Get Started](#get-started)
- [Configuration](#configuration)
    - [Builder Config](#builder-config)
    - [Annotations](#annotations)
- [Case Styles](#case-styles)
- [Utilize Constructors](#utilize-constructors)
- [Custom Types](#custom-types)
- [Lists, Sets and Maps](#lists-sets-and-maps)
  - [Non-Trivial Maps](#non-trivial-maps)
  - [Custom Mappers](#custom-mappers)
- [Polymorphism and Discriminators](#polymorphism-and-discriminators)

## Coming Soon

- Field-Specific Type-Converters
- Unmapped properties

> This package is still in active development. If you have any feedback or feature requests, write me and issue on github.

## Get Started

This package is designed to be purely usable as a `dev_dependency`. No need to import this package anywhere in your code.
To get started, add the following lines to your `pubspec.yaml`:

```yaml
dev_dependencies:
  dart_mappable: ^0.4.1
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
```

In order to generate the serialization code, run the following command:

```shell script
pub run build_runner build
```

You'll need to re-run code generation each time you are making changes to your code. So for development time, use watch like this

```shell script
pub run build_runner watch
```

This will generate a `.mapper.g.dart` file for each of your entry points specified in the `build.yaml` file.
Last step is to `import` the generated files wherever you want / need them.

> Hint: This package will generate clean, formatted, and easy to understand code. Have a look at the generated files. 
> I guarantee you won't be drowned in uglified code.

## Configuration

You can use this package and configure your classes in two different ways. 
Either with a **Builder Config** or with **Annotations**. 
You can use either of them, or mix them as you like on a class-by-class basis, since they have strong feature-parity.

When only using the **Builder Config** as seen below, you can use this package purely as a `dev_dependency`. 
However when you like to use **Annotations**, you have to use specify a normal dependency to this package.

> The **Builder Config** supports global and library level configurations, while **Annotations** naturally only support class level configurations. 
> So when mixing the two options, a good practice would be to specify the global defaults in the **Builder Config**, and then overwrite some of them 
> on a class-by-class basis with **Annotations**, depending on your use-case.

### Builder Config

Instead of clustering your code with annotations, this package uses builder options inside your `build.yaml` file 
to specify how your classes should behave when serializing / deserializing. All options are optional!

```yaml
targets:
  $default:
    builders:
      dart_mappable:
        generate_for:
          - lib/main.dart
          - lib/models.dart # multiple independent entry files
        options:

          # use only one of (exclude, include) or none, which then generates code for all classes
          exclude: [ClassA, ClassB] # ignores specific classes, generates code for all else
          include: [ClassC, ClassD] # generates code for specified classes, ignores all else

          # the case style for the map keys, defaults to 'none'
          caseStyle: none # or 'camelCase', 'snakeCase', etc.
          # the case style for stringified enum values, defaults to 'none'
          enumCaseStyle: none # or 'camelCase', 'snakeCase', etc.
          # if true removes all map keys with null values
          ignoreNull: false # or true
          # used as property name for type discriminators, defaults to '_type'
          discriminatorKey: isOfType
          
          # overwrite options for specific libraries
          libraries: 

            # referenced by its entry point (also for implicit libraries)
            lib/main.dart: 
              include: [ClassA] # here: include only class 'ClassA'

              # overwrite options for specific classes
              classes: 
                ClassA: # name of the class
                  constructor: decode # specify a named constructor to use (instead of using the default)
                  caseStyle: camelCase # overwrite the caseStyle
                  discriminatorValue: my-class # set a custom value for the discriminator property
                  fields: # overwrite the string mapping for specific fields
                    someField: _my+special:json_key
              
              # overwrite options for specific enums
              enums:
                MyEnum:
                  caseStyle: snakeCase # overwrite the caseStyle
            
            # referenced by its name
            models: 
              exclude: [] # here: include everything
              ignoreNull: true # here: overwrite property to remove keys with null values
              caseStyle: custom(lc,+) # here: set a custom case style (see below)
```

> Options are inherited by libraries and classes. This means that you can e.g. specify the case style on global, library or class level. Options on deeper levels override higher level options.

### Annotations

In some cases it is easier to use **Annotations** on classes, that require some special configurations. 
There are a total of **four** Annotations that you can use in your code:

1. `@MappableClass()` can be used on a class to specify options like the `caseStyle` of the json keys, or wheter to ignore null values.
2. `@MappableEnum()` can be used on a enum to specify the `caseStyle` of the stringified enum values.
3. `@MappableConstructor()` can be used on a constructor to mark this to be used for decoding. It has no properties.
4. `@MappableField()` can be used on a constructor parameter or a field to specify a json key to be used instead of the field name. *Note: This can only be used on a field if it is directly assigned as a constructor parameter (`MyClass(this.myField)`). Setting this Annotation on any other field will have no effect. (See [Utilize Constructors](#utilize-constructors) for an explanation why this is.)*

> For a more detailed explanation of all the annotation properties, see the respective properties in the [Builder Config](#builder-config) or head to the [Api Documentation](https://pub.dev/documentation/dart_mappable/latest/annotations/annotations-library.html).

## Case Styles

You can specify the case style for the json keys and your stringified enum values. Choose one of the existing styles or spefify a custom one.

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

> Tip: dart_mappable will always use the first constructor it sees, but you can set a specific named constructor by using the 
> 'constructor' option in the build.yaml file.

## Custom Types

You can create custom mappers to serialize / deserialize custom types that are not part of the generated code like this:

```dart
class CustomStringMapper extends BaseMapper<String> {
  // don't mind the syntax here for now
  @override
  Function get decoder => (dynamic value) {
    return (value as String).substring(1);
  };
  
  @override
  dynamic encode(String self) {
    return '_$self';
  }
}

// then, somewhere early in your code (e.g. main function)
Mapper.use(CustomStringMapper());
```

Instead of extending `BaseMapper<T>` you can also directly extend `Mapper<T>`; 
This will give you a few more methods to override, which will enable `Mapper.isEqual` and `Mapper.asString` on this type.

Curious about the strange syntax for the `decoder` function? This is necessary, in order to handle generic classes with type attributes. 

```dart
class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

class CustomGenericMapper extends BaseMapper<GenericBox> { // only use the base type here

  @override
  Function get decoder => <T>(dynamic value) { // specify the decoder as a generic function
    return GenericBox<T>(Mapper.fromValue<T>(value)); // use the type parameter in your decoding logic
  };
  
  @override
  dynamic encode(GenericBox self) { // no need for type parameters here
    return Mapper.toValue(self.content);
  }

  // in case of generic types, we also must specify a type factory. This is a special type of 
  // function used internally to construct generic instances of your type.
  // specify any type arguments in alignment to the decoder function
  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

// don't forget
Mapper.use(CustomGenericMapper());
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

> Make sure to do mixin Mapper on your key class, in order to enable easy property access

> Since json only supports string keys, we can't do `Mapper.fromJson` or `Mapper.toJson` on these maps. You would have to decode / encode your keys and values separately.

### Custom Mappers

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

By default this property is named `_type`, but you can change it in the build configuration. The value
of this property will default to the name of the class, but you can change this as well with the `discriminatorValue` property.
Make sure to specify the `discriminatorKey` property on the base class - `Animal` in our example - and the `discriminatorValue` property
on each of the child classes - `Cat` and `Dog` in our case.

```dart
void main() {
  // encode a polymorphic class
  String catJson = Mapper.toJson(Cat('Judy', 'Black'));
  print(catJson); // {"name":"Judy","color":"Black","_type":"Cat"}

  Animal myPet = Mapper.fromJson(catJson); // implicit decoding as an 'Animal'
  print(myPet.runtimeType); // Cat

  // explicit decoding also works as usual without a discriminator
  Cat myCat = Mapper.fromJson('{"name": "Kitty", "color": "Brown"}');
  print(myCat.name); // Kitty
}
```

### Null and Default Values

There are two additional cases that you might want to cover. Either your discriminator property is `null`, or some other value, that you did not specify.

1. For the `null` case, you can just set the `discriminatorValue` property to `null` and this will work as expected.
2. For the other case, you can specify a fallback class to be used whenever we come across an unknown discriminator value.
  - a) When using the **Build Config** set the `discriminatorValue`to `__default__`
  - b) When using **Annotations** use like this: `@MappableClass(discriminatorValue: MappableClass.useAsDefault)`
  
```dart
@MappableClass(discriminatorValue: null)
class NullAnimal extends Animal {
  NullAnimal(String name) : super(name);
}

@MappableClass(discriminatorValue: MappableClass.useAsDefault)
class DefaultAnimal extends Animal {
  @MappableField(key: '_type')
  String type;

  DefaultAnimal(String name, this.type) : super(name);
}

void main() {
  // decode json with the discriminator set to null (same as missing property)
  Animal animal1 = Mapper.fromJson('{"name": "Scar", "_type": null}');
  print(animal1.runtimeType); // NullAnimal

  // decode json with unknown discriminator value
  Animal animal2 = Mapper.fromJson('{"name": "Balu", "_type": "Bear"}');
  print(animal2.runtimeType); // DefaultAnimal
  print(animal2.type); // Bear
}
```