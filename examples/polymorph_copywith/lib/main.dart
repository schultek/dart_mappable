import 'package:polymorph_copywith/person/student.dart';
import 'package:polymorph_copywith/person/student_clothes.dart';
import 'package:polymorph_copywith/person/student_pants.dart';

import 'person/clothes.dart';

void main() {
  // Animal animal = AnimalMapper.fromMap(
  //     {'type': 'Cat', 'name': 'Coco', 'color': 'white', 'breed': 'black'});
  //
  // assert(animal.runtimeType == Cat);
  //
  // Animal animal2 = animal.copyWith(name: 'Kitty');
  //
  // assert(animal2.runtimeType == Cat);
  // assert(animal2.name == 'Kitty');
  //
  // Zoo zoo = Zoo([animal2]);
  //
  // Zoo zoo2 = zoo.copyWith.animals.add(Dog('Bello', 2, Person('Bob')));
  //
  // assert(zoo.animals.length == 1);
  // assert(zoo2.animals.length == 2);
  //
  // Zoo zoo3 = zoo2.copyWith.animals.at(1).call(name: 'Casper');
  //
  // assert(zoo3.animals[1].runtimeType == Dog);
  // assert(zoo3.animals[1].name == 'Casper');
  //
  // Zoo<Dog> zoo4 = Zoo([zoo3.animals[1] as Dog]);
  //
  // Zoo<Dog> zoo5 = zoo4.copyWith.animals.at(0).$asDog(age: 3);
  //
  // assert(zoo5.animals.first.age == 3);

  var student = Student(
    name: 'Tom',
    clothes: [
      StudentClothes(
        shirt: 'M',
        pants: [StudentPants(material: 'jeans', extraSomething: 'blue')],
        badge: 'test',
      )
    ],
    university: 'TUM',
  );

  print(student);

  var s = student.copyWith.clothes!.at(0).pants.at(0).call(material: 'wool');

  print(s);

  var clothes = Clothes(shirt: 'M', pants: [
    StudentPants(material: 'jeas', extraSomething: 'blue'),
  ]);

  print(clothes);

  var c = clothes.copyWith.pants.at(0).call(material: 'wool');
  print(c);
}
