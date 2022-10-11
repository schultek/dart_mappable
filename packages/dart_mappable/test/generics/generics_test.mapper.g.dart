import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'generics_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  BoxMapper._(),
  ConfettiMapper._(),
  ContentMapper._(),
  DataMapper._(),
  SingleSettingMapper._(),
  SettingsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class BoxMapper extends BaseMapper<p0.Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  p0.Box<T> decode<T extends p0.Content>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.Box<T> fromMap<T extends p0.Content>(Map<String, dynamic> map) => p0.Box(Mapper.i.$get(map, 'size'), contents: Mapper.i.$get(map, 'contents'));

  @override Function get encoder => encode;
  dynamic encode<T extends p0.Content>(p0.Box<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T extends p0.Content>(p0.Box<T> b) => {'size': Mapper.i.$enc(b.size, 'size'), 'contents': Mapper.i.$enc(b.contents, 'contents'), ...Mapper.i.$type<p0.Box<T>>(b)};

  @override String stringify(p0.Box self) => 'Box(size: ${Mapper.asString(self.size)}, contents: ${Mapper.asString(self.contents)})';
  @override int hash(p0.Box self) => Mapper.hash(self.size) ^ Mapper.hash(self.contents);
  @override bool equals(p0.Box self, p0.Box other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.contents, other.contents);

  @override Function get typeFactory => <T extends p0.Content>(f) => f<p0.Box<T>>();
}

extension BoxMapperExtension<T extends p0.Content> on p0.Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BoxCopyWith<p0.Box<T>, T> get copyWith => BoxCopyWith(this, $identity);
}

abstract class BoxCopyWith<$R, T extends p0.Content> {
  factory BoxCopyWith(p0.Box<T> value, Then<p0.Box<T>, $R> then) = _BoxCopyWithImpl<$R, T>;
  $R call({int? size, List<T>? contents});
  $R apply(p0.Box<T> Function(p0.Box<T>) transform);
}

class _BoxCopyWithImpl<$R, T extends p0.Content> extends BaseCopyWith<p0.Box<T>, $R> implements BoxCopyWith<$R, T> {
  _BoxCopyWithImpl(p0.Box<T> value, Then<p0.Box<T>, $R> then) : super(value, then);

  @override $R call({int? size, List<T>? contents}) => $then(p0.Box(size ?? $value.size, contents: contents ?? $value.contents));
}

class ConfettiMapper extends BaseMapper<p0.Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  p0.Confetti decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Confetti fromMap(Map<String, dynamic> map) => p0.Confetti(Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p0.Confetti v) => toMap(v);
  Map<String, dynamic> toMap(p0.Confetti c) => {'color': Mapper.i.$enc(c.color, 'color')};

  @override String stringify(p0.Confetti self) => 'Confetti(color: ${Mapper.asString(self.color)})';
  @override int hash(p0.Confetti self) => Mapper.hash(self.color);
  @override bool equals(p0.Confetti self, p0.Confetti other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p0.Confetti>();
}

extension ConfettiMapperExtension on p0.Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ConfettiCopyWith<p0.Confetti> get copyWith => ConfettiCopyWith(this, $identity);
}

abstract class ConfettiCopyWith<$R> implements ContentCopyWith<$R> {
  factory ConfettiCopyWith(p0.Confetti value, Then<p0.Confetti, $R> then) = _ConfettiCopyWithImpl<$R>;
  @override $R call({String? color});
  $R apply(p0.Confetti Function(p0.Confetti) transform);
}

class _ConfettiCopyWithImpl<$R> extends BaseCopyWith<p0.Confetti, $R> implements ConfettiCopyWith<$R> {
  _ConfettiCopyWithImpl(p0.Confetti value, Then<p0.Confetti, $R> then) : super(value, then);

  @override $R call({String? color}) => $then(p0.Confetti(color ?? $value.color));
}

class ContentMapper extends BaseMapper<p0.Content> {
  ContentMapper._();

  @override Function get decoder => decode;
  p0.Content decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Content fromMap(Map<String, dynamic> map) => p0.Content();

  @override Function get encoder => encode;
  dynamic encode(p0.Content v) => toMap(v);
  Map<String, dynamic> toMap(p0.Content c) => {};

  @override String stringify(p0.Content self) => 'Content()';
  @override int hash(p0.Content self) => 0;
  @override bool equals(p0.Content self, p0.Content other) => true;

  @override Function get typeFactory => (f) => f<p0.Content>();
}

extension ContentMapperExtension on p0.Content {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ContentCopyWith<p0.Content> get copyWith => ContentCopyWith(this, $identity);
}

abstract class ContentCopyWith<$R> {
  factory ContentCopyWith(p0.Content value, Then<p0.Content, $R> then) {
    if (value is p0.Confetti) { return ConfettiCopyWith(value, then); }
    else { return _ContentCopyWithImpl<$R>(value, then); }
  }
  $R call();
}

class _ContentCopyWithImpl<$R> extends BaseCopyWith<p0.Content, $R> implements ContentCopyWith<$R> {
  _ContentCopyWithImpl(p0.Content value, Then<p0.Content, $R> then) : super(value, then);

  @override $R call() => $then(p0.Content());
}

class DataMapper extends BaseMapper<p0.Data> {
  DataMapper._();

  @override Function get decoder => decode;
  p0.Data decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Data fromMap(Map<String, dynamic> map) => p0.Data(Mapper.i.$get(map, 'data'));

  @override Function get encoder => encode;
  dynamic encode(p0.Data v) => toMap(v);
  Map<String, dynamic> toMap(p0.Data d) => {'data': Mapper.i.$enc(d.data, 'data')};

  @override String stringify(p0.Data self) => 'Data(data: ${Mapper.asString(self.data)})';
  @override int hash(p0.Data self) => Mapper.hash(self.data);
  @override bool equals(p0.Data self, p0.Data other) => Mapper.isEqual(self.data, other.data);

  @override Function get typeFactory => (f) => f<p0.Data>();
}

extension DataMapperExtension on p0.Data {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DataCopyWith<p0.Data> get copyWith => DataCopyWith(this, $identity);
}

abstract class DataCopyWith<$R> {
  factory DataCopyWith(p0.Data value, Then<p0.Data, $R> then) = _DataCopyWithImpl<$R>;
  $R call({String? data});
  $R apply(p0.Data Function(p0.Data) transform);
}

class _DataCopyWithImpl<$R> extends BaseCopyWith<p0.Data, $R> implements DataCopyWith<$R> {
  _DataCopyWithImpl(p0.Data value, Then<p0.Data, $R> then) : super(value, then);

  @override $R call({String? data}) => $then(p0.Data(data ?? $value.data));
}

class SingleSettingMapper extends BaseMapper<p0.SingleSetting> {
  SingleSettingMapper._();

  @override Function get decoder => decode;
  p0.SingleSetting<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.SingleSetting<T> fromMap<T>(Map<String, dynamic> map) => p0.SingleSetting(properties: Mapper.i.$getOpt(map, 'properties'));

  @override Function get encoder => encode;
  dynamic encode<T>(p0.SingleSetting<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(p0.SingleSetting<T> s) => {'properties': Mapper.i.$enc(s.properties, 'properties'), ...Mapper.i.$type<p0.SingleSetting<T>>(s)};

  @override String stringify(p0.SingleSetting self) => 'SingleSetting(properties: ${Mapper.asString(self.properties)})';
  @override int hash(p0.SingleSetting self) => Mapper.hash(self.properties);
  @override bool equals(p0.SingleSetting self, p0.SingleSetting other) => Mapper.isEqual(self.properties, other.properties);

  @override Function get typeFactory => <T>(f) => f<p0.SingleSetting<T>>();
}

extension SingleSettingMapperExtension<T> on p0.SingleSetting<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SingleSettingCopyWith<p0.SingleSetting<T>, T> get copyWith => SingleSettingCopyWith(this, $identity);
}

abstract class SingleSettingCopyWith<$R, T> {
  factory SingleSettingCopyWith(p0.SingleSetting<T> value, Then<p0.SingleSetting<T>, $R> then) = _SingleSettingCopyWithImpl<$R, T>;
  $R call({List<T>? properties});
  $R apply(p0.SingleSetting<T> Function(p0.SingleSetting<T>) transform);
}

class _SingleSettingCopyWithImpl<$R, T> extends BaseCopyWith<p0.SingleSetting<T>, $R> implements SingleSettingCopyWith<$R, T> {
  _SingleSettingCopyWithImpl(p0.SingleSetting<T> value, Then<p0.SingleSetting<T>, $R> then) : super(value, then);

  @override $R call({Object? properties = $none}) => $then(p0.SingleSetting(properties: or(properties, $value.properties)));
}

class SettingsMapper extends BaseMapper<p0.Settings> {
  SettingsMapper._();

  @override Function get decoder => decode;
  p0.Settings decode(dynamic v) => const p0.MapHooksAfter().decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  p0.Settings fromMap(Map<String, dynamic> map) => p0.Settings(settings: Mapper.i.$getOpt(map, 'settings'));

  @override Function get encoder => encode;
  dynamic encode(p0.Settings v) => const p0.MapHooksAfter().encode<p0.Settings>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(p0.Settings s) => {'settings': Mapper.i.$enc(s.settings, 'settings')};

  @override String stringify(p0.Settings self) => 'Settings(settings: ${Mapper.asString(self.settings)})';
  @override int hash(p0.Settings self) => Mapper.hash(self.settings);
  @override bool equals(p0.Settings self, p0.Settings other) => Mapper.isEqual(self.settings, other.settings);

  @override Function get typeFactory => (f) => f<p0.Settings>();
}

extension SettingsMapperExtension on p0.Settings {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SettingsCopyWith<p0.Settings> get copyWith => SettingsCopyWith(this, $identity);
}

abstract class SettingsCopyWith<$R> {
  factory SettingsCopyWith(p0.Settings value, Then<p0.Settings, $R> then) = _SettingsCopyWithImpl<$R>;
  MapCopyWith<$R, String, p0.SingleSetting<dynamic>, SingleSettingCopyWith<$R, dynamic>>? get settings;
  $R call({Map<String, p0.SingleSetting<dynamic>>? settings});
  $R apply(p0.Settings Function(p0.Settings) transform);
}

class _SettingsCopyWithImpl<$R> extends BaseCopyWith<p0.Settings, $R> implements SettingsCopyWith<$R> {
  _SettingsCopyWithImpl(p0.Settings value, Then<p0.Settings, $R> then) : super(value, then);

  @override MapCopyWith<$R, String, p0.SingleSetting<dynamic>, SingleSettingCopyWith<$R, dynamic>>? get settings => $value.settings != null ? MapCopyWith($value.settings!, (v, t) => SingleSettingCopyWith(v, t), (v) => call(settings: v)) : null;
  @override $R call({Object? settings = $none}) => $then(p0.Settings(settings: or(settings, $value.settings)));
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
