import 'package:dart_mappable/internals.dart';

import 'polymorphism_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AnimalMapper._(),
  CatMapper._(),
  DogMapper._(),
  NullAnimalMapper._(),
  DefaultAnimalMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      case 1: return DogMapper._().decode(map);
      case null: return NullAnimalMapper._().decode(map);
      default: return DefaultAnimalMapper._().decode(map);
    }
  });
  Animal fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class Animal, did you forgot to specify a subclass for [ type: '${map['type']}' ] or a default subclass?");

  @override Function get encoder => (Animal v) => encode(v);
  dynamic encode(Animal v) {
    if (v is Cat) { return CatMapper._().encode(v); }
    else if (v is Dog) { return DogMapper._().encode(v); }
    else if (v is NullAnimal) { return NullAnimalMapper._().encode(v); }
    else if (v is DefaultAnimal) { return DefaultAnimalMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(Animal a) => {'name': Mapper.toValue(a.name)};

  @override String? stringify(Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int? hash(Animal self) => Mapper.hash(self.name);
  @override bool? equals(Animal self, Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<Animal>();
}

extension AnimalMapperExtension  on Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CatMapper extends BaseMapper<Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(map.get('name'), map.get('color'));

  @override Function get encoder => (Cat v) => encode(v);
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': Mapper.toValue(c.name), 'color': Mapper.toValue(c.color), 'type': 'Cat'};

  @override String? stringify(Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int? hash(Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool? equals(Cat self, Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<Cat>();
}

extension CatMapperExtension  on Cat {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CatCopyWith<Cat> get copyWith => CatCopyWith(this, $identity);
}

abstract class CatCopyWith<$R> {
  factory CatCopyWith(Cat value, Then<Cat, $R> then) = _CatCopyWithImpl<$R>;
  $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R> extends BaseCopyWith<Cat, $R> implements CatCopyWith<$R> {
  _CatCopyWithImpl(Cat value, Then<Cat, $R> then) : super(value, then);

  @override $R call({String? name, String? color}) => $then(Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends BaseMapper<Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  Dog decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(map.get('name'), map.get('age'));

  @override Function get encoder => (Dog v) => encode(v);
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {'name': Mapper.toValue(d.name), 'age': Mapper.toValue(d.age), 'type': 1};

  @override String? stringify(Dog self) => 'Dog(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)})';
  @override int? hash(Dog self) => Mapper.hash(self.name) ^ Mapper.hash(self.age);
  @override bool? equals(Dog self, Dog other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age);

  @override Function get typeFactory => (f) => f<Dog>();
}

extension DogMapperExtension  on Dog {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DogCopyWith<Dog> get copyWith => DogCopyWith(this, $identity);
}

abstract class DogCopyWith<$R> {
  factory DogCopyWith(Dog value, Then<Dog, $R> then) = _DogCopyWithImpl<$R>;
  $R call({String? name, int? age});
}

class _DogCopyWithImpl<$R> extends BaseCopyWith<Dog, $R> implements DogCopyWith<$R> {
  _DogCopyWithImpl(Dog value, Then<Dog, $R> then) : super(value, then);

  @override $R call({String? name, int? age}) => $then(Dog(name ?? $value.name, age ?? $value.age));
}

class NullAnimalMapper extends BaseMapper<NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  NullAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  NullAnimal fromMap(Map<String, dynamic> map) => NullAnimal(map.get('name'));

  @override Function get encoder => (NullAnimal v) => encode(v);
  dynamic encode(NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(NullAnimal n) => {'name': Mapper.toValue(n.name), 'type': null};

  @override String? stringify(NullAnimal self) => 'NullAnimal(name: ${Mapper.asString(self.name)})';
  @override int? hash(NullAnimal self) => Mapper.hash(self.name);
  @override bool? equals(NullAnimal self, NullAnimal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<NullAnimal>();
}

extension NullAnimalMapperExtension  on NullAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NullAnimalCopyWith<NullAnimal> get copyWith => NullAnimalCopyWith(this, $identity);
}

abstract class NullAnimalCopyWith<$R> {
  factory NullAnimalCopyWith(NullAnimal value, Then<NullAnimal, $R> then) = _NullAnimalCopyWithImpl<$R>;
  $R call({String? name});
}

class _NullAnimalCopyWithImpl<$R> extends BaseCopyWith<NullAnimal, $R> implements NullAnimalCopyWith<$R> {
  _NullAnimalCopyWithImpl(NullAnimal value, Then<NullAnimal, $R> then) : super(value, then);

  @override $R call({String? name}) => $then(NullAnimal(name ?? $value.name));
}

class DefaultAnimalMapper extends BaseMapper<DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  DefaultAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DefaultAnimal fromMap(Map<String, dynamic> map) => DefaultAnimal(map.get('name'), map.get('type'));

  @override Function get encoder => (DefaultAnimal v) => encode(v);
  dynamic encode(DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(DefaultAnimal d) => {'name': Mapper.toValue(d.name), 'type': Mapper.toValue(d.type)};

  @override String? stringify(DefaultAnimal self) => 'DefaultAnimal(name: ${Mapper.asString(self.name)}, type: ${Mapper.asString(self.type)})';
  @override int? hash(DefaultAnimal self) => Mapper.hash(self.name) ^ Mapper.hash(self.type);
  @override bool? equals(DefaultAnimal self, DefaultAnimal other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<DefaultAnimal>();
}

extension DefaultAnimalMapperExtension  on DefaultAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DefaultAnimalCopyWith<DefaultAnimal> get copyWith => DefaultAnimalCopyWith(this, $identity);
}

abstract class DefaultAnimalCopyWith<$R> {
  factory DefaultAnimalCopyWith(DefaultAnimal value, Then<DefaultAnimal, $R> then) = _DefaultAnimalCopyWithImpl<$R>;
  $R call({String? name, String? type});
}

class _DefaultAnimalCopyWithImpl<$R> extends BaseCopyWith<DefaultAnimal, $R> implements DefaultAnimalCopyWith<$R> {
  _DefaultAnimalCopyWithImpl(DefaultAnimal value, Then<DefaultAnimal, $R> then) : super(value, then);

  @override $R call({String? name, String? type}) => $then(DefaultAnimal(name ?? $value.name, type ?? $value.type));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static late MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable {
  BaseMapper? get _mapper => Mapper.get(runtimeType);

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) ||
      (runtimeType == other.runtimeType && (_mapper?.equals(this, other) 
      ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => _getOr(
      key, hooks, () => throw MapperException('Parameter $key is required.'));

  T? getOpt<T>(String key, {MappingHooks? hooks}) =>
      _getOr(key, hooks, () => null);

  T _getOr<T>(String key, MappingHooks? hooks, T Function() or) =>
      hooks.decode(this[key], (v) => v == null ? or() : Mapper.fromValue<T>(v));
}
