import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'custom_mapper_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  GenericBoxMapper._(),
  // enum mappers
  // custom mappers
  PrivateClassMapper(),
  CustomGenericMapper(),
  UriMapper(),
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class GenericBoxMapper extends BaseMapper<GenericBox> {
  GenericBoxMapper._();

  @override Function get decoder => decode;
  GenericBox<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  GenericBox<T> fromMap<T>(Map<String, dynamic> map) => GenericBox(Mapper.i.$get(map, 'content'));

  @override Function get encoder => (GenericBox v) => encode(v);
  dynamic encode(GenericBox v) => toMap(v);
  Map<String, dynamic> toMap(GenericBox g) => {'content': Mapper.i.$enc(g.content, 'content')};

  @override String stringify(GenericBox self) => 'GenericBox(content: ${Mapper.asString(self.content)})';
  @override int hash(GenericBox self) => Mapper.hash(self.content);
  @override bool equals(GenericBox self, GenericBox other) => Mapper.isEqual(self.content, other.content);

  @override Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

extension GenericBoxMapperExtension <T> on GenericBox<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GenericBoxCopyWith<GenericBox<T>, T> get copyWith => GenericBoxCopyWith(this, $identity);
}

abstract class GenericBoxCopyWith<$R, T> {
  factory GenericBoxCopyWith(GenericBox<T> value, Then<GenericBox<T>, $R> then) = _GenericBoxCopyWithImpl<$R, T>;
  $R call({T? content});
  $R apply(GenericBox<T> Function(GenericBox<T>) transform);
}

class _GenericBoxCopyWithImpl<$R, T> extends BaseCopyWith<GenericBox<T>, $R> implements GenericBoxCopyWith<$R, T> {
  _GenericBoxCopyWithImpl(GenericBox<T> value, Then<GenericBox<T>, $R> then) : super(value, then);

  @override $R call({T? content}) => $then(GenericBox(content ?? $value.content));
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
