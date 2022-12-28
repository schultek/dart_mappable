// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic.dart';

class PersonBMapper extends MapperBase<PersonB> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonBMapper()},
  );

  @override
  PersonBMapperElement createElement(MapperContainer container) {
    return PersonBMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<PersonB>;
  static final fromJson = container.fromJson<PersonB>;
}

class PersonBMapperElement extends MapperElementBase<PersonB> {
  PersonBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  PersonB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  PersonB fromMap(Map<String, dynamic> map) =>
      PersonB(name: container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(PersonB v) => toMap(v);
  Map<String, dynamic> toMap(PersonB p) =>
      {'name': container.$enc(p.name, 'name')};

  @override
  String stringify(PersonB self) =>
      'PersonB(name: ${container.asString(self.name)})';
  @override
  int hash(PersonB self) => container.hash(self.name);
  @override
  bool equals(PersonB self, PersonB other) =>
      container.isEqual(self.name, other.name);
}

mixin PersonBMappable {
  String toJson() => PersonBMapper.container.toJson(this as PersonB);
  Map<String, dynamic> toMap() =>
      PersonBMapper.container.toMap(this as PersonB);
  PersonBCopyWith<PersonB, PersonB, PersonB> get copyWith =>
      _PersonBCopyWithImpl(this as PersonB, $identity, $identity);
  @override
  String toString() => PersonBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PersonBMapper.container.isEqual(this, other));
  @override
  int get hashCode => PersonBMapper.container.hash(this);
}

extension PersonBValueCopy<$R, $Out extends PersonB>
    on ObjectCopyWith<$R, PersonB, $Out> {
  PersonBCopyWith<$R, PersonB, $Out> get asPersonB =>
      base.as((v, t, t2) => _PersonBCopyWithImpl(v, t, t2));
}

typedef PersonBCopyWithBound = PersonB;

abstract class PersonBCopyWith<$R, $In extends PersonB, $Out extends PersonB>
    implements ObjectCopyWith<$R, $In, $Out> {
  PersonBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PersonB>(
      Then<PersonB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonBCopyWithImpl<$R, $Out extends PersonB>
    extends CopyWithBase<$R, PersonB, $Out>
    implements PersonBCopyWith<$R, PersonB, $Out> {
  _PersonBCopyWithImpl(super.value, super.then, super.then2);
  @override
  PersonBCopyWith<$R2, PersonB, $Out2> chain<$R2, $Out2 extends PersonB>(
          Then<PersonB, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonBCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(PersonB(name: name ?? $value.name));
}
