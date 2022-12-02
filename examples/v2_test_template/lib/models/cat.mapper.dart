part of 'cat.dart';


class CatMapper with MapperBase<Cat> {
  static MapperContainer container = MapperContainer(
    mappers: {CatMapper()},
  );

  @override
  CatMapperElement createElement(MapperContainer container) {
    return CatMapperElement._(this, container);
  }
}

class CatMapperElement extends MapperElementBase<Cat> {
  CatMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(container.$get(map, 'name'), container.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': container.$enc(c.name, 'name'), 'color': container.$enc(c.color, 'color'), 'type': 'Cat'};

  @override String stringify(Cat self) => 'Cat(name: ${container.asString(self.name)}, color: ${container.asString(self.color)})';
  @override int hash(Cat self) => container.hash(self.name) ^ container.hash(self.color);
  @override bool equals(Cat self, Cat other) => container.isEqual(self.name, other.name) && container.isEqual(self.color, other.color);
}

mixin CatMappable implements MappableMixin {
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
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal> extends BaseCopyWith<$R, Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(Cat(name ?? $value.name, color ?? $value.color));
}

