// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'package:v2_test/models/cat.dart';

// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class CatMapper with MapperBase<Cat> {
  static MapperContainer container = MapperContainer(
    mappers: {CatMapper()},
    join: {CatTypeMapper.container},
  );

  @override
  CatMapperElement createElement(MapperContainer container) {
    return CatMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Cat>;
  static final fromJson = container.fromJson<Cat>;
}

class CatMapperElement extends MapperElementBase<Cat> {
  CatMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(container.$get(map, 'name'), container.$get(map, 'type'), container.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': container.$enc(c.name, 'name'), 'type': container.$enc(c.type, 'type'), 'color': container.$enc(c.color, 'color')};

  @override String stringify(Cat self) => 'Cat(name: ${container.asString(self.name)}, color: ${container.asString(self.color)}, type: ${container.asString(self.type)})';
  @override int hash(Cat self) => container.hash(self.name) ^ container.hash(self.color) ^ container.hash(self.type);
  @override bool equals(Cat self, Cat other) => container.isEqual(self.name, other.name) && container.isEqual(self.color, other.color) && container.isEqual(self.type, other.type);
}

mixin CatMappable {
  String toJson() => CatMapper.container.toJson(this as Cat);
  Map<String, dynamic> toMap() => CatMapper.container.toMap(this as Cat);
  CatCopyWith<Cat, Cat> get copyWith => _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override String toString() => CatMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CatMapper.container.isEqual(this, other));
  @override int get hashCode => CatMapper.container.hash(this);
}

extension CatObjectCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $Out extends Animal> implements AnimalCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, CatType? type, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal> extends BaseCopyWith<$R, Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, CatType? type, String? color}) => $then(Cat(name ?? $value.name, type ?? $value.type, color ?? $value.color));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class CatTypeMapper extends EnumMapper<CatType> {
  static MapperContainer container = MapperContainer(
    mappers: {CatTypeMapper()},
  );

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
