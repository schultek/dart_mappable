// ignore_for_file: unused_element
part of 'package:v2_test/models/animal.dart';
// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AnimalMapper._(),
  DogMapper._(),
  CatMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<p0.Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  p0.Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      case 1: return DogMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  p0.Animal fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override Function get encoder => encode;
  dynamic encode(p0.Animal v) => toMap(v);
  Map<String, dynamic> toMap(p0.Animal a) => {'name': Mapper.i.$enc(a.name, 'name')};

  @override String stringify(p0.Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.Animal self) => Mapper.hash(self.name);
  @override bool equals(p0.Animal self, p0.Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.Animal>();
}

mixin AnimalMappable implements MappableMixin {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<p0.Animal, p0.Animal, p0.Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends p0.Animal, $Out extends p0.Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}


class DogMapper extends BaseMapper<p0.Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  p0.Dog decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Dog fromMap(Map<String, dynamic> map) => p0.Dog(Mapper.i.$get(map, 'age'));

  @override Function get encoder => encode;
  dynamic encode(p0.Dog v) => toMap(v);
  Map<String, dynamic> toMap(p0.Dog d) => {'age': Mapper.i.$enc(d.age, 'age'), 'type': 1};

  @override String stringify(p0.Dog self) => 'Dog(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)})';
  @override int hash(p0.Dog self) => Mapper.hash(self.name) ^ Mapper.hash(self.age);
  @override bool equals(p0.Dog self, p0.Dog other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age);

  @override Function get typeFactory => (f) => f<p0.Dog>();
}

mixin DogMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Dog);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Dog);
  DogCopyWith<p0.Dog, p0.Dog> get copyWith => _DogCopyWithImpl(this as p0.Dog, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension DogObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.Dog, $Out> {
  DogCopyWith<$R, $Out> get asDog => base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.Dog, $Out> {
  DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({int? age});
}

class _DogCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.Dog, $Out> implements DogCopyWith<$R, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2) => _DogCopyWithImpl($value, t, t2);

  @override $R call({int? age}) => $then(p0.Dog(age ?? $value.age));
}

class CatMapper extends BaseMapper<p1.Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  p1.Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.Cat fromMap(Map<String, dynamic> map) => p1.Cat(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p1.Cat v) => toMap(v);
  Map<String, dynamic> toMap(p1.Cat c) => {'name': Mapper.i.$enc(c.name, 'name'), 'color': Mapper.i.$enc(c.color, 'color'), 'type': 'Cat'};

  @override String stringify(p1.Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int hash(p1.Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool equals(p1.Cat self, p1.Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p1.Cat>();
}

mixin CatMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p1.Cat);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p1.Cat);
  CatCopyWith<p1.Cat, p1.Cat> get copyWith => _CatCopyWithImpl(this as p1.Cat, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension CatObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p1.Cat, $Out> {
  CatCopyWith<$R, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p1.Cat, $Out> {
  CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p1.Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p1.Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p1.Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(p1.Cat(name ?? $value.name, color ?? $value.color));
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
