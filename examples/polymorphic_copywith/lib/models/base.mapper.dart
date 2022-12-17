// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'base.dart';

class BaseMapper with MapperBase<Base> {
  static MapperContainer container = MapperContainer(
    mappers: {BaseMapper()},
  );

  @override
  BaseMapperElement createElement(MapperContainer container) {
    return BaseMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Base>;
  static final fromJson = container.fromJson<Base>;
}

class BaseMapperElement extends MapperElementBase<Base> {
  BaseMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Base decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Base fromMap(Map<String, dynamic> map) => throw MapperException.missingConstructor('Base');

  @override Function get encoder => encode;
  dynamic encode(Base v) => toMap(v);
  Map<String, dynamic> toMap(Base b) => {'id': container.$enc(b.id, 'id'), 'name': container.$enc(b.name, 'name'), 'objects': container.$enc(b.objects, 'objects')};

  @override String stringify(Base self) => 'Base(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, objects: ${container.asString(self.objects)})';
  @override int hash(Base self) => container.hash(self.id) ^ container.hash(self.name) ^ container.hash(self.objects);
  @override bool equals(Base self, Base other) => container.isEqual(self.id, other.id) && container.isEqual(self.name, other.name) && container.isEqual(self.objects, other.objects);
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

typedef BaseCopyWithBound = AbstractIdBase;
abstract class BaseCopyWith<$R, $In extends Base, $Out extends AbstractIdBase> implements ObjectCopyWith<$R, $In, $Out> {
  BaseCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AbstractIdBase>(Then<Base, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects;
  $R call({String? id, String? name, Map<String, dynamic>? objects});
}

