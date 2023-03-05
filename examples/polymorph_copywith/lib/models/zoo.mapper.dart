// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

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

  static Zoo<T> _instantiate<T extends Animal>(DecodingObject data) {
    return Zoo(data.get(#animals));
  }

  @override
  final Function instantiate = _instantiate;

  static Zoo<T> fromMap<T extends Animal>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Zoo<T>>(map));
  }

  static Zoo<T> fromJson<T extends Animal>(String json) {
    return _guard((c) => c.fromJson<Zoo<T>>(json));
  }
}

mixin ZooMappable<T extends Animal> {
  String toJson() {
    return ZooMapper._guard((c) => c.toJson(this as Zoo<T>));
  }

  Map<String, dynamic> toMap() {
    return ZooMapper._guard((c) => c.toMap(this as Zoo<T>));
  }

  ZooCopyWith<Zoo<T>, Zoo<T>, Zoo<T>, T> get copyWith =>
      _ZooCopyWithImpl(this as Zoo<T>, $identity, $identity);
  @override
  String toString() {
    return ZooMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ZooMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ZooMapper._guard((c) => c.hash(this));
  }
}

extension ZooValueCopy<$R, $Out extends Zoo, T extends Animal>
    on ObjectCopyWith<$R, Zoo<T>, $Out> {
  ZooCopyWith<$R, Zoo<T>, $Out, T> get $asZoo =>
      $base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;

abstract class ZooCopyWith<$R, $In extends Zoo<T>, $Out extends Zoo,
    T extends Animal> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals;
  $R call({List<T>? animals});
  ZooCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2 extends Zoo>(
      Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _ZooCopyWithImpl<$R, $Out extends Zoo, T extends Animal>
    extends ClassCopyWithBase<$R, Zoo<T>, $Out>
    implements ZooCopyWith<$R, Zoo<T>, $Out, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Zoo> $mapper = ZooMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals => ListCopyWith(
      $value.animals,
      (v, t) => $cast(v.copyWith.$chain<$R, T>($cast, t)),
      (v) => call(animals: v));
  @override
  $R call({List<T>? animals}) =>
      $apply(FieldCopyWithData({if (animals != null) #animals: animals}));
  @override
  Zoo<T> $make(CopyWithData data) =>
      Zoo(data.get(#animals, or: $value.animals));

  @override
  ZooCopyWith<$R2, Zoo<T>, $Out2, T> $chain<$R2, $Out2 extends Zoo>(
          Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ZooCopyWithImpl($value, t, t2);
}
