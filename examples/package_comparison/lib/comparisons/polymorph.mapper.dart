// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'polymorph.dart';

class AnimalBMapper extends ClassMapperBase<AnimalB> {
  static final AnimalBMapper instance = AnimalBMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({CatBMapper.container, DogBMapper.container}));

  @override
  String get id => 'AnimalB';

  static String _$name(AnimalB v) => v.name;

  @override
  final Map<Symbol, Field<AnimalB, dynamic>> fields = const {
    #name: Field<AnimalB, String>('name', _$name),
  };

  static AnimalB _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('AnimalB', 'type', '${map['type']}');
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<AnimalB>;
  static final fromJson = container.fromJson<AnimalB>;
}

mixin AnimalBMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalBCopyWith<AnimalB, AnimalB, AnimalB> get copyWith;
}

typedef AnimalBCopyWithBound = AnimalB;
abstract class AnimalBCopyWith<$R, $In extends AnimalB, $Out extends AnimalB> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(Then<AnimalB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}


class CatBMapper extends ClassMapperBase<CatB> {
  static final CatBMapper instance = CatBMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({AnimalBMapper.container}));

  @override
  String get id => 'CatB';

  static String _$name(CatB v) => v.name;
  static String _$color(CatB v) => v.color;

  @override
  final Map<Symbol, Field<CatB, dynamic>> fields = const {
    #name: Field<CatB, String>('name', _$name),
    #color: Field<CatB, String>('color', _$color),
  };

  static CatB _instantiate(DecodingData data) {
    return CatB(data.get(#name), data.get(#color));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<CatB>;
  static final fromJson = container.fromJson<CatB>;
}

mixin CatBMappable {
  String toJson() => CatBMapper.container.toJson(this as CatB);
  Map<String, dynamic> toMap() => CatBMapper.container.toMap(this as CatB);
  CatBCopyWith<CatB, CatB, CatB> get copyWith => _CatBCopyWithImpl(this as CatB, $identity, $identity);
  @override String toString() => CatBMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CatBMapper.container.isEqual(this, other));
  @override int get hashCode => CatBMapper.container.hash(this);
}

extension CatBValueCopy<$R, $Out extends AnimalB> on ObjectCopyWith<$R, CatB, $Out> {
  CatBCopyWith<$R, CatB, $Out> get asCatB => base.as((v, t, t2) => _CatBCopyWithImpl(v, t, t2));
}

typedef CatBCopyWithBound = AnimalB;
abstract class CatBCopyWith<$R, $In extends CatB, $Out extends AnimalB> implements AnimalBCopyWith<$R, $In, $Out> {
  CatBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(Then<CatB, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? color});
}

class _CatBCopyWithImpl<$R, $Out extends AnimalB> extends CopyWithBase<$R, CatB, $Out> implements CatBCopyWith<$R, CatB, $Out> {
  _CatBCopyWithImpl(super.value, super.then, super.then2);
  @override CatBCopyWith<$R2, CatB, $Out2> chain<$R2, $Out2 extends AnimalB>(Then<CatB, $Out2> t, Then<$Out2, $R2> t2) => _CatBCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(CatB(name ?? $value.name, color ?? $value.color));
}

class DogBMapper extends ClassMapperBase<DogB> {
  static final DogBMapper instance = DogBMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({AnimalBMapper.container}));

  @override
  String get id => 'DogB';

  static String _$name(DogB v) => v.name;
  static int _$age(DogB v) => v.age;

  @override
  final Map<Symbol, Field<DogB, dynamic>> fields = const {
    #name: Field<DogB, String>('name', _$name),
    #age: Field<DogB, int>('age', _$age),
  };

  static DogB _instantiate(DecodingData data) {
    return DogB(data.get(#name), data.get(#age));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<DogB>;
  static final fromJson = container.fromJson<DogB>;
}

mixin DogBMappable {
  String toJson() => DogBMapper.container.toJson(this as DogB);
  Map<String, dynamic> toMap() => DogBMapper.container.toMap(this as DogB);
  DogBCopyWith<DogB, DogB, DogB> get copyWith => _DogBCopyWithImpl(this as DogB, $identity, $identity);
  @override String toString() => DogBMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && DogBMapper.container.isEqual(this, other));
  @override int get hashCode => DogBMapper.container.hash(this);
}

extension DogBValueCopy<$R, $Out extends AnimalB> on ObjectCopyWith<$R, DogB, $Out> {
  DogBCopyWith<$R, DogB, $Out> get asDogB => base.as((v, t, t2) => _DogBCopyWithImpl(v, t, t2));
}

typedef DogBCopyWithBound = AnimalB;
abstract class DogBCopyWith<$R, $In extends DogB, $Out extends AnimalB> implements AnimalBCopyWith<$R, $In, $Out> {
  DogBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(Then<DogB, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, int? age});
}

class _DogBCopyWithImpl<$R, $Out extends AnimalB> extends CopyWithBase<$R, DogB, $Out> implements DogBCopyWith<$R, DogB, $Out> {
  _DogBCopyWithImpl(super.value, super.then, super.then2);
  @override DogBCopyWith<$R2, DogB, $Out2> chain<$R2, $Out2 extends AnimalB>(Then<DogB, $Out2> t, Then<$Out2, $R2> t2) => _DogBCopyWithImpl($value, t, t2);

  @override $R call({String? name, int? age}) => $then(DogB(name ?? $value.name, age ?? $value.age));
}
