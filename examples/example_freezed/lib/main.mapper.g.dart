import 'package:dart_mappable/internals.dart';

import 'main.dart';


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

class UnionMapper extends BaseMapper<Union> {
  UnionMapper._();

  @override Function get decoder => decode;
  Union decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
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

extension UnionMapperExtension  on Union {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class DataMapper extends BaseMapper<Data> {
  DataMapper._();

  @override Function get decoder => decode;
  Data decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Data fromMap(Map<String, dynamic> map) => Data(map.get('mykey'));

  @override Function get encoder => (Data v) => encode(v);
  dynamic encode(Data v) => toMap(v);
  Map<String, dynamic> toMap(Data d) => {'mykey': Mapper.toValue(d.value), 'type': 'data'};

  @override String? stringify(Data self) => 'Data()';
  @override int? hash(Data self) => Mapper.hash(self.value);
  @override bool? equals(Data self, Data other) => Mapper.isEqual(self.value, other.value);

  @override Function get typeFactory => (f) => f<Data>();
}

extension DataMapperExtension  on Data {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DataCopyWith<Data> get copyWith => DataCopyWith(this, $identity);
}

abstract class DataCopyWith<$R> {
  factory DataCopyWith(Data value, Then<Data, $R> then) = _DataCopyWithImpl<$R>;
  $R call({int? value});
  $R apply(Data Function(Data) transform);
}

class _DataCopyWithImpl<$R> extends BaseCopyWith<Data, $R> implements DataCopyWith<$R> {
  _DataCopyWithImpl(Data value, Then<Data, $R> then) : super(value, then);

  @override $R call({int? value}) => $then(Data(value ?? $value.value));
}

class LoadingMapper extends BaseMapper<Loading> {
  LoadingMapper._();

  @override Function get decoder => decode;
  Loading decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Loading fromMap(Map<String, dynamic> map) => Loading();

  @override Function get encoder => (Loading v) => encode(v);
  dynamic encode(Loading v) => toMap(v);
  Map<String, dynamic> toMap(Loading l) => {'type': 'loading'};

  @override String? stringify(Loading self) => 'Loading()';
  @override int? hash(Loading self) => self.hashCode;
  @override bool? equals(Loading self, Loading other) => true;

  @override Function get typeFactory => (f) => f<Loading>();
}

extension LoadingMapperExtension  on Loading {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  LoadingCopyWith<Loading> get copyWith => LoadingCopyWith(this, $identity);
}

abstract class LoadingCopyWith<$R> {
  factory LoadingCopyWith(Loading value, Then<Loading, $R> then) = _LoadingCopyWithImpl<$R>;
  $R call();
  $R apply(Loading Function(Loading) transform);
}

class _LoadingCopyWithImpl<$R> extends BaseCopyWith<Loading, $R> implements LoadingCopyWith<$R> {
  _LoadingCopyWithImpl(Loading value, Then<Loading, $R> then) : super(value, then);

  @override $R call() => $then(Loading());
}

class ErrorDetailsMapper extends BaseMapper<ErrorDetails> {
  ErrorDetailsMapper._();

  @override Function get decoder => decode;
  ErrorDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ErrorDetails fromMap(Map<String, dynamic> map) => ErrorDetails(map.getOpt('message'));

  @override Function get encoder => (ErrorDetails v) => encode(v);
  dynamic encode(ErrorDetails v) => toMap(v);
  Map<String, dynamic> toMap(ErrorDetails e) => {'message': Mapper.toValue(e.message), 'type': 'error'};

  @override String? stringify(ErrorDetails self) => 'ErrorDetails()';
  @override int? hash(ErrorDetails self) => Mapper.hash(self.message);
  @override bool? equals(ErrorDetails self, ErrorDetails other) => Mapper.isEqual(self.message, other.message);

  @override Function get typeFactory => (f) => f<ErrorDetails>();
}

extension ErrorDetailsMapperExtension  on ErrorDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ErrorDetailsCopyWith<ErrorDetails> get copyWith => ErrorDetailsCopyWith(this, $identity);
}

abstract class ErrorDetailsCopyWith<$R> {
  factory ErrorDetailsCopyWith(ErrorDetails value, Then<ErrorDetails, $R> then) = _ErrorDetailsCopyWithImpl<$R>;
  $R call({String? message});
  $R apply(ErrorDetails Function(ErrorDetails) transform);
}

class _ErrorDetailsCopyWithImpl<$R> extends BaseCopyWith<ErrorDetails, $R> implements ErrorDetailsCopyWith<$R> {
  _ErrorDetailsCopyWithImpl(ErrorDetails value, Then<ErrorDetails, $R> then) : super(value, then);

  @override $R call({Object? message = $none}) => $then(ErrorDetails(or(message, $value.message)));
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
