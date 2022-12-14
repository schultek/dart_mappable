import 'package:dart_mappable/internals.dart';

import 'models/animal.dart';
import 'models/person.dart';

final modelMapper = MapperContainer(join: {
  AnimalMapper.container,
  PersonMapper.container,
});

void main() {

  print(Animal.fromMap({'type': 'Cat', 'name': 'Coco', 'color': 'white'}));

  print(PersonMapper.container.fromMap<Person>({'name': 'Kili'}));

  try {
    print(PersonMapper.container
        .fromMap<Animal>({'type': 'Cat', 'name': 'Coco', 'color': 'white'}));
  } catch (e) {
    print(e);
  }

  try {
    print(AnimalMapper.container.fromMap<Person>({'name': 'Kili'}));
  } catch (e) {
    print(e);
  }

  modelMapper.use(PrimitiveMapper<String>((v) => '__${v.toString()}__'));

  print(modelMapper.fromMap<Person>({'name': 'Kili'}));
  print(modelMapper
      .fromMap<Animal>({'type': 'Cat', 'name': 'Coco', 'color': 2}));
}
