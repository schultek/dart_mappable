// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'dog.dart';

class DogMapper extends SubClassMapperBase<Dog> {
  DogMapper._();

  static DogMapper? _instance;
  static DogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      PersonMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Dog';

  static String _$name(Dog v) => v.name;
  static const Field<Dog, String> _f$name = Field('name', _$name);
  static int _$age(Dog v) => v.age;
  static const Field<Dog, int> _f$age = Field('age', _$age);
  static Person _$owner(Dog v) => v.owner;
  static const Field<Dog, Person> _f$owner = Field('owner', _$owner);

  @override
  final Map<Symbol, Field<Dog, dynamic>> fields = const {
    #name: _f$name,
    #age: _f$age,
    #owner: _f$owner,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 1;
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Dog _instantiate(DecodingData data) {
    return Dog(data.dec(_f$name), data.dec(_f$age), data.dec(_f$owner));
  }

  @override
  final Function instantiate = _instantiate;

  static Dog fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Dog>(map));
  }

  static Dog fromJson(String json) {
    return _guard((c) => c.fromJson<Dog>(json));
  }
}

mixin DogMappable {
  String toJson() {
    return DogMapper._guard((c) => c.toJson(this as Dog));
  }

  Map<String, dynamic> toMap() {
    return DogMapper._guard((c) => c.toMap(this as Dog));
  }

  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() {
    return DogMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DogMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DogMapper._guard((c) => c.hash(this));
  }
}

extension DogValueCopy<$R, $Out extends Dog> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get $asDog =>
      $base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $In extends Dog, $Out extends Dog>
    implements AnimalCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R, Person, Person> get owner;
  @override
  $R call({String? name, int? age, Person? owner});
  DogCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _DogCopyWithImpl<$R, $Out extends Dog>
    extends ClassCopyWithBase<$R, Dog, $Out>
    implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dog> $mapper = DogMapper.ensureInitialized();
  @override
  PersonCopyWith<$R, Person, Person> get owner =>
      $value.owner.copyWith.$chain((v) => call(owner: v));
  @override
  $R call({String? name, int? age, Person? owner}) => $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (age != null) #age: age,
        if (owner != null) #owner: owner
      }));
  @override
  Dog $make(CopyWithData data) => Dog(data.get(#name, or: $value.name),
      data.get(#age, or: $value.age), data.get(#owner, or: $value.owner));

  @override
  DogCopyWith<$R2, Dog, $Out> $chain<$R2>(Then<$Out, $R2> t) =>
      _DogCopyWithImpl($value, $cast, t);
}
