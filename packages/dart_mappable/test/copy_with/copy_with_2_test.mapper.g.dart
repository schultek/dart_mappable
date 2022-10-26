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
  AMapper._(),
  CMapper._(),
  BMapper._(),
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
  CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2);
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
  DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2);
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

class AMapper extends BaseMapper<p0.A> {
  AMapper._();

  @override Function get decoder => decode;
  p0.A<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.A<T> fromMap<T>(Map<String, dynamic> map) => p0.A();

  @override Function get encoder => encode;
  dynamic encode<T>(p0.A<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(p0.A<T> a) => {...Mapper.i.$type<p0.A<T>>(a)};

  @override String stringify(p0.A self) => 'A()';
  @override int hash(p0.A self) => 0;
  @override bool equals(p0.A self, p0.A other) => true;

  @override Function get typeFactory => <T>(f) => f<p0.A<T>>();
}

extension AMapperExtension<T> on p0.A<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin AMixin<T> {
  ACopyWith<p0.A<T>, p0.A<T>, p0.A<T>, T> get copyWith => _ACopyWithImpl(this as p0.A<T>, $identity, $identity);
}

extension AObjectCopy<$R, $Out extends p0.A, T> on ObjectCopyWith<$R, p0.A<T>, $Out> {
  ACopyWith<$R, p0.A<T>, $Out, T> get asA => base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends p0.A<T>, $Out extends p0.A, T> implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2, T> _chain<$R2, $Out2 extends p0.A>(Then<p0.A<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ACopyWithImpl<$R, $Out extends p0.A, T> extends BaseCopyWith<$R, p0.A<T>, $Out> implements ACopyWith<$R, p0.A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override ACopyWith<$R2, p0.A<T>, $Out2, T> _chain<$R2, $Out2 extends p0.A>(Then<p0.A<T>, $Out2> t, Then<$Out2, $R2> t2) => _ACopyWithImpl($value, t, t2);

  @override $R call() => $then(p0.A());
}

class CMapper extends BaseMapper<p0.C> {
  CMapper._();

  @override Function get decoder => decode;
  p0.C<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.C<T> fromMap<T>(Map<String, dynamic> map) => p0.C();

  @override Function get encoder => encode;
  dynamic encode<T>(p0.C<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(p0.C<T> c) => {...Mapper.i.$type<p0.C<T>>(c)};

  @override String stringify(p0.C self) => 'C()';
  @override int hash(p0.C self) => 0;
  @override bool equals(p0.C self, p0.C other) => true;

  @override Function get typeFactory => <T>(f) => f<p0.C<T>>();
}

extension CMapperExtension<T> on p0.C<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin CMixin<T> {
  CCopyWith<p0.C<T>, p0.C<T>, T> get copyWith => _CCopyWithImpl(this as p0.C<T>, $identity, $identity);
}

extension CObjectCopy<$R, $Out extends p0.A, T> on ObjectCopyWith<$R, p0.C<T>, $Out> {
  CCopyWith<$R, $Out, T> get asC => base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R, $Out extends p0.A, T> implements ACopyWith<$R, p0.C<T>, $Out, T> {
  CCopyWith<$R2, $Out2, T> _chain<$R2, $Out2 extends p0.A>(Then<p0.C<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call();
}

class _CCopyWithImpl<$R, $Out extends p0.A, T> extends BaseCopyWith<$R, p0.C<T>, $Out> implements CCopyWith<$R, $Out, T> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override CCopyWith<$R2, $Out2, T> _chain<$R2, $Out2 extends p0.A>(Then<p0.C<T>, $Out2> t, Then<$Out2, $R2> t2) => _CCopyWithImpl($value, t, t2);

  @override $R call() => $then(p0.C());
}

class BMapper extends BaseMapper<p0.B> {
  BMapper._();

  @override Function get decoder => decode;
  p0.B decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.B fromMap(Map<String, dynamic> map) => p0.B(Mapper.i.$get(map, 'list'), Mapper.i.$getOpt(map, 'a'));

  @override Function get encoder => encode;
  dynamic encode(p0.B v) => toMap(v);
  Map<String, dynamic> toMap(p0.B b) => {'list': Mapper.i.$enc(b.list, 'list'), 'a': Mapper.i.$enc(b.a, 'a')};

  @override String stringify(p0.B self) => 'B(list: ${Mapper.asString(self.list)}, a: ${Mapper.asString(self.a)})';
  @override int hash(p0.B self) => Mapper.hash(self.list) ^ Mapper.hash(self.a);
  @override bool equals(p0.B self, p0.B other) => Mapper.isEqual(self.list, other.list) && Mapper.isEqual(self.a, other.a);

  @override Function get typeFactory => (f) => f<p0.B>();
}

extension BMapperExtension on p0.B {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BCopyWith<p0.B> get copyWith => _BCopyWithImpl(this, $identity, $identity);
}

extension BObjectCopy<$R> on ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R> get asB => base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R> implements ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R2> _chain<$R2>(Then<p0.B, p0.B> t, Then<p0.B, $R2> t2);
  ListCopyWith<$R, p0.A<dynamic>?, ACopyWith<$R, p0.A<dynamic>, p0.A<dynamic>, dynamic>?> get list;
  ACopyWith<$R, p0.A<dynamic>, p0.A<dynamic>, dynamic>? get a;
  $R call({List<p0.A<dynamic>?>? list, p0.A<dynamic>? a});
}

class _BCopyWithImpl<$R> extends BaseCopyWith<$R, p0.B, p0.B> implements BCopyWith<$R> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override BCopyWith<$R2> _chain<$R2>(Then<p0.B, p0.B> t, Then<p0.B, $R2> t2) => _BCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, p0.A<dynamic>?, ACopyWith<$R, p0.A<dynamic>, p0.A<dynamic>, dynamic>?> get list => ListCopyWith($value.list, (v, t) => v?.copyWith._chain($identity, t), (v) => call(list: v));
  @override ACopyWith<$R, p0.A<dynamic>, p0.A<dynamic>, dynamic>? get a => $value.a?.copyWith._chain($identity, (v) => call(a: v));
  @override $R call({List<p0.A<dynamic>?>? list, Object? a = $none}) => $then(p0.B(list ?? $value.list, or(a, $value.a)));
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
