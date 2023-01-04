// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'mixed_mappable_test.dart';

class BaseMapper extends MapperBase<Base> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {BaseMapper()},
      ))
        ..linkAll({OneMapper.container}));

  @override
  BaseMapperElement createElement(MapperContainer container) {
    return BaseMapperElement._(this, container);
  }

  @override
  String get id => 'Base';

  static final fromMap = container.fromMap<Base>;
  static final fromJson = container.fromJson<Base>;
}

class BaseMapperElement extends MapperElementBase<Base> {
  BaseMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Base decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Base fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingConstructor('Base');

  @override
  Function get encoder => encode;
  dynamic encode(Base v) => toMap(v);
  Map<String, dynamic> toMap(Base b) => {
        'id': container.$enc(b.id, 'id'),
        'name': container.$enc(b.name, 'name'),
        'objects': container.$enc(b.objects, 'objects')
      };

  @override
  String stringify(Base self) =>
      'Base(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, objects: ${container.asString(self.objects)})';
  @override
  int hash(Base self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.objects);
  @override
  bool equals(Base self, Base other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.objects, other.objects);
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

typedef BaseCopyWithBound = Base;

abstract class BaseCopyWith<$R, $In extends Base, $Out extends Base>
    implements ObjectCopyWith<$R, $In, $Out> {
  BaseCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Base>(
      Then<Base, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>
      get objects;
  $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class OneMapper extends MapperBase<One> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {OneMapper()},
      ))
        ..linkAll({BaseMapper.container}));

  @override
  OneMapperElement createElement(MapperContainer container) {
    return OneMapperElement._(this, container);
  }

  @override
  String get id => 'One';

  static final fromMap = container.fromMap<One>;
  static final fromJson = container.fromJson<One>;
}

class OneMapperElement extends MapperElementBase<One> {
  OneMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  One decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  One fromMap(Map<String, dynamic> map) => One(
      id: container.$get(map, 'id'),
      name: container.$get(map, 'name'),
      objects: container.$get(map, 'objects'));

  @override
  Function get encoder => encode;
  dynamic encode(One v) => toMap(v);
  Map<String, dynamic> toMap(One o) => {
        'id': container.$enc(o.id, 'id'),
        'name': container.$enc(o.name, 'name'),
        'objects': container.$enc(o.objects, 'objects')
      };

  @override
  String stringify(One self) =>
      'One(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, objects: ${container.asString(self.objects)})';
  @override
  int hash(One self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.objects);
  @override
  bool equals(One self, One other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.objects, other.objects);
}

mixin OneMappable {
  String toJson() => OneMapper.container.toJson(this as One);
  Map<String, dynamic> toMap() => OneMapper.container.toMap(this as One);
  OneCopyWith<One, One, One> get copyWith =>
      _OneCopyWithImpl(this as One, $identity, $identity);
  @override
  String toString() => OneMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          OneMapper.container.isEqual(this, other));
  @override
  int get hashCode => OneMapper.container.hash(this);
}

extension OneValueCopy<$R, $Out extends Base> on ObjectCopyWith<$R, One, $Out> {
  OneCopyWith<$R, One, $Out> get asOne =>
      base.as((v, t, t2) => _OneCopyWithImpl(v, t, t2));
}

typedef OneCopyWithBound = Base;

abstract class OneCopyWith<$R, $In extends One, $Out extends Base>
    implements BaseCopyWith<$R, $In, $Out> {
  OneCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Base>(
      Then<One, $Out2> t, Then<$Out2, $R2> t2);
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get objects;
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class _OneCopyWithImpl<$R, $Out extends Base>
    extends CopyWithBase<$R, One, $Out> implements OneCopyWith<$R, One, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);
  @override
  OneCopyWith<$R2, One, $Out2> chain<$R2, $Out2 extends Base>(
          Then<One, $Out2> t, Then<$Out2, $R2> t2) =>
      _OneCopyWithImpl($value, t, t2);

  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get objects => MapCopyWith($value.objects,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(objects: v));
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects}) =>
      $then(One(
          id: id ?? $value.id,
          name: name ?? $value.name,
          objects: objects ?? $value.objects));
}

class TwoMapper extends MapperBase<Two> {
  static MapperContainer container = MapperContainer(
    mappers: {TwoMapper()},
  );

  @override
  TwoMapperElement createElement(MapperContainer container) {
    return TwoMapperElement._(this, container);
  }

  @override
  String get id => 'Two';

  static final fromMap = container.fromMap<Two>;
  static final fromJson = container.fromJson<Two>;
}

class TwoMapperElement extends MapperElementBase<Two> {
  TwoMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Two decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Two fromMap(Map<String, dynamic> map) => Two(id: container.$get(map, 'id'));

  @override
  Function get encoder => encode;
  dynamic encode(Two v) => toMap(v);
  Map<String, dynamic> toMap(Two t) => {'id': container.$enc(t.id, 'id')};

  @override
  String stringify(Two self) =>
      'Two(id: ${container.asString(self.id)}, name: ${container.asString(self.name)})';
  @override
  int hash(Two self) => container.hash(self.id) ^ container.hash(self.name);
  @override
  bool equals(Two self, Two other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name);
}

mixin TwoMappable {
  String toJson() => TwoMapper.container.toJson(this as Two);
  Map<String, dynamic> toMap() => TwoMapper.container.toMap(this as Two);
  TwoCopyWith<Two, Two, Two> get copyWith =>
      _TwoCopyWithImpl(this as Two, $identity, $identity);
  @override
  String toString() => TwoMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          TwoMapper.container.isEqual(this, other));
  @override
  int get hashCode => TwoMapper.container.hash(this);
}

extension TwoValueCopy<$R, $Out extends Two> on ObjectCopyWith<$R, Two, $Out> {
  TwoCopyWith<$R, Two, $Out> get asTwo =>
      base.as((v, t, t2) => _TwoCopyWithImpl(v, t, t2));
}

typedef TwoCopyWithBound = Two;

abstract class TwoCopyWith<$R, $In extends Two, $Out extends Two>
    implements ObjectCopyWith<$R, $In, $Out> {
  TwoCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Two>(
      Then<Two, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
}

class _TwoCopyWithImpl<$R, $Out extends Two> extends CopyWithBase<$R, Two, $Out>
    implements TwoCopyWith<$R, Two, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);
  @override
  TwoCopyWith<$R2, Two, $Out2> chain<$R2, $Out2 extends Two>(
          Then<Two, $Out2> t, Then<$Out2, $R2> t2) =>
      _TwoCopyWithImpl($value, t, t2);

  @override
  $R call({String? id}) => $then(Two(id: id ?? $value.id));
}
