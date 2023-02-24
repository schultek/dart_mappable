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

`T` can be any of your model types (`Person`, `Car`), including generic types (`Box<Content>`) and even lists (`List<Item>`),
or any combination of those (`List<Person>`, `Box<List<Item>>`, `List<List<Car>>`).

The power of this feature might be more clear when seeing it in a generic context. Instead of providing
type arguments to the function statically (`fromJson<MyClass>`), you can use this in another generic
function like this:

```dart
T decodeModel<T>(String json) {
  return container.fromJson<T>();
}
```

Now you are probably asking where this `container` comes from. A `MapperContainer` is what makes `dart_mappable` work
internally, and for most cases you don't need to worry about it.

The recommended way is to simply use the existing `MapperContainer.globals` container. This is a special container
that is used by all generated mappers and doesn't require much manual setup.

> If you want to learn more about `MapperContainer`s, read [this](../topics/Mapper%20Container-topic.html) topic.

For the `MapperContainer.globals` to support a given model type, you need to have called `MyModelMapper.ensureInitialized()`
at least once. A good place to put this is in an initializer function that you call from your `main()` method, to make
sure all models are available for decoding:

```dart

void initMappers() {
  PersonMapper.ensureInitialized();
  CarMapper.ensureInitialized();
}

void main() {
  // Init all required mappers.
  initMappers();
  
  // You can now call this anywhere.
  MapperContainer.globals.fromJson<Person>(...);
  
  // This won't work, since `ensureInitialize()` wasn't called on `AnimalMapper`.
  MapperContainer.globals.fromJson<Animal>(...);
}
```

## Generated Initializer

When using **generic decoding** you will need to call `MyMapper.ensureInitialized()` for all types that
you could possibly be decoding using a generic type parameter.

Doing this could be very tedious and boilerplaty since you potentially have to call all mappers in your 
project.

Therefore `dart_mappable` can generate this code for you. To do this annotate a library of yours 
with the `@MappableLib()` annotation and set the `generateInitializerForScope` property:

```dart
@MappableLib(generateInitializerForScope: InitializerScope.package)
library main;
```

This will create a new `<filename>.init.dart` file containing a single `initializeMappers()` function 
that initializes all discovered mappers.

You can control what mappers are included by changing the initializer scope to one of three values:

- `InitializerScope.library` discovers all mappers in the current library,
- `InitializerScope.directory` discovers all mappers in the current or any subdirectory,
- `InitializerScope.package` discovers all models in the current package.

## Typeless Serialization

**Generic Decoding** is already a very powerful and unique feature of `dart_mappable`. But you can
go a step further and serialize json with **no static typing** at all - which I call **typeless serialization**.

All that is needed is a special `__type` key in the json data. You can then do some magic like this:

```dart
void main() {  
  // Initializes all required mappers (see section above)
  initializeMappers();
  
  var json = '{"__type": "Person", "name": "Bob"}';
  
  // notice the static type 'dynamic', no 'Person.fromJson' or 'container.fromJson<Person>' needed
  dynamic object = MapperContainer.globals.fromJson(json);
  
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
  // Initializes all required mappers (see section above)
  initializeMappers();
  
  // this will encode normal without '__type'

  MapperContainer.globals.toValue<MyClass>>(myClassInstance);
  MapperContainer.globals.toValue(MyClass()); // works because of type inference
  MapperContainer.globals.toValue<MyGenericClass<int>>(myGenericClassInstance);

  // this will add the '__type' property

  MapperContainer.globals.toValue<dynamic>(myClassInstance);
  MapperContainer.globals.toValue(someDynamicVariable); // where type inference does not work
  MapperContainer.globals.toValue<MyGenericClass<dynamic>(
          myGenericClassInstance); // because the instance has a specific type
}
```

Together this allows you to serialize and deserialize an object without even knowing its type:

```dart
void main() {
  // Initializes all required mappers (see section above)
  initializeMappers();
  
  dynamic someObject = ...;
  
  String json = MapperContainer.globals.toJson(someObject);
  
  // do something in between, or even send the json between server and client
  
  dynamic newObject = MapperContainer.globals.fromJson(json);
  
  assert(someObject.runtimeType == newObject.runtimeType);
}
```

---

<p align="right"><a href="../topics/Mapping%20Hooks-topic.html">Next: Mapping Hooks</a></p>
