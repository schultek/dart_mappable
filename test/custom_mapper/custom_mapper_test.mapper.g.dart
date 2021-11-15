import 'package:dart_mappable/dart_mappable.dart';

import 'custom_mapper_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  GenericBoxMapper._(),
  // enum mappers
  // custom mappers
  PrivateClassMapper(),
  CustomGenericMapper(),
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class GenericBoxMapper extends BaseMapper<GenericBox> {
  GenericBoxMapper._();

  @override Function get decoder => decode;
  GenericBox<T> decode<T>(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  GenericBox<T> fromMap<T>(Map<String, dynamic> map) => GenericBox(map.get('content'));

  @override Function get encoder => (GenericBox v) => encode(v);
  dynamic encode(GenericBox v) => toMap(v);
  Map<String, dynamic> toMap(GenericBox g) => {'content': Mapper.toValue(g.content)};

  @override String? stringify(GenericBox self) => 'GenericBox(content: ${Mapper.asString(self.content)})';
  @override int? hash(GenericBox self) => Mapper.hash(self.content);
  @override bool? equals(GenericBox self, GenericBox other) => Mapper.isEqual(self.content, other.content);

  @override Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

extension GenericBoxMapperExtension<T> on GenericBox<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GenericBoxCopyWith<GenericBox<T>, T> get copyWith => GenericBoxCopyWith(this, _$identity);
}

abstract class GenericBoxCopyWith<$R, T> {
  factory GenericBoxCopyWith(GenericBox<T> value, Then<GenericBox<T>, $R> then) = _GenericBoxCopyWithImpl<$R, T>;
  $R call({T? content});
}

class _GenericBoxCopyWithImpl<$R, T> extends BaseCopyWith<GenericBox<T>, $R> implements GenericBoxCopyWith<$R, T> {
  _GenericBoxCopyWithImpl(GenericBox<T> value, Then<GenericBox<T>, $R> then) : super(value, then);

  @override $R call({T? content}) => _then(GenericBox(content ?? _value.content));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===


class _Mapper extends MapperContainer {
  _Mapper._() : super(_mappers);
}

class Mapper {
  Mapper._();

  static late _Mapper i = _Mapper._();

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

const _checked = MapperContainer.checked;

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => _getOr(
      key, hooks, () => throw MapperException('Parameter $key is required.'));

  T? getOpt<T>(String key, {MappingHooks? hooks}) =>
      _getOr(key, hooks, () => null);

  T _getOr<T>(String key, MappingHooks? hooks, T Function() or) =>
      hooks.decode(this[key], (v) => v == null ? or() : Mapper.fromValue<T>(v));
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

