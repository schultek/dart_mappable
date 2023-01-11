One of `dart_mappable`s most unique and powerful features is the handling of generic classes.

You can easily define any type of generic classes, including

- classes with one or more generic type parameters
- classes with bounded type parameters
- generic classes using polymorphism

**`dart_mappable`s promise is that it just works, no matter what classes you throw at it.**

## Generic Decoding

Normally when decoding an object, you call the `fromJson` or `fromMap` method of its specific 
mapper, like `PersonMapper.fromJson()` to get a `Person`, or `CarMapper.fromJson()` to get a car.

However `dart_mappable` also has the ability to decode an object based on a type parameter alone, 
using the respective `fromJson` or `fromMap` methods on a `MapperContainer`. Those methods are 
actually generic and take a single type parameter, with the complete signature being: `T fromJson<T>(String json)`.
So it returns an object of whatever type you give it.

With this you can also do `container.fromJson<Person>(...)` and `container.fromJson<Car>(...)` to get a `Person` or 
`Car` respectively.

Now you are probably asking where this `container` comes from. A `MapperContainer` is what makes `dart_mappable` work
internally, and for simple cases you usually don't need to worry about it.

> If you are interested in `MapperContainer`s, read [this](../topics/Mapper%20Container-topic.html) topic.

There are two ways to get a container:

1. Each mapper has its own container, accessible through `<ClassName>Mapper.container`.

  However this container only knows about classes related to the model it is defined for. So for 
  example the `PersonMapper.container` would succeed in doing `PersonMapper.container.fromJson<Person>(..)`
  but fail when trying to do `PersonMapper.container.fromJson<Car>(...)`.

2. You can create arbitrary containers using the `MapperContainer()` constructor.

  A container created like this initially knows about **no** models, but you can **link** other containers
  to include their mappers.

  ```dart
  void main() {
    // initially knows no mappers, so container.fromJson<Person>() would fail
    var container = MapperContainer();
  
    // links mappers for [Person] and [Car] (and related models)
    container.linkAll([PersonMapper.container, CarMapper.container]);
    
    // now this works
    Person person = container.fromJson<Person>(...);
    Car car = container.fromJson<Car>(...);
  }
  ```

The power of this feature might be more clear when seeing it in a generic context. Instead of providing
type arguments to the function statically (`fromJson<MyClass>`), you can use this in another generic
function like this:

```dart
final container = MapperContainer()..linkAll([...]);

T decodeModel<T>(String json) {
  return container.fromJson<T>();
}
```

## Combined Containers

When using **generic decoding** you will need a `MapperContainer` that knows about all types that
you could possibly be decoded using a generic type parameter.

Creating such a container could be very tedious since you potentially had to link all mappers in your 
project.

Therefore `dart_mappable` can generate this container for you. To do this annotate a library of yours 
with the `@MappableLib()` annotation and set the `createCombinedContainer` property to `true`:

```dart
@MappableLib(
  createCombinedContainer: true,
)
library main;
```

This will create a new `<filename>.container.dart` file that creates a single `mainContainer` combining
all discovered mappers.

You can control what mappers are included by setting the `discoveryMode` property to one of three values:

```dart
@MappableLib(
  createCombinedContainer: true,
  discoveryMode: DiscoveryMode.library, // or DiscoveryMode.directory, DiscoveryMode.package
)
library main;
```

- `library` is the default and discovers all mappers in the current library,
- `directory` discover all mappers in the current or any subdirectory,
- `package` discover all models in the current package.

## Typeless Serialization

**Generic Decoding** is already a very powerful and unique feature of `dart_mappable`. But you can
go a step further and serialize json with **no static typing** at all - which I call **typeless serialization**.

All that is needed is a special `__type` key in the json data. You can then do some magic like this:

```dart
void main() {
  
  /// this needs to know about all involved classes, see the section above
  var container = ...;
  
  var json = '{"__type": "Person", "name": "Bob"}';
  
  // notice the static type 'dynamic', no 'Person.fromJson' or 'container.fromJson<Person>' needed
  dynamic object = container.fromJson(json);
  
  // this is actually a [Person] instance
  assert(object.runtimeType == Person);
}
```

> This also works for generic classes, like `{'__type': 'Box<Content>'}`. 

To go full circle, `dart_mappable` can also include this type indicator for you when you encode a 
class. For this notice that the `toValue`, `toMap` and `toJson` methods of a container are actually 
also generic: `dynamic container.toValue<T>(T value)`. 

> This is different to the `toMap` and `toJson` methods of the generated mixin. You have to use a 
> `MapperContainer` directly.

Specifying this type parameter is by design redundant and not important for most cases. It only takes
effect when the static type `T` and the runtime type `value.runtimeType` are different, in which case
it will add the `__type` property.

```dart
void main() {
  // this needs to know about all involved classes
  // 
  // either use a combined container (see the section above) or a 
  // class-specific one, e.g. [MyClassMapper.container]
  var container = ...;
  
  // this will encode normal without '__type'
  
  container.toValue<MyClass>>(myClassInstance);
  container.toValue(MyClass()); // works because of type inference
  container.toValue<MyGenericClass<int>>(myGenericClassInstance);

  // this will add the '__type' property
  
  container.toValue<dynamic>(myClassInstance);
  container.toValue(someDynamicVariable); // where type inference does not work
  container.toValue<MyGenericClass<dynamic>(
          myGenericClassInstance); // because the instance has a specific type
}
```

Together this allows you to serialize and deserialize an object without even knowing its type:

```dart
void main() {
  // this needs to know about all involved classes (see the snippet above)
  var container = ...;
  
  dynamic someObject = ...;
  
  String json = container.toJson(someObject);
  
  // do something in between, or even send the json between server and client
  
  dynamic newObject = container.fromJson(json);
  
  assert(someObject.runtimeType == newObject.runtimeType);
}
```

---

<p align="right"><a href="../topics/Mapping%20Hooks-topic.html">Next: Mapping Hooks</a></p>
