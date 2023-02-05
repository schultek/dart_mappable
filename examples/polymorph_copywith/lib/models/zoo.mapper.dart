// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'zoo.dart';

class ZooMapper extends ClassMapperBase<Zoo> {
  static final ZooMapper instance = ZooMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance)
  ..linkAll({AnimalMapper.container});

  @override
  final String id = 'Zoo';
  @override
  Function get typeFactory => <T extends Animal>(f) => f<Zoo<T>>();

  static List<Animal> _$animals(Zoo v) => v.animals;
  static dynamic _arg$animals<T extends Animal>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<Zoo, dynamic>> fields = const {
    #animals: Field<Zoo, List<Animal>>('animals', _$animals, arg: _arg$animals),
  };

  static Zoo<T> _instantiate<T extends Animal>(DecodingData data) {
    return Zoo(data.get(#animals));
  }
  @override
  final Function instantiate = _instantiate;

  static Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) => container.fromMap<Zoo<T>>(map);
  static Zoo<T> fromJson<T extends Animal>(String json) => container.fromJson<Zoo<T>>(json);
}

mixin ZooMappable<T extends Animal> {
  String toJson() => ZooMapper.container.toJson(this as Zoo<T>);
  Map<String, dynamic> toMap() => ZooMapper.container.toMap(this as Zoo<T>);
  ZooCopyWith<Zoo<T>, Zoo<T>, Zoo<T>, T> get copyWith => _ZooCopyWithImpl(this as Zoo<T>, $identity, $identity);
  @override String toString() => ZooMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ZooMapper.container.isEqual(this, other));
  @override int get hashCode => ZooMapper.container.hash(this);
}

extension ZooValueCopy<$R, $Out extends Zoo, T extends Animal> on ObjectCopyWith<$R, Zoo<T>, $Out> {
  ZooCopyWith<$R, Zoo<T>, $Out, T> get asZoo => base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;
abstract class ZooCopyWith<$R, $In extends Zoo<T>, $Out extends Zoo, T extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends Zoo>(Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals;
  $R call({List<T>? animals});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo, T extends Animal> extends CopyWithBase<$R, Zoo<T>, $Out> implements ZooCopyWith<$R, Zoo<T>, $Out, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override ZooCopyWith<$R2, Zoo<T>, $Out2, T> chain<$R2, $Out2 extends Zoo>(Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2) => _ZooCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals => ListCopyWith($value.animals, (v, t) => $cast(v.copyWith.chain<$R, T>($cast, t)), (v) => call(animals: v));
  @override $R call({List<T>? animals}) => $then(Zoo(animals ?? $value.animals));
}
