// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cat.dart';

class CatMapper extends DiscriminatorSubClassMapperBase<Cat> {
  CatMapper._();
  static CatMapper? _instance;
  static CatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      CatTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Cat';

  static String _$name(Cat v) => v.name;
  static CatType _$breed(Cat v) => v.breed;
  static String _$color(Cat v) => v.color;

  @override
  final Map<Symbol, Field<Cat, dynamic>> fields = const {
    #name: Field<Cat, String>('name', _$name),
    #breed: Field<Cat, CatType>('breed', _$breed),
    #color: Field<Cat, String>('color', _$color),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = 'Cat';

  static Cat _instantiate(DecodingData data) {
    return Cat(data.get(#name), data.get(#breed), data.get(#color));
  }

  @override
  final Function instantiate = _instantiate;

  static Cat fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Cat>(map));
  }

  static Cat fromJson(String json) {
    return _guard((c) => c.fromJson<Cat>(json));
  }
}

mixin CatMappable {
  String toJson() {
    return CatMapper._guard((c) => c.toJson(this as Cat));
  }

  Map<String, dynamic> toMap() {
    return CatMapper._guard((c) => c.toMap(this as Cat));
  }

  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() {
    return CatMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CatMapper._guard((c) => c.hash(this));
  }
}

extension CatValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get asCat =>
      base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;

abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  CatCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, CatType? breed, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Cat, $Out> implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override
  CatCopyWith<$R2, Cat, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Cat, $Out2> t, Then<$Out2, $R2> t2) =>
      _CatCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, CatType? breed, String? color}) => $then(
      Cat(name ?? $value.name, breed ?? $value.breed, color ?? $value.color));
}

class CatTypeMapper extends EnumMapper<CatType> {
  CatTypeMapper._();
  static CatTypeMapper? _instance;
  static CatTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatTypeMapper._());
    }
    return _instance!;
  }

  static CatType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CatType decode(dynamic value) {
    switch (value) {
      case 'black':
        return CatType.black;
      case 'siamese':
        return CatType.siamese;
      case 'tiger':
        return CatType.tiger;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CatType self) {
    switch (self) {
      case CatType.black:
        return 'black';
      case CatType.siamese:
        return 'siamese';
      case CatType.tiger:
        return 'tiger';
    }
  }
}

extension CatTypeMapperExtension on CatType {
  String toValue() {
    CatTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
