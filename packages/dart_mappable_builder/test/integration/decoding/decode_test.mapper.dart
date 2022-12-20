// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'decode_test.dart';

class ModelMapper extends MapperBase<Model> {
  static MapperContainer container = MapperContainer(
    mappers: {ModelMapper()},
  );

  @override
  ModelMapperElement createElement(MapperContainer container) {
    return ModelMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Model>;
  static final fromJson = container.fromJson<Model>;
}

class ModelMapperElement extends MapperElementBase<Model> {
  ModelMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Model decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Model fromMap(Map<String, dynamic> map) => Model(container.$get(map, 'a'), b: container.$getOpt(map, 'b') ?? 18, c: container.$getOpt(map, 'c'), d: container.$get(map, 'd'));

  @override Function get encoder => encode;
  dynamic encode(Model v) => toMap(v);
  Map<String, dynamic> toMap(Model m) => {'a': container.$enc(m.a, 'a'), 'b': container.$enc(m.b, 'b'), 'c': container.$enc(m.c, 'c'), 'd': container.$enc(m.d, 'd')};

  @override String stringify(Model self) => 'Model(a: ${container.asString(self.a)}, b: ${container.asString(self.b)}, c: ${container.asString(self.c)}, d: ${container.asString(self.d)})';
  @override int hash(Model self) => container.hash(self.a) ^ container.hash(self.b) ^ container.hash(self.c) ^ container.hash(self.d);
  @override bool equals(Model self, Model other) => container.isEqual(self.a, other.a) && container.isEqual(self.b, other.b) && container.isEqual(self.c, other.c) && container.isEqual(self.d, other.d);
}

mixin ModelMappable {
  String toJson() => ModelMapper.container.toJson(this as Model);
  Map<String, dynamic> toMap() => ModelMapper.container.toMap(this as Model);
  ModelCopyWith<Model, Model, Model> get copyWith => _ModelCopyWithImpl(this as Model, $identity, $identity);
  @override String toString() => ModelMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ModelMapper.container.isEqual(this, other));
  @override int get hashCode => ModelMapper.container.hash(this);
}

extension ModelValueCopy<$R, $Out extends Model> on ObjectCopyWith<$R, Model, $Out> {
  ModelCopyWith<$R, Model, $Out> get asModel => base.as((v, t, t2) => _ModelCopyWithImpl(v, t, t2));
}

typedef ModelCopyWithBound = Model;
abstract class ModelCopyWith<$R, $In extends Model, $Out extends Model> implements ObjectCopyWith<$R, $In, $Out> {
  ModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Model>(Then<Model, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? a, int? b, double? c, bool? d});
}

class _ModelCopyWithImpl<$R, $Out extends Model> extends CopyWithBase<$R, Model, $Out> implements ModelCopyWith<$R, Model, $Out> {
  _ModelCopyWithImpl(super.value, super.then, super.then2);
  @override ModelCopyWith<$R2, Model, $Out2> chain<$R2, $Out2 extends Model>(Then<Model, $Out2> t, Then<$Out2, $R2> t2) => _ModelCopyWithImpl($value, t, t2);

  @override $R call({String? a, int? b, Object? c = $none, bool? d}) => $then(Model(a ?? $value.a, b: b ?? $value.b, c: or(c, $value.c), d: d ?? $value.d));
}
