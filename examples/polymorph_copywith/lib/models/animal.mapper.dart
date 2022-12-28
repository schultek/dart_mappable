// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'animal.dart';

class AnimalMapper extends MapperBase<Animal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AnimalMapper()},
      ))
        ..linkAll({c.CatMapper.container, d.DogMapper.container}));

  @override
  AnimalMapperElement createElement(MapperContainer container) {
    return AnimalMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Animal>;
  static final fromJson = container.fromJson<Animal>;
}

class AnimalMapperElement extends MapperElementBase<Animal> {
  AnimalMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Animal decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'Cat':
            return c.CatMapper().createElement(container).decode(map);
          case 1:
            return d.DogMapper().createElement(container).decode(map);
          default:
            return fromMap(map);
        }
      });
  Animal fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override
  Function get encoder => encode;
  dynamic encode(Animal v) => toMap(v);
  Map<String, dynamic> toMap(Animal a) =>
      {'name': container.$enc(a.name, 'name')};

  @override
  String stringify(Animal self) =>
      'Animal(name: ${container.asString(self.name)})';
  @override
  int hash(Animal self) => container.hash(self.name);
  @override
  bool equals(Animal self, Animal other) =>
      container.isEqual(self.name, other.name);
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;

abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal>
    implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}
