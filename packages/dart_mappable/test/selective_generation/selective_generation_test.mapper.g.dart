// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'other/models.dart' as p1;
import 'selective_generation_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<p0.Person> {
  PersonMapper._();

  @override Function get encoder => encode;
  dynamic encode(p0.Person v) => toMap(v);
  Map<String, dynamic> toMap(p0.Person p) => {'name': Mapper.i.$enc(p.name, 'name')};
}

extension PersonMapperExtension on p0.Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<p0.Person> get copyWith => _PersonCopyWithImpl(this, $identity);
}

extension PersonObjectCopy<$R> on ObjectCopyWith<$R, p0.Person> {
  PersonCopyWith<$R> get asPerson => base.as((v, t) => _PersonCopyWithImpl(v, t));
}

abstract class PersonCopyWith<$R> implements ObjectCopyWith<$R, p0.Person> {
  PersonCopyWith<$R2> _chain<$R2>(Then<$R, $R2> then);
  $R call({String? name});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Person> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(super.value, super.then);
  @override PersonCopyWith<$R2> _chain<$R2>(Then<$R, $R2> then) => _PersonCopyWithImpl($value, (v) => then($then(v)));

  @override $R call({String? name}) => $then(p0.Person(name ?? $value.name));
}

class CarMapper extends BaseMapper<p1.Car> {
  CarMapper._();

  @override String stringify(p1.Car self) => 'Car(brand: ${Mapper.asString(self.brand)})';
  @override int hash(p1.Car self) => Mapper.hash(self.brand);
  @override bool equals(p1.Car self, p1.Car other) => Mapper.isEqual(self.brand, other.brand);
}

extension CarMapperExtension on p1.Car {
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

extension _ChainedCopyWith<$R, $T> on ObjectCopyWith<$R, $T> {
  BaseCopyWith<$R, $T> get base => this as BaseCopyWith<$R, $T>;
}
