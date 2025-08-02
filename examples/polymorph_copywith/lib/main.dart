import 'models/animal.dart';
import 'models/cat.dart';
import 'models/dog.dart';
import 'models/person.dart';
import 'models/zoo.dart';

void main() {
  Animal animal = AnimalMapper.fromMap({
    'type': 'Cat',
    'name': 'Coco',
    'color': 'white',
    'breed': 'black',
  });

  assert(animal.runtimeType == Cat);

  Animal animal2 = animal.copyWith(name: 'Kitty');

  assert(animal2.runtimeType == Cat);
  assert(animal2.name == 'Kitty');

  Zoo zoo = Zoo([animal2]);

  Zoo zoo2 = zoo.copyWith.animals.add(Dog('Bello', 2, Person('Bob')));

  assert(zoo.animals.length == 1);
  assert(zoo2.animals.length == 2);

  Zoo zoo3 = zoo2.copyWith.animals.at(1).call(name: 'Casper');

  assert(zoo3.animals[1].runtimeType == Dog);
  assert(zoo3.animals[1].name == 'Casper');

  Zoo<Dog> zoo4 = Zoo([zoo3.animals[1] as Dog]);

  Zoo<Dog> zoo5 = zoo4.copyWith.animals.at(0).$asDog(age: 3);

  assert(zoo5.animals.first.age == 3);
}
