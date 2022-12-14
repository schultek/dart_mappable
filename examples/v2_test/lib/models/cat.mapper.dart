// ignore_for_file: unused_element
part of 'package:v2_test/models/cat.dart';
// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  CatMapper._(),
  AnimalMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class CatMapper extends BaseMapper<p0.Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  p0.Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Cat fromMap(Map<String, dynamic> map) => p0.Cat(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p0.Cat v) => toMap(v);
  Map<String, dynamic> toMap(p0.Cat c) => {'name': Mapper.i.$enc(c.name, 'name'), 'color': Mapper.i.$enc(c.color, 'color'), 'type': 'Cat'};

  @override String stringify(p0.Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int hash(p0.Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool equals(p0.Cat self, p0.Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p0.Cat>();
}

mixin CatMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Cat);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Cat);
  CatCopyWith<p0.Cat, p0.Cat> get copyWith => _CatCopyWithImpl(this as p0.Cat, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension CatObjectCopy<$R, $Out extends p1.Animal> on ObjectCopyWith<$R, p0.Cat, $Out> {
  CatCopyWith<$R, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $Out extends p1.Animal> implements AnimalCopyWith<$R, p0.Cat, $Out> {
  CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p1.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends p1.Animal> extends BaseCopyWith<$R, p0.Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p1.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(p0.Cat(name ?? $value.name, color ?? $value.color));
}

class AnimalMapper extends BaseMapper<p1.Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  p1.Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  p1.Animal fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override Function get encoder => encode;
  dynamic encode(p1.Animal v) => toMap(v);
  Map<String, dynamic> toMap(p1.Animal a) => {'name': Mapper.i.$enc(a.name, 'name')};

  @override String stringify(p1.Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int hash(p1.Animal self) => Mapper.hash(self.name);
  @override bool equals(p1.Animal self, p1.Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p1.Animal>();
}

mixin AnimalMappable implements MappableMixin {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<p1.Animal, p1.Animal, p1.Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends p1.Animal, $Out extends p1.Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p1.Animal>(Then<p1.Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}



// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
