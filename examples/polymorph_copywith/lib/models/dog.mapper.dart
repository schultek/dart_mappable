// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
    return ensureInitialized().decodeMap<Dog>(map);
  }

  static Dog fromJson(String json) {
    return ensureInitialized().decodeJson<Dog>(json);
  }
}

mixin DogMappable {
  String toJson() {
    return DogMapper.ensureInitialized().encodeJson<Dog>(this as Dog);
  }

  Map<String, dynamic> toMap() {
    return DogMapper.ensureInitialized().encodeMap<Dog>(this as Dog);
  }

  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() {
    return DogMapper.ensureInitialized().stringifyValue(this as Dog);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DogMapper.ensureInitialized().isValueEqual(this as Dog, other));
  }

  @override
  int get hashCode {
    return DogMapper.ensureInitialized().hashValue(this as Dog);
  }
}

extension DogValueCopy<$R, $Out> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get $asDog =>
      $base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $In extends Dog, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R, Person, Person> get owner;
  @override
  $R call({String? name, int? age, Person? owner});
  DogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Dog, $Out>
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
  DogCopyWith<$R2, Dog, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DogCopyWithImpl($value, $cast, t);
}
