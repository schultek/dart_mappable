// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cat.dart';

class CatMapper extends MapperBase<Cat> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CatMapper()},
      ))
        ..linkAll({AnimalMapper.container, CatTypeMapper.container}));

  @override
  CatMapperElement createElement(MapperContainer container) {
    return CatMapperElement._(this, container);
  }

  @override
  String get id => 'Cat';

  static final fromMap = container.fromMap<Cat>;
  static final fromJson = container.fromJson<Cat>;
}

class CatMapperElement extends MapperElementBase<Cat> {
  CatMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Cat decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(container.$get(map, 'name'),
      container.$get(map, 'breed'), container.$get(map, 'color'));

  @override
  Function get encoder => encode;
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {
        'name': container.$enc(c.name, 'name'),
        'breed': container.$enc(c.breed, 'breed'),
        'color': container.$enc(c.color, 'color'),
        'type': 'Cat'
      };

  @override
  String stringify(Cat self) =>
      'Cat(name: ${container.asString(self.name)}, color: ${container.asString(self.color)}, breed: ${container.asString(self.breed)})';
  @override
  int hash(Cat self) =>
      container.hash(self.name) ^
      container.hash(self.color) ^
      container.hash(self.breed);
  @override
  bool equals(Cat self, Cat other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.color, other.color) &&
      container.isEqual(self.breed, other.breed);
}

mixin CatMappable {
  String toJson() => CatMapper.container.toJson(this as Cat);
  Map<String, dynamic> toMap() => CatMapper.container.toMap(this as Cat);
  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() => CatMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CatMapper.container.isEqual(this, other));
  @override
  int get hashCode => CatMapper.container.hash(this);
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
  static MapperContainer container = MapperContainer(
    mappers: {CatTypeMapper()},
  );

  static final fromValue = container.fromValue<CatType>;

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
  String toValue() => CatTypeMapper.container.toValue(this) as String;
}
