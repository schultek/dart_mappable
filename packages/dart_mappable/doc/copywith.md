`dart_mappable` can generate a powerful `copyWith` method for your classes. It supports assigning
`null` as well as chained deep copies, polymorphic copy, merging objects or applying delta maps.

```dart
@MappableClass()
class Person with PersonMappable {
  String name;
  int? age;
    
  Person(this.name, this.age);
}

void main() {
  var person = Person('Tom', 20);

  // `age` not passed, its value is preserved
  print(person.copyWith(name: 'Max')); // Person(name: Max, age: 24)
  // `age` is set to `null`
  print(person.copyWith(age: null)); // Person(name: Tom, age: null)
}
```

## Deep Copy

When having complex nested classes, this syntax can get quite verbose.
Therefore this package provides a special syntax for nested classes, similar to
[freezed](https://pub.dev/packages/freezed#deep-copy).

Consider the following classes:

```dart
@MappableClass()
class Person with PersonMappable {
  String name;

  Person(this.name);
}

@MappableClass()
class Company with CompanyMappable {
  Person manager;
  List<Person> employees;
  
  Company(this.manager, this.employees);
}

void main() {
  var company = Company(Person('Anna'), [Person('Max'), Person('Tom')]);
  
  // access nested object using the 'dot' syntax
  print(company.copyWith.manager(name: 'Laura')); 
  // prints: Company(manager: Person(name: 'Laura'), ...)
  
  // this also works with lists or maps
  print(company.copyWith.employees.at(0)(name: 'John')); 
  // prints: Company(..., employees: [Person(name: 'John), Person(name: 'Tom')])
  
  // you can also use 'apply' with a custom function to transform a value
  print(company.copyWith.manager.apply((manager) => Person(manager.name.toUpperCase())));
  // prints: Company(manager: Person(name: 'ANNA'), ...)
}
```

When working with `List`s or `Map`s and `copyWith`, there are different methods you can use to access, add, remove or filter elements.
The complete interfaces are documented

- [here](https://pub.dev/documentation/dart_mappable/latest/dart_mappable/ListCopyWith-class.html) for Lists
- [here](https://pub.dev/documentation/dart_mappable/latest/dart_mappable/MapCopyWith-class.html) for Maps

## CopyWith for Inheritance, Polymorphism and Generics

CopyWith works not only for simple use-cases, but also supports complex class structures with
inheritance or generics, like [Polymorphism](../topics/Polymorphism-topic.html).

After reading the next page, check out the [Polymorphic-CopyWith Example](https://github.com/schultek/dart_mappable/tree/main/examples/polymorph_copywith) on Github. 

## Merging Objects

You can also merge classes fields using the `.copyWith.$merge()` extension. Here any non-null property of the provided 
object will override the respective property of the base object. Other than the normal copy-with, this is not 
null-aware / reversible, meaning a non-null property can never be set back to null using this method.

```dart
@MappableClass()
class A with AMappable {
  A(this.a, this.b);
  
  String? a;
  String? b;
}

void main() {
  var a = A('a', null);
  var b = A(null, 'b');
  
  var c = a.copyWith.$merge(b);
  assert(c == A('a', 'b'));
}
```

## Copy Delta

You can also apply a delta map on an object using the `.copyWith.$delta` extension. The delta copy-with is null aware 
(other than the merging copy-with) meaning that explicit null values in the provided map will override any value in the base object.

```dart
@MappableClass()
class A with AMappable {
  A(this.a, this.b, this.c);
  
  String? a;
  String? b;
  String? c;
}

void main() {
  var a = A('a', null, 'c');
  var delta = {'b': 'b', 'c': null};
  
  var c = a.copyWith.$delta(delta);
  assert(c == A('a', 'b', null));
}
``` 

---

<p align="right"><a href="../topics/Polymorphism-topic.html">Next: Polymorphism</a></p>
