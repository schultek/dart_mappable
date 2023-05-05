// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'polymorph.dart';

class AnimalBMapper extends ClassMapperBase<AnimalB> {
  AnimalBMapper._();

  static AnimalBMapper? _instance;
  static AnimalBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalBMapper._());
      CatBMapper.ensureInitialized();
      DogBMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AnimalB';

  static String _$name(AnimalB v) => v.name;
  static const Field<AnimalB, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<AnimalB, dynamic>> fields = const {
    #name: _f$name,
  };

  static AnimalB _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'AnimalB', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static AnimalB fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AnimalB>(map));
  }

  static AnimalB fromJson(String json) {
    return _guard((c) => c.fromJson<AnimalB>(json));
  }
}

mixin AnimalBMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalBCopyWith<AnimalB, AnimalB, AnimalB> get copyWith;
}

abstract class AnimalBCopyWith<$R, $In extends AnimalB, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  AnimalBCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CatBMapper extends SubClassMapperBase<CatB> {
  CatBMapper._();

  static CatBMapper? _instance;
  static CatBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatBMapper._());
      AnimalBMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CatB';

  static String _$name(CatB v) => v.name;
  static const Field<CatB, String> _f$name = Field('name', _$name);
  static String _$color(CatB v) => v.color;
  static const Field<CatB, String> _f$color = Field('color', _$color);

  @override
  final Map<Symbol, Field<CatB, dynamic>> fields = const {
    #name: _f$name,
    #color: _f$color,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'CatB';
  @override
  late final ClassMapperBase superMapper = AnimalBMapper.ensureInitialized();

  static CatB _instantiate(DecodingData data) {
    return CatB(data.dec(_f$name), data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static CatB fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CatB>(map));
  }

  static CatB fromJson(String json) {
    return _guard((c) => c.fromJson<CatB>(json));
  }
}

mixin CatBMappable {
  String toJson() {
    return CatBMapper._guard((c) => c.toJson(this as CatB));
  }

  Map<String, dynamic> toMap() {
    return CatBMapper._guard((c) => c.toMap(this as CatB));
  }

  CatBCopyWith<CatB, CatB, CatB> get copyWith =>
      _CatBCopyWithImpl(this as CatB, $identity, $identity);
  @override
  String toString() {
    return CatBMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatBMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CatBMapper._guard((c) => c.hash(this));
  }
}

extension CatBValueCopy<$R, $Out> on ObjectCopyWith<$R, CatB, $Out> {
  CatBCopyWith<$R, CatB, $Out> get $asCatB =>
      $base.as((v, t, t2) => _CatBCopyWithImpl(v, t, t2));
}

abstract class CatBCopyWith<$R, $In extends CatB, $Out>
    implements AnimalBCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, String? color});
  CatBCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CatBCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, CatB, $Out>
    implements CatBCopyWith<$R, CatB, $Out> {
  _CatBCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CatB> $mapper = CatBMapper.ensureInitialized();
  @override
  $R call({String? name, String? color}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (color != null) #color: color}));
  @override
  CatB $make(CopyWithData data) => CatB(
      data.get(#name, or: $value.name), data.get(#color, or: $value.color));

  @override
  CatBCopyWith<$R2, CatB, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CatBCopyWithImpl($value, $cast, t);
}

class DogBMapper extends SubClassMapperBase<DogB> {
  DogBMapper._();

  static DogBMapper? _instance;
  static DogBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogBMapper._());
      AnimalBMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DogB';

  static String _$name(DogB v) => v.name;
  static const Field<DogB, String> _f$name = Field('name', _$name);
  static int _$age(DogB v) => v.age;
  static const Field<DogB, int> _f$age = Field('age', _$age);

  @override
  final Map<Symbol, Field<DogB, dynamic>> fields = const {
    #name: _f$name,
    #age: _f$age,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'dog';
  @override
  late final ClassMapperBase superMapper = AnimalBMapper.ensureInitialized();

  static DogB _instantiate(DecodingData data) {
    return DogB(data.dec(_f$name), data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static DogB fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DogB>(map));
  }

  static DogB fromJson(String json) {
    return _guard((c) => c.fromJson<DogB>(json));
  }
}

mixin DogBMappable {
  String toJson() {
    return DogBMapper._guard((c) => c.toJson(this as DogB));
  }

  Map<String, dynamic> toMap() {
    return DogBMapper._guard((c) => c.toMap(this as DogB));
  }

  DogBCopyWith<DogB, DogB, DogB> get copyWith =>
      _DogBCopyWithImpl(this as DogB, $identity, $identity);
  @override
  String toString() {
    return DogBMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DogBMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DogBMapper._guard((c) => c.hash(this));
  }
}

extension DogBValueCopy<$R, $Out> on ObjectCopyWith<$R, DogB, $Out> {
  DogBCopyWith<$R, DogB, $Out> get $asDogB =>
      $base.as((v, t, t2) => _DogBCopyWithImpl(v, t, t2));
}

abstract class DogBCopyWith<$R, $In extends DogB, $Out>
    implements AnimalBCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, int? age});
  DogBCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DogBCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, DogB, $Out>
    implements DogBCopyWith<$R, DogB, $Out> {
  _DogBCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DogB> $mapper = DogBMapper.ensureInitialized();
  @override
  $R call({String? name, int? age}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (age != null) #age: age}));
  @override
  DogB $make(CopyWithData data) =>
      DogB(data.get(#name, or: $value.name), data.get(#age, or: $value.age));

  @override
  DogBCopyWith<$R2, DogB, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DogBCopyWithImpl($value, $cast, t);
}
