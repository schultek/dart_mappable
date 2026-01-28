
A common pattern that you might want to use for your classes is polymorphism. As a simple example see the classes below.

```dart
abstract class Animal {
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

Here the `abstract Animal` class can either be a `Cat` or a `Dog` which can inherit some properties but 
also introduce new ones. Now consider the following class:

```dart
class Home {
  Animal pet;
  
  Home(this.pet);
}
```

Now when we want to encode a `Home` object, the `pet` property can either be a `Cat` or a `Dog`. Here
two problems arise:

- When deserializing, we need to make sure that the correct subclass is chosen and instantiated, and
- when serializing, we need to make sure that the subclass information isn't lost.
  
To solve these, we add a **discriminator property**, that keeps track of the specific *(sub)*-type of the `pet`.

By default, no discriminator is applied, but you can change this by setting the `discriminatorKey` annotation property (or globally in the build configuration). 

The value of this property will default to the name of the class, but you can change this as well with the `discriminatorValue` annotation property.

***To reiterate**: Make sure to specify the `discriminatorKey` property globally or on the base class - `Animal` in our example - and the `discriminatorValue` property
on each of the child classes - `Cat` and `Dog` in our case.*

```dart
// Set the discriminator key to "type".
@MappableClass(discriminatorKey: 'type')
abstract class Animal with AnimalMappable {
  ...
}

// Set the discriminator value for Cat to "kitty".
@MappableClass(discriminatorValue: 'kitty')
class Cat extends Animal with CatMappable {
  ...
}

// Here the other sub-class Dog will have the default discriminator value "Dog".

void main() {
  // encode a polymorphic class
  String catJson = Cat('Judy', 'black').toJson();
  print(catJson); // {"name":"Judy","color":"black","type":"kitty"}

  Animal myPet = AnimalMapper.fromJson(catJson); // implicit serialization as an 'Animal'
  print(myPet.runtimeType); // has correct runtime type 'Cat'

  // explicit serialization also works as usual without a discriminator
  Cat myCat = CatMapper.fromJson('{"name": "Mindy", "color": "Brown"}');
  print(myCat.name); // Mindy
}
```

## Include Subclasses

The only slight downside of this system is that all sub-classes must be known statically at compile-time. 
`dart_mappable` handles this in the following ways:

1. When a subclass is defined in the same library as the parent class it will be automatically included.

2. You can explicitly add a subclass from another library using the `includeSubClasses` property of the `@MappableClass()` annotation:
    ```dart
    // Suppose [Hamster] is defined in some other library than [Animal]
    @MappableClass(discriminatorKey: 'type', includeSubClasses: [Hamster])
    abstract class Animal with AnimalMappable {
      ...
    }
    ```
3. Alternatively you can initialize a subclass yourself using `MySubClassMapper.ensureInitialized()` and it will register itself
   with the superclass.

## Null and Default Values

There are two additional cases that you might want to cover. Either your discriminator property is `null`, or some other value that you did not specify.

1. For the `null` case, you can explicitly set the `discriminatorValue` property to `null` and this will work as expected.
2. For the other case, you can specify a fallback class to be used whenever we come across an unknown discriminator value. On this class set the `discriminatorValue` to `MappableClass.useAsDefault`.

```dart
// This sub-class will be chosen when the discriminator is null.
@MappableClass(discriminatorValue: null)
class NullAnimal extends Animal with NullAnimalMappable {
  NullAnimal(String name) : super(name);
}

// This sub-class will be chosen on any unknown discriminator.
@MappableClass(discriminatorValue: MappableClass.useAsDefault)
class DefaultAnimal extends Animal with DefaultAnimalMappable {
  String type;
  DefaultAnimal(String name, this.type) : super(name);
}

void main() {
  // decode json with the discriminator set to null (same as missing property)
  Animal animal1 = AnimalMapper.fromJson('{"name": "Scar", "type": null}');
  print(animal1.runtimeType); // NullAnimal

  // decode json with unknown discriminator value
  Animal animal2 = AnimalMapper.fromJson('{"name": "Balu", "type": "Bear"}');
  print(animal2.runtimeType); // DefaultAnimal
  print(animal2.type); // Bear
}
```

## Multiple Constructors

You can also use factory constructors on the base class to provide a more convenient API for creating instances.

```dart
// Set the discriminator key to "type".
@MappableClass(discriminatorKey: 'type')
abstract class Animal with AnimalMappable {
  const Animal(this.name);

  // Factory constructors pointing to subclasses
  const factory Animal.nullAnimal(String name) = NullAnimal;

  const factory Animal.defaultAnimal(String name, String type) = DefaultAnimal;

  final String name;
}
```

## Custom Discriminator Logic

For a more advanced use-case where the discriminator key/value system is not enough, you can also 
use a custom predicate function as the `discriminatorValue`. This function can check whether the 
encoded value should be decoded to this subclass and return a boolean.

```dart
@MappableClass()
abstract class A with AMappable {
  A();
}

@MappableClass(discriminatorValue: B.checkType)
class B extends A with BMappable {
  B();
  
  /// checks if [value] should be decoded to [B]
  static bool checkType(value) {
    return value is Map && value['isB'] == true;
  }
}

@MappableClass(discriminatorValue: C.checkType)
class C extends A with CMappable {
  C();
  
  /// checks if [value] should be decoded to [C]
  static bool checkType(value) {
    return value is Map && value['isWhat'] == 'C';
  }
}
```

---

<p align="right"><a href="../topics/Generics-topic.html">Next: Generics</a></p>
