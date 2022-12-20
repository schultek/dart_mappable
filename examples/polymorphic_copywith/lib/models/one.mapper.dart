// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'one.dart';

class OneMapper extends MapperBase<One> {
  static MapperContainer container = MapperContainer(
    mappers: {OneMapper()},
  );

  @override
  OneMapperElement createElement(MapperContainer container) {
    return OneMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<One>;
  static final fromJson = container.fromJson<One>;
}

class OneMapperElement extends MapperElementBase<One> {
  OneMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  One decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  One fromMap(Map<String, dynamic> map) => One(id: container.$get(map, 'id'), name: container.$get(map, 'name'), objects: container.$get(map, 'objects'));

  @override Function get encoder => encode;
  dynamic encode(One v) => toMap(v);
  Map<String, dynamic> toMap(One o) => {'id': container.$enc(o.id, 'id'), 'name': container.$enc(o.name, 'name'), 'objects': container.$enc(o.objects, 'objects')};

  @override String stringify(One self) => 'One(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, objects: ${container.asString(self.objects)})';
  @override int hash(One self) => container.hash(self.id) ^ container.hash(self.name) ^ container.hash(self.objects);
  @override bool equals(One self, One other) => container.isEqual(self.id, other.id) && container.isEqual(self.name, other.name) && container.isEqual(self.objects, other.objects);
}

mixin OneMappable {
  String toJson() => OneMapper.container.toJson(this as One);
  Map<String, dynamic> toMap() => OneMapper.container.toMap(this as One);
  OneCopyWith<One, One, One> get copyWith => _OneCopyWithImpl(this as One, $identity, $identity);
  @override String toString() => OneMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && OneMapper.container.isEqual(this, other));
  @override int get hashCode => OneMapper.container.hash(this);
}

extension OneValueCopy<$R, $Out extends BaseCopyWithBound> on ObjectCopyWith<$R, One, $Out> {
  OneCopyWith<$R, One, $Out> get asOne => base.as((v, t, t2) => _OneCopyWithImpl(v, t, t2));
}

typedef OneCopyWithBound = BaseCopyWithBound;
abstract class OneCopyWith<$R, $In extends One, $Out extends BaseCopyWithBound> implements BaseCopyWith<$R, $In, $Out> {
  OneCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends BaseCopyWithBound>(Then<One, $Out2> t, Then<$Out2, $R2> t2);
  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects;
  @override $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class _OneCopyWithImpl<$R, $Out extends BaseCopyWithBound> extends CopyWithBase<$R, One, $Out> implements OneCopyWith<$R, One, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);
  @override OneCopyWith<$R2, One, $Out2> chain<$R2, $Out2 extends BaseCopyWithBound>(Then<One, $Out2> t, Then<$Out2, $R2> t2) => _OneCopyWithImpl($value, t, t2);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects => MapCopyWith($value.objects, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(objects: v));
  @override $R call({String? id, String? name, Map<String, dynamic>? objects}) => $then(One(id: id ?? $value.id, name: name ?? $value.name, objects: objects ?? $value.objects));
}
