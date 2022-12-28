// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'zoo.dart';

class ZooMapper extends MapperBase<Zoo> {
  static MapperContainer container = MapperContainer(
    mappers: {ZooMapper()},
  )..linkAll({AnimalMapper.container});

  @override
  ZooMapperElement createElement(MapperContainer container) {
    return ZooMapperElement._(this, container);
  }

  @override
  Function get typeFactory => <T extends Animal>(f) => f<Zoo<T>>();
  static Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) =>
      container.fromMap<Zoo<T>>(map);
  static Zoo<T> fromJson<T extends Animal>(String json) =>
      container.fromJson<Zoo<T>>(json);
}

class ZooMapperElement extends MapperElementBase<Zoo> {
  ZooMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Zoo<T> decode<T extends Animal>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) =>
      Zoo(container.$get(map, 'animals'));

  @override
  Function get encoder => encode;
  dynamic encode<T extends Animal>(Zoo<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T extends Animal>(Zoo<T> z) => {
        'animals': container.$enc(z.animals, 'animals'),
        ...container.$type<Zoo<T>>(z)
      };

  @override
  String stringify(Zoo self) =>
      'Zoo(animals: ${container.asString(self.animals)})';
  @override
  int hash(Zoo self) => container.hash(self.animals);
  @override
  bool equals(Zoo self, Zoo other) =>
      container.isEqual(self.animals, other.animals);
}

mixin ZooMappable<T extends Animal> {
  String toJson() => ZooMapper.container.toJson(this as Zoo<T>);
  Map<String, dynamic> toMap() => ZooMapper.container.toMap(this as Zoo<T>);
  ZooCopyWith<Zoo<T>, Zoo<T>, Zoo<T>, T> get copyWith =>
      _ZooCopyWithImpl(this as Zoo<T>, $identity, $identity);
  @override
  String toString() => ZooMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ZooMapper.container.isEqual(this, other));
  @override
  int get hashCode => ZooMapper.container.hash(this);
}

extension ZooValueCopy<$R, $Out extends Zoo, T extends Animal>
    on ObjectCopyWith<$R, Zoo<T>, $Out> {
  ZooCopyWith<$R, Zoo<T>, $Out, T> get asZoo =>
      base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;

abstract class ZooCopyWith<$R, $In extends Zoo<T>, $Out extends Zoo,
    T extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends Zoo>(
      Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals;
  $R call({List<T>? animals});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo, T extends Animal>
    extends CopyWithBase<$R, Zoo<T>, $Out>
    implements ZooCopyWith<$R, Zoo<T>, $Out, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override
  ZooCopyWith<$R2, Zoo<T>, $Out2, T> chain<$R2, $Out2 extends Zoo>(
          Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ZooCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals => ListCopyWith(
      $value.animals,
      (v, t) => $cast(v.copyWith.chain<$R, T>($cast, t)),
      (v) => call(animals: v));
  @override
  $R call({List<T>? animals}) => $then(Zoo(animals ?? $value.animals));
}
