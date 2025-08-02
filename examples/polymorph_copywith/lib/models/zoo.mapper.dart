// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'zoo.dart';

class ZooMapper extends ClassMapperBase<Zoo> {
  ZooMapper._();

  static ZooMapper? _instance;
  static ZooMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ZooMapper._());
      AnimalMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Zoo';
  @override
  Function get typeFactory => <T extends Animal>(f) => f<Zoo<T>>();

  static List<Animal> _$animals(Zoo v) => v.animals;
  static dynamic _arg$animals<T extends Animal>(f) => f<List<T>>();
  static const Field<Zoo, List<Animal>> _f$animals = Field(
    'animals',
    _$animals,
    arg: _arg$animals,
  );

  @override
  final MappableFields<Zoo> fields = const {#animals: _f$animals};

  static Zoo<T> _instantiate<T extends Animal>(DecodingData data) {
    return Zoo(data.dec(_f$animals));
  }

  @override
  final Function instantiate = _instantiate;

  static Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Zoo<T>>(map);
  }

  static Zoo<T> fromJson<T extends Animal>(String json) {
    return ensureInitialized().decodeJson<Zoo<T>>(json);
  }
}

mixin ZooMappable<T extends Animal> {
  String toJson() {
    return ZooMapper.ensureInitialized().encodeJson<Zoo<T>>(this as Zoo<T>);
  }

  Map<String, dynamic> toMap() {
    return ZooMapper.ensureInitialized().encodeMap<Zoo<T>>(this as Zoo<T>);
  }

  ZooCopyWith<Zoo<T>, Zoo<T>, Zoo<T>, T> get copyWith =>
      _ZooCopyWithImpl(this as Zoo<T>, $identity, $identity);
  @override
  String toString() {
    return ZooMapper.ensureInitialized().stringifyValue(this as Zoo<T>);
  }

  @override
  bool operator ==(Object other) {
    return ZooMapper.ensureInitialized().equalsValue(this as Zoo<T>, other);
  }

  @override
  int get hashCode {
    return ZooMapper.ensureInitialized().hashValue(this as Zoo<T>);
  }
}

extension ZooValueCopy<$R, $Out, T extends Animal>
    on ObjectCopyWith<$R, Zoo<T>, $Out> {
  ZooCopyWith<$R, Zoo<T>, $Out, T> get $asZoo =>
      $base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

abstract class ZooCopyWith<$R, $In extends Zoo<T>, $Out, T extends Animal>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals;
  $R call({List<T>? animals});
  ZooCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ZooCopyWithImpl<$R, $Out, T extends Animal>
    extends ClassCopyWithBase<$R, Zoo<T>, $Out>
    implements ZooCopyWith<$R, Zoo<T>, $Out, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Zoo> $mapper = ZooMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals => ListCopyWith(
    $value.animals,
    (v, t) => (v.copyWith as AnimalCopyWith<Animal, T, T>).$chain(t),
    (v) => call(animals: v),
  );
  @override
  $R call({List<T>? animals}) =>
      $apply(FieldCopyWithData({if (animals != null) #animals: animals}));
  @override
  Zoo<T> $make(CopyWithData data) =>
      Zoo(data.get(#animals, or: $value.animals));

  @override
  ZooCopyWith<$R2, Zoo<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ZooCopyWithImpl($value, $cast, t);
}
