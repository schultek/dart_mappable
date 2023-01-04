// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'polymorph.dart';

class AnimalBMapper extends MapperBase<AnimalB> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AnimalBMapper()},
      ))
        ..linkAll({CatBMapper.container, DogBMapper.container}));

  @override
  AnimalBMapperElement createElement(MapperContainer container) {
    return AnimalBMapperElement._(this, container);
  }

  @override
  String get id => 'AnimalB';

  static final fromMap = container.fromMap<AnimalB>;
  static final fromJson = container.fromJson<AnimalB>;
}

class AnimalBMapperElement extends MapperElementBase<AnimalB> {
  AnimalBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  AnimalB decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'CatB':
            return CatBMapper().createElement(container).decode(map);
          case 'dog':
            return DogBMapper().createElement(container).decode(map);
          default:
            return fromMap(map);
        }
      });
  AnimalB fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass(
          'AnimalB', 'type', '${map['type']}');

  @override
  Function get encoder => encode;
  dynamic encode(AnimalB v) => toMap(v);
  Map<String, dynamic> toMap(AnimalB a) =>
      {'name': container.$enc(a.name, 'name')};

  @override
  String stringify(AnimalB self) =>
      'AnimalB(name: ${container.asString(self.name)})';
  @override
  int hash(AnimalB self) => container.hash(self.name);
  @override
  bool equals(AnimalB self, AnimalB other) =>
      container.isEqual(self.name, other.name);
}

mixin AnimalBMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalBCopyWith<AnimalB, AnimalB, AnimalB> get copyWith;
}

typedef AnimalBCopyWithBound = AnimalB;

abstract class AnimalBCopyWith<$R, $In extends AnimalB, $Out extends AnimalB>
    implements ObjectCopyWith<$R, $In, $Out> {
  AnimalBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(
      Then<AnimalB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class CatBMapper extends MapperBase<CatB> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CatBMapper()},
      ))
        ..linkAll({AnimalBMapper.container}));

  @override
  CatBMapperElement createElement(MapperContainer container) {
    return CatBMapperElement._(this, container);
  }

  @override
  String get id => 'CatB';

  static final fromMap = container.fromMap<CatB>;
  static final fromJson = container.fromJson<CatB>;
}

class CatBMapperElement extends MapperElementBase<CatB> {
  CatBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CatB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CatB fromMap(Map<String, dynamic> map) =>
      CatB(container.$get(map, 'name'), container.$get(map, 'color'));

  @override
  Function get encoder => encode;
  dynamic encode(CatB v) => toMap(v);
  Map<String, dynamic> toMap(CatB c) => {
        'name': container.$enc(c.name, 'name'),
        'color': container.$enc(c.color, 'color'),
        'type': 'CatB'
      };

  @override
  String stringify(CatB self) =>
      'CatB(name: ${container.asString(self.name)}, color: ${container.asString(self.color)})';
  @override
  int hash(CatB self) => container.hash(self.name) ^ container.hash(self.color);
  @override
  bool equals(CatB self, CatB other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.color, other.color);
}

mixin CatBMappable {
  String toJson() => CatBMapper.container.toJson(this as CatB);
  Map<String, dynamic> toMap() => CatBMapper.container.toMap(this as CatB);
  CatBCopyWith<CatB, CatB, CatB> get copyWith =>
      _CatBCopyWithImpl(this as CatB, $identity, $identity);
  @override
  String toString() => CatBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CatBMapper.container.isEqual(this, other));
  @override
  int get hashCode => CatBMapper.container.hash(this);
}

extension CatBValueCopy<$R, $Out extends AnimalB>
    on ObjectCopyWith<$R, CatB, $Out> {
  CatBCopyWith<$R, CatB, $Out> get asCatB =>
      base.as((v, t, t2) => _CatBCopyWithImpl(v, t, t2));
}

typedef CatBCopyWithBound = AnimalB;

abstract class CatBCopyWith<$R, $In extends CatB, $Out extends AnimalB>
    implements AnimalBCopyWith<$R, $In, $Out> {
  CatBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(
      Then<CatB, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, String? color});
}

class _CatBCopyWithImpl<$R, $Out extends AnimalB>
    extends CopyWithBase<$R, CatB, $Out>
    implements CatBCopyWith<$R, CatB, $Out> {
  _CatBCopyWithImpl(super.value, super.then, super.then2);
  @override
  CatBCopyWith<$R2, CatB, $Out2> chain<$R2, $Out2 extends AnimalB>(
          Then<CatB, $Out2> t, Then<$Out2, $R2> t2) =>
      _CatBCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, String? color}) =>
      $then(CatB(name ?? $value.name, color ?? $value.color));
}

class DogBMapper extends MapperBase<DogB> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DogBMapper()},
      ))
        ..linkAll({AnimalBMapper.container}));

  @override
  DogBMapperElement createElement(MapperContainer container) {
    return DogBMapperElement._(this, container);
  }

  @override
  String get id => 'DogB';

  static final fromMap = container.fromMap<DogB>;
  static final fromJson = container.fromJson<DogB>;
}

class DogBMapperElement extends MapperElementBase<DogB> {
  DogBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  DogB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  DogB fromMap(Map<String, dynamic> map) =>
      DogB(container.$get(map, 'name'), container.$get(map, 'age'));

  @override
  Function get encoder => encode;
  dynamic encode(DogB v) => toMap(v);
  Map<String, dynamic> toMap(DogB d) => {
        'name': container.$enc(d.name, 'name'),
        'age': container.$enc(d.age, 'age'),
        'type': 'dog'
      };

  @override
  String stringify(DogB self) =>
      'DogB(name: ${container.asString(self.name)}, age: ${container.asString(self.age)})';
  @override
  int hash(DogB self) => container.hash(self.name) ^ container.hash(self.age);
  @override
  bool equals(DogB self, DogB other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.age, other.age);
}

mixin DogBMappable {
  String toJson() => DogBMapper.container.toJson(this as DogB);
  Map<String, dynamic> toMap() => DogBMapper.container.toMap(this as DogB);
  DogBCopyWith<DogB, DogB, DogB> get copyWith =>
      _DogBCopyWithImpl(this as DogB, $identity, $identity);
  @override
  String toString() => DogBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DogBMapper.container.isEqual(this, other));
  @override
  int get hashCode => DogBMapper.container.hash(this);
}

extension DogBValueCopy<$R, $Out extends AnimalB>
    on ObjectCopyWith<$R, DogB, $Out> {
  DogBCopyWith<$R, DogB, $Out> get asDogB =>
      base.as((v, t, t2) => _DogBCopyWithImpl(v, t, t2));
}

typedef DogBCopyWithBound = AnimalB;

abstract class DogBCopyWith<$R, $In extends DogB, $Out extends AnimalB>
    implements AnimalBCopyWith<$R, $In, $Out> {
  DogBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AnimalB>(
      Then<DogB, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, int? age});
}

class _DogBCopyWithImpl<$R, $Out extends AnimalB>
    extends CopyWithBase<$R, DogB, $Out>
    implements DogBCopyWith<$R, DogB, $Out> {
  _DogBCopyWithImpl(super.value, super.then, super.then2);
  @override
  DogBCopyWith<$R2, DogB, $Out2> chain<$R2, $Out2 extends AnimalB>(
          Then<DogB, $Out2> t, Then<$Out2, $R2> t2) =>
      _DogBCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, int? age}) =>
      $then(DogB(name ?? $value.name, age ?? $value.age));
}
