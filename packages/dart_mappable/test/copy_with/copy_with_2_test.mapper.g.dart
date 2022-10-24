// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'copy_with_2_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AnimalMapper._(),
  CatMapper._(),
  DogMapper._(),
  ZooMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<p0.Animal> {
  AnimalMapper._();

  @override String stringify(p0.Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
}

extension AnimalMapperExtension on p0.Animal {
}

mixin AnimalMixin {
  AnimalCopyWith<p0.Animal, p0.Animal, p0.Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends p0.Animal, $Out extends p0.Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}


class CatMapper extends BaseMapper<p0.Cat> {
  CatMapper._();

  @override String stringify(p0.Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
}

extension CatMapperExtension on p0.Cat {
}

mixin CatMixin {
  CatCopyWith<p0.Cat, p0.Cat> get copyWith => _CatCopyWithImpl(this as p0.Cat, $identity, $identity);
}

extension CatObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.Cat, $Out> {
  CatCopyWith<$R, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.Cat, $Out> {
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(p0.Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends BaseMapper<p0.Dog> {
  DogMapper._();

  @override String stringify(p0.Dog self) => 'Dog(name: ${Mapper.asString(self.name)})';
}

extension DogMapperExtension on p0.Dog {
}

mixin DogMixin {
  DogCopyWith<p0.Dog, p0.Dog> get copyWith => _DogCopyWithImpl(this as p0.Dog, $identity, $identity);
}

extension DogObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.Dog, $Out> {
  DogCopyWith<$R, $Out> get asDog => base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.Dog, $Out> {
  @override $R call({String? name});
}

class _DogCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.Dog, $Out> implements DogCopyWith<$R, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2) => _DogCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(p0.Dog(name ?? $value.name));
}

class ZooMapper extends BaseMapper<p0.Zoo> {
  ZooMapper._();

  @override String stringify(p0.Zoo self) => 'Zoo(animal: ${Mapper.asString(self.animal)})';
}

extension ZooMapperExtension on p0.Zoo {
  ZooCopyWith<p0.Zoo> get copyWith => _ZooCopyWithImpl(this, $identity, $identity);
}

extension ZooObjectCopy<$R> on ObjectCopyWith<$R, p0.Zoo, p0.Zoo> {
  ZooCopyWith<$R> get asZoo => base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

abstract class ZooCopyWith<$R> implements ObjectCopyWith<$R, p0.Zoo, p0.Zoo> {
  ZooCopyWith<$R2> _chain<$R2>(Then<p0.Zoo, p0.Zoo> t, Then<p0.Zoo, $R2> t2);
  AnimalCopyWith<$R, p0.Animal, p0.Animal> get animal;
  $R call({p0.Animal? animal});
}

class _ZooCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Zoo, p0.Zoo> implements ZooCopyWith<$R> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override ZooCopyWith<$R2> _chain<$R2>(Then<p0.Zoo, p0.Zoo> t, Then<p0.Zoo, $R2> t2) => _ZooCopyWithImpl($value, t, t2);

  @override AnimalCopyWith<$R, p0.Animal, p0.Animal> get animal => $value.animal.copyWith._chain($identity, (v) => call(animal: v));
  @override $R call({p0.Animal? animal}) => $then(p0.Zoo(animal ?? $value.animal));
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

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
