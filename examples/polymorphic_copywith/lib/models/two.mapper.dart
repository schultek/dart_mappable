// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'two.dart';

class TwoMapper extends MapperBase<Two> {
  static MapperContainer container = MapperContainer(
    mappers: {TwoMapper()},
  );

  @override
  TwoMapperElement createElement(MapperContainer container) {
    return TwoMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Two>;
  static final fromJson = container.fromJson<Two>;
}

class TwoMapperElement extends MapperElementBase<Two> {
  TwoMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Two decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Two fromMap(Map<String, dynamic> map) => Two(id: container.$get(map, 'id'));

  @override Function get encoder => encode;
  dynamic encode(Two v) => toMap(v);
  Map<String, dynamic> toMap(Two t) => {'id': container.$enc(t.id, 'id')};

  @override String stringify(Two self) => 'Two(id: ${container.asString(self.id)}, name: ${container.asString(self.name)})';
  @override int hash(Two self) => container.hash(self.id) ^ container.hash(self.name);
  @override bool equals(Two self, Two other) => container.isEqual(self.id, other.id) && container.isEqual(self.name, other.name);
}

mixin TwoMappable {
  String toJson() => TwoMapper.container.toJson(this as Two);
  Map<String, dynamic> toMap() => TwoMapper.container.toMap(this as Two);
  TwoCopyWith<Two, Two, Two> get copyWith => _TwoCopyWithImpl(this as Two, $identity, $identity);
  @override String toString() => TwoMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && TwoMapper.container.isEqual(this, other));
  @override int get hashCode => TwoMapper.container.hash(this);
}

extension TwoValueCopy<$R, $Out extends AbstractIdBase> on ObjectCopyWith<$R, Two, $Out> {
  TwoCopyWith<$R, Two, $Out> get asTwo => base.as((v, t, t2) => _TwoCopyWithImpl(v, t, t2));
}

typedef TwoCopyWithBound = AbstractIdBase;
abstract class TwoCopyWith<$R, $In extends Two, $Out extends AbstractIdBase> implements ObjectCopyWith<$R, $In, $Out> {
  TwoCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AbstractIdBase>(Then<Two, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
}

class _TwoCopyWithImpl<$R, $Out extends AbstractIdBase> extends CopyWithBase<$R, Two, $Out> implements TwoCopyWith<$R, Two, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);
  @override TwoCopyWith<$R2, Two, $Out2> chain<$R2, $Out2 extends AbstractIdBase>(Then<Two, $Out2> t, Then<$Out2, $R2> t2) => _TwoCopyWithImpl($value, t, t2);

  @override $R call({String? id}) => $then(Two(id: id ?? $value.id));
}
