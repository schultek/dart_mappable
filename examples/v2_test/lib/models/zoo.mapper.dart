// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'package:v2_test/models/zoo.dart';

class ZooMapper with MapperBase<Zoo> {
  static MapperContainer container = MapperContainer(
    mappers: {ZooMapper()},
    join: {DogMapper.container},
  );

  @override
  ZooMapperElement createElement(MapperContainer container) {
    return ZooMapperElement._(this, container);
  }


  @override Function get typeFactory => <T extends Animal>(f) => f<Zoo<T>>();
  static final fromMap = container.fromMap<Zoo>;
  static final fromJson = container.fromJson<Zoo>;
}

class ZooMapperElement extends MapperElementBase<Zoo> {
  ZooMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Zoo<T> decode<T extends Animal>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) => Zoo(container.$get(map, 'animals'));

  @override Function get encoder => encode;
  dynamic encode<T extends Animal>(Zoo<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T extends Animal>(Zoo<T> z) => {'animals': container.$enc(z.animals, 'animals'), ...container.$type<Zoo<T>>(z)};

  @override String stringify(Zoo self) => 'Zoo(animals: ${container.asString(self.animals)})';
  @override int hash(Zoo self) => container.hash(self.animals);
  @override bool equals(Zoo self, Zoo other) => container.isEqual(self.animals, other.animals);
}

mixin ZooMappable<T extends Animal> {
  String toJson() => ZooMapper.container.toJson(this as Zoo<T>);
  Map<String, dynamic> toMap() => ZooMapper.container.toMap(this as Zoo<T>);
  ZooCopyWith<Zoo<T>, T> get copyWith => _ZooCopyWithImpl(this as Zoo<T>, $identity, $identity);
  @override String toString() => ZooMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ZooMapper.container.isEqual(this, other));
  @override int get hashCode => ZooMapper.container.hash(this);
}

extension ZooValueCopy<$R, T extends Animal> on ObjectCopyWith<$R, Zoo<T>, Zoo<T>> {
  ZooCopyWith<$R, T> get asZoo => base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

abstract class ZooCopyWith<$R, T extends Animal> implements ObjectCopyWith<$R, Zoo<T>, Zoo<T>> {
  ZooCopyWith<$R2, T> chain<$R2>(Then<Zoo<T>, Zoo<T>> t, Then<Zoo<T>, $R2> t2);
  DogCopyWith<$R, Dog> get animals;
  $R call({Dog? animals});
}

class _ZooCopyWithImpl<$R, T extends Animal> extends BaseCopyWith<$R, Zoo<T>, Zoo<T>> implements ZooCopyWith<$R, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override ZooCopyWith<$R2, T> chain<$R2>(Then<Zoo<T>, Zoo<T>> t, Then<Zoo<T>, $R2> t2) => _ZooCopyWithImpl($value, t, t2);

  @override DogCopyWith<$R, Dog> get animals => $value.animals.copyWith.chain($identity, (v) => call(animals: v));
  @override $R call({Dog? animals}) => $then(Zoo(animals ?? $value.animals));
}
