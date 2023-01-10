// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic.dart';

class PersonCMapper extends MapperBase<PersonC> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonCMapper()},
  );

  @override
  PersonCMapperElement createElement(MapperContainer container) {
    return PersonCMapperElement._(this, container);
  }

  @override
  String get id => 'PersonC';

  static final fromMap = container.fromMap<PersonC>;
  static final fromJson = container.fromJson<PersonC>;
}

class PersonCMapperElement extends MapperElementBase<PersonC> {
  PersonCMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  PersonC decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  PersonC fromMap(Map<String, dynamic> map) =>
      PersonC(name: container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(PersonC v) => toMap(v);
  Map<String, dynamic> toMap(PersonC p) =>
      {'name': container.$enc(p.name, 'name')};

  @override
  String stringify(PersonC self) =>
      'PersonC(name: ${container.asString(self.name)})';
  @override
  int hash(PersonC self) => container.hash(self.name);
  @override
  bool equals(PersonC self, PersonC other) =>
      container.isEqual(self.name, other.name);
}

mixin PersonCMappable {
  String toJson() => PersonCMapper.container.toJson(this as PersonC);
  Map<String, dynamic> toMap() =>
      PersonCMapper.container.toMap(this as PersonC);
  PersonCCopyWith<PersonC, PersonC, PersonC> get copyWith =>
      _PersonCCopyWithImpl(this as PersonC, $identity, $identity);
  @override
  String toString() => PersonCMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PersonCMapper.container.isEqual(this, other));
  @override
  int get hashCode => PersonCMapper.container.hash(this);
}

extension PersonCValueCopy<$R, $Out extends PersonC>
    on ObjectCopyWith<$R, PersonC, $Out> {
  PersonCCopyWith<$R, PersonC, $Out> get asPersonC =>
      base.as((v, t, t2) => _PersonCCopyWithImpl(v, t, t2));
}

typedef PersonCCopyWithBound = PersonC;

abstract class PersonCCopyWith<$R, $In extends PersonC, $Out extends PersonC>
    implements ObjectCopyWith<$R, $In, $Out> {
  PersonCCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PersonC>(
      Then<PersonC, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonCCopyWithImpl<$R, $Out extends PersonC>
    extends CopyWithBase<$R, PersonC, $Out>
    implements PersonCCopyWith<$R, PersonC, $Out> {
  _PersonCCopyWithImpl(super.value, super.then, super.then2);
  @override
  PersonCCopyWith<$R2, PersonC, $Out2> chain<$R2, $Out2 extends PersonC>(
          Then<PersonC, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(PersonC(name: name ?? $value.name));
}
