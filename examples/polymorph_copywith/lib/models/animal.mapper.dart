// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'animal.dart';

class AnimalMapper extends ClassMapperBase<Animal> {
  static final AnimalMapper instance = AnimalMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance));

  @override
  final String id = 'Animal';

  @override
  final List<SubClassMapperBase<Animal>> subMappers = [
    c.CatMapper.instance,
    d.DogMapper.instance,
  ];

  static String _$name(Animal v) => v.name;

  @override
  final Map<Symbol, Field<Animal, dynamic>> fields = const {
    #name: Field<Animal, String>('name', _$name),
  };

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('Animal', 'type', '${data.value['type']}');
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Animal>;
  static final fromJson = container.fromJson<Animal>;
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;
abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

