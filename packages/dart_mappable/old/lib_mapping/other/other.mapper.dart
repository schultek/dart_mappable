// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'other.dart';

class PetMapper extends MapperBase<Pet> {
  static MapperContainer container = MapperContainer(
    mappers: {PetMapper()},
  );

  @override
  PetMapperElement createElement(MapperContainer container) {
    return PetMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Pet>;
  static final fromJson = container.fromJson<Pet>;
}

class PetMapperElement extends MapperElementBase<Pet> {
  PetMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Pet decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Pet fromMap(Map<String, dynamic> map) => Pet(container.$get(map, 'name'));

  @override Function get encoder => encode;
  dynamic encode(Pet v) => toMap(v);
  Map<String, dynamic> toMap(Pet p) => {'name': container.$enc(p.name, 'name')};

  @override String stringify(Pet self) => 'Pet(name: ${container.asString(self.name)})';
  @override int hash(Pet self) => container.hash(self.name);
  @override bool equals(Pet self, Pet other) => container.isEqual(self.name, other.name);
}

mixin PetMappable {
  String toJson() => PetMapper.container.toJson(this as Pet);
  Map<String, dynamic> toMap() => PetMapper.container.toMap(this as Pet);
  PetCopyWith<Pet, Pet, Pet> get copyWith => _PetCopyWithImpl(this as Pet, $identity, $identity);
  @override String toString() => PetMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PetMapper.container.isEqual(this, other));
  @override int get hashCode => PetMapper.container.hash(this);
}

extension PetValueCopy<$R, $Out extends Pet> on ObjectCopyWith<$R, Pet, $Out> {
  PetCopyWith<$R, Pet, $Out> get asPet => base.as((v, t, t2) => _PetCopyWithImpl(v, t, t2));
}

typedef PetCopyWithBound = Pet;
abstract class PetCopyWith<$R, $In extends Pet, $Out extends Pet> implements ObjectCopyWith<$R, $In, $Out> {
  PetCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Pet>(Then<Pet, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PetCopyWithImpl<$R, $Out extends Pet> extends CopyWithBase<$R, Pet, $Out> implements PetCopyWith<$R, Pet, $Out> {
  _PetCopyWithImpl(super.value, super.then, super.then2);
  @override PetCopyWith<$R2, Pet, $Out2> chain<$R2, $Out2 extends Pet>(Then<Pet, $Out2> t, Then<$Out2, $R2> t2) => _PetCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(Pet(name ?? $value.name));
}
