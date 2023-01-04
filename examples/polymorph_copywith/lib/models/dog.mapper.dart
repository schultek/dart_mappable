// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'dog.dart';

class DogMapper extends MapperBase<Dog> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DogMapper()},
      ))
        ..linkAll({AnimalMapper.container, PersonMapper.container}));

  @override
  DogMapperElement createElement(MapperContainer container) {
    return DogMapperElement._(this, container);
  }

  @override
  String get id => 'Dog';

  static final fromMap = container.fromMap<Dog>;
  static final fromJson = container.fromJson<Dog>;
}

class DogMapperElement extends MapperElementBase<Dog> {
  DogMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Dog decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(container.$get(map, 'name'),
      container.$get(map, 'age'), container.$get(map, 'owner'));

  @override
  Function get encoder => encode;
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {
        'name': container.$enc(d.name, 'name'),
        'age': container.$enc(d.age, 'age'),
        'owner': container.$enc(d.owner, 'owner'),
        'type': 1
      };

  @override
  String stringify(Dog self) =>
      'Dog(name: ${container.asString(self.name)}, age: ${container.asString(self.age)}, owner: ${container.asString(self.owner)})';
  @override
  int hash(Dog self) =>
      container.hash(self.name) ^
      container.hash(self.age) ^
      container.hash(self.owner);
  @override
  bool equals(Dog self, Dog other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.age, other.age) &&
      container.isEqual(self.owner, other.owner);
}

mixin DogMappable {
  String toJson() => DogMapper.container.toJson(this as Dog);
  Map<String, dynamic> toMap() => DogMapper.container.toMap(this as Dog);
  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() => DogMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DogMapper.container.isEqual(this, other));
  @override
  int get hashCode => DogMapper.container.hash(this);
}

extension DogValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get asDog =>
      base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

typedef DogCopyWithBound = Animal;

abstract class DogCopyWith<$R, $In extends Dog, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  DogCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
  PersonCopyWith<$R, Person, Person> get owner;
  @override
  $R call({String? name, int? age, Person? owner});
}

class _DogCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Dog, $Out> implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override
  DogCopyWith<$R2, Dog, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Dog, $Out2> t, Then<$Out2, $R2> t2) =>
      _DogCopyWithImpl($value, t, t2);

  @override
  PersonCopyWith<$R, Person, Person> get owner =>
      $value.owner.copyWith.chain($identity, (v) => call(owner: v));
  @override
  $R call({String? name, int? age, Person? owner}) =>
      $then(Dog(name ?? $value.name, age ?? $value.age, owner ?? $value.owner));
}
