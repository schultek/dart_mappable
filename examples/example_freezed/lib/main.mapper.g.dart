import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import 'main.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <String, BaseMapper>{
  // primitive mappers
  _typeOf<dynamic>():  PrimitiveMapper((dynamic v) => v),
  _typeOf<String>():   PrimitiveMapper<String>((dynamic v) => v.toString()),
  _typeOf<int>():      PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  _typeOf<double>():   PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  _typeOf<num>():      PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  _typeOf<bool>():     PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  _typeOf<DateTime>(): DateTimeMapper(),
  _typeOf<List>():     IterableMapper<List>(<T>(Iterable<T> i) => i.toList(), <T>(f) => f<List<T>>()),
  _typeOf<Set>():      IterableMapper<Set>(<T>(Iterable<T> i) => i.toSet(), <T>(f) => f<Set<T>>()),
  _typeOf<Map>():      MapMapper<Map>(<K, V>(Map<K, V> map) => map, <K, V>(f) => f<Map<K, V>>()),
  // class mappers
  _typeOf<Union>(): UnionMapper._(),
  _typeOf<Data>(): DataMapper._(),
  _typeOf<Loading>(): LoadingMapper._(),
  _typeOf<ErrorDetails>(): ErrorDetailsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class UnionMapper extends BaseMapper<Union> {
  UnionMapper._();

  @override Function get decoder => decode;
  Union decode(dynamic v) => _checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'data': return DataMapper._().decode(map);
      case 'error': return ErrorDetailsMapper._().decode(map);
      case 'loading': return LoadingMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  Union fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class Union, did you forgot to specify a subclass for [ type: '${map['type']}' ] or a default subclass?");

  @override Function get encoder => (Union v) => encode(v);
  dynamic encode(Union v) {
    if (v is Data) { return DataMapper._().encode(v); }
    else if (v is Loading) { return LoadingMapper._().encode(v); }
    else if (v is ErrorDetails) { return ErrorDetailsMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(Union u) => {};

  @override String? stringify(Union self) => 'Union()';
  @override int? hash(Union self) => self.hashCode;
  @override bool? equals(Union self, Union other) => true;

  @override Function get typeFactory => (f) => f<Union>();
}

extension UnionMapperExtension on Union {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class DataMapper extends BaseMapper<Data> {
  DataMapper._();

  @override Function get decoder => decode;
  Data decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Data fromMap(Map<String, dynamic> map) => Data(map.get('mykey'));

  @override Function get encoder => (Data v) => encode(v);
  dynamic encode(Data v) => toMap(v);
  Map<String, dynamic> toMap(Data d) => {'mykey': Mapper.toValue(d.value), 'type': 'data'};

  @override String? stringify(Data self) => 'Data()';
  @override int? hash(Data self) => Mapper.hash(self.value);
  @override bool? equals(Data self, Data other) => Mapper.isEqual(self.value, other.value);

  @override Function get typeFactory => (f) => f<Data>();
}

extension DataMapperExtension on Data {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DataCopyWith<Data> get copyWith => DataCopyWith(this, _$identity);
}

abstract class DataCopyWith<$R> {
  factory DataCopyWith(Data value, Then<Data, $R> then) = _DataCopyWithImpl<$R>;
  $R call({int? value});
}

class _DataCopyWithImpl<$R> extends BaseCopyWith<Data, $R> implements DataCopyWith<$R> {
  _DataCopyWithImpl(Data value, Then<Data, $R> then) : super(value, then);

  $R call({int? value}) => _then(Data(value ?? _value.value));
}

class LoadingMapper extends BaseMapper<Loading> {
  LoadingMapper._();

  @override Function get decoder => decode;
  Loading decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Loading fromMap(Map<String, dynamic> map) => Loading();

  @override Function get encoder => (Loading v) => encode(v);
  dynamic encode(Loading v) => toMap(v);
  Map<String, dynamic> toMap(Loading l) => {'type': 'loading'};

  @override String? stringify(Loading self) => 'Loading()';
  @override int? hash(Loading self) => self.hashCode;
  @override bool? equals(Loading self, Loading other) => true;

  @override Function get typeFactory => (f) => f<Loading>();
}

extension LoadingMapperExtension on Loading {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  LoadingCopyWith<Loading> get copyWith => LoadingCopyWith(this, _$identity);
}

abstract class LoadingCopyWith<$R> {
  factory LoadingCopyWith(Loading value, Then<Loading, $R> then) = _LoadingCopyWithImpl<$R>;
  $R call();
}

class _LoadingCopyWithImpl<$R> extends BaseCopyWith<Loading, $R> implements LoadingCopyWith<$R> {
  _LoadingCopyWithImpl(Loading value, Then<Loading, $R> then) : super(value, then);

  $R call() => _then(Loading());
}

class ErrorDetailsMapper extends BaseMapper<ErrorDetails> {
  ErrorDetailsMapper._();

  @override Function get decoder => decode;
  ErrorDetails decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  ErrorDetails fromMap(Map<String, dynamic> map) => ErrorDetails(map.getOpt('message'));

  @override Function get encoder => (ErrorDetails v) => encode(v);
  dynamic encode(ErrorDetails v) => toMap(v);
  Map<String, dynamic> toMap(ErrorDetails e) => {'message': Mapper.toValue(e.message), 'type': 'error'};

  @override String? stringify(ErrorDetails self) => 'ErrorDetails()';
  @override int? hash(ErrorDetails self) => Mapper.hash(self.message);
  @override bool? equals(ErrorDetails self, ErrorDetails other) => Mapper.isEqual(self.message, other.message);

  @override Function get typeFactory => (f) => f<ErrorDetails>();
}

extension ErrorDetailsMapperExtension on ErrorDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ErrorDetailsCopyWith<ErrorDetails> get copyWith => ErrorDetailsCopyWith(this, _$identity);
}

abstract class ErrorDetailsCopyWith<$R> {
  factory ErrorDetailsCopyWith(ErrorDetails value, Then<ErrorDetails, $R> then) = _ErrorDetailsCopyWithImpl<$R>;
  $R call({String? message});
}

class _ErrorDetailsCopyWithImpl<$R> extends BaseCopyWith<ErrorDetails, $R> implements ErrorDetailsCopyWith<$R> {
  _ErrorDetailsCopyWithImpl(ErrorDetails value, Then<ErrorDetails, $R> then) : super(value, then);

  $R call({Object? message = _none}) => _then(ErrorDetails(or(message, _value.message)));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper<T> {
  Mapper._();

  static T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      TypeInfo typeInfo;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        typeInfo = TypeInfo.fromType(value['__type'] as String);
      } else {
        typeInfo = TypeInfo.fromType<T>();
      }
      var mapper = _mappers[typeInfo.type];
      if (mapper?.decoder != null) {
        try {
          return genericCall(typeInfo, mapper!.decoder!, value) as T;
        } catch (e) {
          throw MapperException('Error on decoding type $T: ${e is MapperException ? e.message : e}');
        }
      } else {
        throw MapperException('Cannot decode value $value of type ${value.runtimeType} to type $T. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  static dynamic toValue(dynamic value) {
    if (value == null) return null;
    var typeInfo = TypeInfo.fromValue(value);
    var mapper = _mappers[typeInfo.type] ?? _mappers.values
      .cast<BaseMapper?>()
      .firstWhere((m) => m!.isFor(value), orElse: () => null);
    if (mapper != null && mapper.encoder != null) {
      var encoded = mapper.encoder!.call(value);
      if (encoded is Map<String, dynamic>) {
        _clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          typeInfo.type = _typeOf(mapper.type);
          encoded['__type'] = typeInfo.toString();
        }
      }
      return encoded;
    } else {
      throw MapperException('Cannot encode value $value of type ${value.runtimeType}. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  static Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
    }
  }
  
  static T fromIterable<T>(Iterable<dynamic> iterable) => fromValue<T>(iterable);

  static Iterable<dynamic> toIterable(dynamic object) {
    var value = toValue(object);
    if (value is Iterable<dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Iterable. Instead encoded to type ${value.runtimeType}.');
    }
  }

  static T fromJson<T>(String json) {
    return fromValue<T>(jsonDecode(json));
  }
  
  static String toJson(dynamic object) {
    return jsonEncode(toValue(object));
  }

  static bool isEqual(dynamic value, Object? other) {
    if (value == null || other == null) {
      return value == other;
    }
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.equals(value, other) ?? value == other;
  }
  
  static int hash(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.hash(value) ?? value.hashCode;
  }

  static String asString(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.stringify(value) ?? value.toString();
  }

  static void use<T>(BaseMapper<T> mapper) => _mappers[_typeOf<T>()] = mapper;
  static BaseMapper<T>? unuse<T>() => _mappers.remove(_typeOf<T>()) as BaseMapper<T>?;
}

String _typeOf<T>([Type? t]) {
  var input = (t ?? T).toString();
  return input.split('<')[0];
}

void _clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(_clearType);
  map.values.whereType<List>().forEach((l) => l.whereType<Map<String, dynamic>>().forEach(_clearType));
}

mixin Mappable {
  BaseMapper? get _mapper => _mappers[_typeOf(runtimeType)];

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && (_mapper?.equals(this, other) ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

T _checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException('Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

class DateTimeMapper extends SimpleMapper<DateTime> {

  @override
  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException('Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }
  
  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

class MapperEquality implements Equality {
  @override bool equals(dynamic e1, dynamic e2) => Mapper.isEqual(e1, e2);
  @override int hash(dynamic e) => Mapper.hash(e);
  @override bool isValidKey(Object? o) => true;
}

class IterableMapper<I extends Iterable> extends BaseMapper<I> with MapperEqualityMixin<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  IterableMapper(this.fromIterable, this.typeFactory);

  @override Function get decoder => <T>(dynamic l) => _checked(l, (Iterable l) => fromIterable(l.map((v) => Mapper.fromValue<T>(v))));
  @override Function get encoder => (I self) => self.map((v) => Mapper.toValue(v)).toList();
  @override Function typeFactory;
  
  @override Equality equality = IterableEquality(MapperEquality());
}

class MapMapper<M extends Map> extends BaseMapper<M> with MapperEqualityMixin<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  MapMapper(this.fromMap, this.typeFactory);

  @override Function get decoder => <K, V>(dynamic m) => _checked(m,(Map m) => fromMap(m.map((key, value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)))));
  @override Function get encoder => (M self) => self.map((key, value) => MapEntry(Mapper.toValue(key), Mapper.toValue(value)));
  @override Function typeFactory;
  
  @override Equality equality = MapEquality(keys: MapperEquality(), values: MapperEquality());
}

class PrimitiveMapper<T> extends BaseMapper<T> {
  const PrimitiveMapper(this.decoder);
  
  @override final T Function(dynamic value) decoder;
  @override Function get encoder => (T value) => value;
  @override Function get typeFactory => (f) => f<T>();
  
  @override bool isFor(dynamic v) => v.runtimeType == T;
}

class EnumMapper<T> extends SimpleMapper<T> {
  EnumMapper(this._decoder, this._encoder);
  
  final T Function(String value) _decoder;
  final String Function(T value) _encoder;
  
  @override T decode(dynamic v) => _checked(v, _decoder);
  @override dynamic encode(T value) => _encoder(value);
}

dynamic genericCall(TypeInfo info, Function fn, dynamic value) {
  var params = [...info.params];

  dynamic call(dynamic Function<T>() next) {
    var t = params.removeAt(0);
    if (_mappers[t.type] != null) {
      return genericCall(t, _mappers[t.type]!.typeFactory ?? (f) => f(), next);
    } else {
      throw MapperException('Cannot find generic wrapper for type $t.');
    }
  }

  if (params.isEmpty) {
    return fn(value);
  } else if (params.length == 1) {
    return call(<A>() => fn<A>(value));
  } else if (params.length == 2) {
    return call(<A>() => call(<B>() => fn<A, B>(value)));
  } else if (params.length == 3) {
    return call(<A>() => call(<B>() => call(<C>() => fn<A, B, C>(value))));
  } else {
    throw MapperException('Cannot construct generic wrapper for type $info. Mapper only supports generic classes with up to 3 type arguments.');
  }
}

T _hookedDecode<T>(MappingHooks hooks, dynamic value, T Function(dynamic value) fn) {
  var v = hooks.beforeDecode(value);
  if (v is! T) v = fn(v);
  return hooks.afterDecode(v) as T;
}
dynamic _hookedEncode<T>(MappingHooks hooks, T value, dynamic Function(T value) fn) {
  var v = hooks.beforeEncode(value);
  if (v is T) v = fn(v);
  return hooks.afterEncode(v);
}

dynamic _toValue(dynamic value, {MappingHooks? hooks}) {
  if (hooks == null) {
    return Mapper.toValue(value);
  } else {
    return hooks.afterEncode(Mapper.toValue(hooks.beforeEncode(value)));
  }
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.fromValue<T>(v);
  });

  T? getOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    }
    return Mapper.fromValue<T>(v);
  });

  List<T> getList<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  List<T>? getListOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  Map<K, V> getMap<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  Map<K, V>? getMapOpt<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  T hooked<T>(MappingHooks? hooks, String key, T Function(dynamic v) fn) {
    if (hooks == null) {
      return fn(this[key]);
    } else {
      return hooks.afterDecode(fn(hooks.beforeDecode(this[key]))) as T;
    }
  }
}

class _None { const _None(); }
const _none = _None();

T _$identity<T>(T value) => value;
typedef Then<$T, $R> = $R Function($T);

class BaseCopyWith<$T, $R> {
  BaseCopyWith(this._value, this._then);

  final $T _value;
  final Then<$T, $R> _then;
  
  T or<T>(Object? _v, T v) => _v == _none ? v : _v as T;
}

