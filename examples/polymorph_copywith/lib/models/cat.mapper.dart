// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cat.dart';

class CatMapper extends ClassMapperBase<Cat> {
  static final CatMapper instance = CatMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({AnimalMapper.container, CatTypeMapper.container}));

  @override
  String get id => 'Cat';

  static String _$name(Cat v) => v.name;
  static CatType _$breed(Cat v) => v.breed;
  static String _$color(Cat v) => v.color;

  @override
  final Map<Symbol, Field<Cat, dynamic>> fields = const {
    #name: Field<Cat, String>('name', _$name),
    #breed: Field<Cat, CatType>('breed', _$breed),
    #color: Field<Cat, String>('color', _$color),
  };

  static Cat _instantiate(DecodingData data) {
    return Cat(data.get(#name), data.get(#breed), data.get(#color));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Cat>;
  static final fromJson = container.fromJson<Cat>;
}

mixin CatMappable {
  String toJson() => CatMapper.container.toJson(this as Cat);
  Map<String, dynamic> toMap() => CatMapper.container.toMap(this as Cat);
  CatCopyWith<Cat, Cat, Cat> get copyWith => _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override String toString() => CatMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CatMapper.container.isEqual(this, other));
  @override int get hashCode => CatMapper.container.hash(this);
}

extension CatValueCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;
abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  CatCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, CatType? breed, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal> extends CopyWithBase<$R, Cat, $Out> implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, Cat, $Out2> chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, CatType? breed, String? color}) => $then(Cat(name ?? $value.name, breed ?? $value.breed, color ?? $value.color));
}

class CatTypeMapper extends EnumMapper<CatType> {
  static MapperContainer container = MapperContainer(
    mappers: {CatTypeMapper()},
  );

  static final fromValue = container.fromValue<CatType>;

  @override
  CatType decode(dynamic value) {
    switch (value) {
      case 'black': return CatType.black;
      case 'siamese': return CatType.siamese;
      case 'tiger': return CatType.tiger;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CatType self) {
    switch (self) {
      case CatType.black: return 'black';
      case CatType.siamese: return 'siamese';
      case CatType.tiger: return 'tiger';
    }
  }
}

extension CatTypeMapperExtension on CatType {
  String toValue() => CatTypeMapper.container.toValue(this) as String;
}
