// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cat.dart';

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
    return MapperContainer.globals.toValue<CatType>(this) as String;
  }
}

class CatMapper extends SubClassMapperBase<Cat> {
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

  @override
  final String id = 'Cat';

  static String _$name(Cat v) => v.name;
  static const Field<Cat, String> _f$name = Field('name', _$name);
  static CatType _$breed(Cat v) => v.breed;
  static const Field<Cat, CatType> _f$breed = Field('breed', _$breed);
  static String _$color(Cat v) => v.color;
  static const Field<Cat, String> _f$color = Field('color', _$color);

  @override
  final MappableFields<Cat> fields = const {
    #name: _f$name,
    #breed: _f$breed,
    #color: _f$color,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Cat';
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Cat _instantiate(DecodingData data) {
    return Cat(data.dec(_f$name), data.dec(_f$breed), data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static Cat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Cat>(map);
  }

  static Cat fromJson(String json) {
    return ensureInitialized().decodeJson<Cat>(json);
  }
}

mixin CatMappable {
  String toJson() {
    return CatMapper.ensureInitialized().encodeJson<Cat>(this as Cat);
  }

  Map<String, dynamic> toMap() {
    return CatMapper.ensureInitialized().encodeMap<Cat>(this as Cat);
  }

  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() {
    return CatMapper.ensureInitialized().stringifyValue(this as Cat);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatMapper.ensureInitialized().isValueEqual(this as Cat, other));
  }

  @override
  int get hashCode {
    return CatMapper.ensureInitialized().hashValue(this as Cat);
  }
}

extension CatValueCopy<$R, $Out> on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get $asCat =>
      $base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $In extends Cat, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, CatType? breed, String? color});
  CatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CatCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Cat, $Out>
    implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cat> $mapper = CatMapper.ensureInitialized();
  @override
  $R call({String? name, CatType? breed, String? color}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (breed != null) #breed: breed,
        if (color != null) #color: color
      }));
  @override
  Cat $make(CopyWithData data) => Cat(data.get(#name, or: $value.name),
      data.get(#breed, or: $value.breed), data.get(#color, or: $value.color));

  @override
  CatCopyWith<$R2, Cat, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CatCopyWithImpl($value, $cast, t);
}
