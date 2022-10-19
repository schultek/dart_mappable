import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'main.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  UnionMapper._(),
  DataMapper._(),
  LoadingMapper._(),
  ErrorDetailsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class UnionMapper extends BaseMapper<p0.Union> {
  UnionMapper._();

  @override Function get decoder => decode;
  p0.Union decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'data': return DataMapper._().decode(map);
      case 'error': return ErrorDetailsMapper._().decode(map);
      case 'loading': return LoadingMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  p0.Union fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Union', 'type', '${map['type']}');

  @override Function get encoder => (p0.Union v) => encode(v);
  dynamic encode(p0.Union v) {
    if (v is p0.Data) { return DataMapper._().encode(v); }
    else if (v is p0.Loading) { return LoadingMapper._().encode(v); }
    else if (v is p0.ErrorDetails) { return ErrorDetailsMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(p0.Union u) => {};

  @override String stringify(p0.Union self) => 'Union()';
  @override int hash(p0.Union self) => 0;
  @override bool equals(p0.Union self, p0.Union other) => true;

  @override Function get typeFactory => (f) => f<p0.Union>();
}

extension UnionMapperExtension on p0.Union {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class DataMapper extends BaseMapper<p0.Data> {
  DataMapper._();

  @override Function get decoder => decode;
  p0.Data decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Data fromMap(Map<String, dynamic> map) => p0.Data(Mapper.i.$get(map, 'mykey'));

  @override Function get encoder => (p0.Data v) => encode(v);
  dynamic encode(p0.Data v) => toMap(v);
  Map<String, dynamic> toMap(p0.Data d) => {'mykey': Mapper.i.$enc(d.value, 'value'), 'type': 'data'};

  @override String stringify(p0.Data self) => 'Data()';
  @override int hash(p0.Data self) => 0;
  @override bool equals(p0.Data self, p0.Data other) => true;

  @override Function get typeFactory => (f) => f<p0.Data>();
}

extension DataMapperExtension on p0.Data {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DataCopyWith<p0.Data> get copyWith => DataCopyWith(this, $identity);
}

abstract class DataCopyWith<$R> {
  factory DataCopyWith(p0.Data value, Then<p0.Data, $R> then) = _DataCopyWithImpl<$R>;
  $R call({int? value});
  $R apply(p0.Data Function(p0.Data) transform);
}

class _DataCopyWithImpl<$R> extends BaseCopyWith<p0.Data, $R> implements DataCopyWith<$R> {
  _DataCopyWithImpl(p0.Data value, Then<p0.Data, $R> then) : super(value, then);

  @override $R call({int? value}) => $then(p0.Data(value ?? $value.value));
}

class LoadingMapper extends BaseMapper<p0.Loading> {
  LoadingMapper._();

  @override Function get decoder => decode;
  p0.Loading decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Loading fromMap(Map<String, dynamic> map) => p0.Loading();

  @override Function get encoder => (p0.Loading v) => encode(v);
  dynamic encode(p0.Loading v) => toMap(v);
  Map<String, dynamic> toMap(p0.Loading l) => {'type': 'loading'};

  @override String stringify(p0.Loading self) => 'Loading()';
  @override int hash(p0.Loading self) => 0;
  @override bool equals(p0.Loading self, p0.Loading other) => true;

  @override Function get typeFactory => (f) => f<p0.Loading>();
}

extension LoadingMapperExtension on p0.Loading {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  LoadingCopyWith<p0.Loading> get copyWith => LoadingCopyWith(this, $identity);
}

abstract class LoadingCopyWith<$R> {
  factory LoadingCopyWith(p0.Loading value, Then<p0.Loading, $R> then) = _LoadingCopyWithImpl<$R>;
  $R call();
  $R apply(p0.Loading Function(p0.Loading) transform);
}

class _LoadingCopyWithImpl<$R> extends BaseCopyWith<p0.Loading, $R> implements LoadingCopyWith<$R> {
  _LoadingCopyWithImpl(p0.Loading value, Then<p0.Loading, $R> then) : super(value, then);

  @override $R call() => $then(p0.Loading());
}

class ErrorDetailsMapper extends BaseMapper<p0.ErrorDetails> {
  ErrorDetailsMapper._();

  @override Function get decoder => decode;
  p0.ErrorDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.ErrorDetails fromMap(Map<String, dynamic> map) => p0.ErrorDetails(Mapper.i.$getOpt(map, 'message'));

  @override Function get encoder => (p0.ErrorDetails v) => encode(v);
  dynamic encode(p0.ErrorDetails v) => toMap(v);
  Map<String, dynamic> toMap(p0.ErrorDetails e) => {'message': Mapper.i.$enc(e.message, 'message'), 'type': 'error'};

  @override String stringify(p0.ErrorDetails self) => 'ErrorDetails()';
  @override int hash(p0.ErrorDetails self) => 0;
  @override bool equals(p0.ErrorDetails self, p0.ErrorDetails other) => true;

  @override Function get typeFactory => (f) => f<p0.ErrorDetails>();
}

extension ErrorDetailsMapperExtension on p0.ErrorDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ErrorDetailsCopyWith<p0.ErrorDetails> get copyWith => ErrorDetailsCopyWith(this, $identity);
}

abstract class ErrorDetailsCopyWith<$R> {
  factory ErrorDetailsCopyWith(p0.ErrorDetails value, Then<p0.ErrorDetails, $R> then) = _ErrorDetailsCopyWithImpl<$R>;
  $R call({String? message});
  $R apply(p0.ErrorDetails Function(p0.ErrorDetails) transform);
}

class _ErrorDetailsCopyWithImpl<$R> extends BaseCopyWith<p0.ErrorDetails, $R> implements ErrorDetailsCopyWith<$R> {
  _ErrorDetailsCopyWithImpl(p0.ErrorDetails value, Then<p0.ErrorDetails, $R> then) : super(value, then);

  @override $R call({Object? message = $none}) => $then(p0.ErrorDetails(or(message, $value.message)));
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
