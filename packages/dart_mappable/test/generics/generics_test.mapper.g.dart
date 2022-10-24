// ignore_for_file: unused_element
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
  BoxCopyWith<p0.Box<T>, T> get copyWith => _BoxCopyWithImpl(this, $identity, $identity);
}

extension BoxObjectCopy<$R, T extends p0.Content> on ObjectCopyWith<$R, p0.Box<T>, p0.Box<T>> {
  BoxCopyWith<$R, T> get asBox => base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

abstract class BoxCopyWith<$R, T extends p0.Content> implements ObjectCopyWith<$R, p0.Box<T>, p0.Box<T>> {
  BoxCopyWith<$R2, T> _chain<$R2>(Then<p0.Box<T>, p0.Box<T>> t, Then<p0.Box<T>, $R2> t2);
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get contents;
  $R call({int? size, List<T>? contents});
}

class _BoxCopyWithImpl<$R, T extends p0.Content> extends BaseCopyWith<$R, p0.Box<T>, p0.Box<T>> implements BoxCopyWith<$R, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);
  @override BoxCopyWith<$R2, T> _chain<$R2>(Then<p0.Box<T>, p0.Box<T>> t, Then<p0.Box<T>, $R2> t2) => _BoxCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get contents => ListCopyWith($value.contents, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(contents: v));
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
}

mixin ConfettiMixin {
  ConfettiCopyWith<p0.Confetti, p0.Confetti> get copyWith => _ConfettiCopyWithImpl(this as p0.Confetti, $identity, $identity);
}

extension ConfettiObjectCopy<$R, $Out extends p0.Content> on ObjectCopyWith<$R, p0.Confetti, $Out> {
  ConfettiCopyWith<$R, $Out> get asConfetti => base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

abstract class ConfettiCopyWith<$R, $Out extends p0.Content> implements ContentCopyWith<$R, p0.Confetti, $Out> {
  @override $R call({String? color});
}

class _ConfettiCopyWithImpl<$R, $Out extends p0.Content> extends BaseCopyWith<$R, p0.Confetti, $Out> implements ConfettiCopyWith<$R, $Out> {
  _ConfettiCopyWithImpl(super.value, super.then, super.then2);
  @override ConfettiCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Content>(Then<p0.Confetti, $Out2> t, Then<$Out2, $R2> t2) => _ConfettiCopyWithImpl($value, t, t2);

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
}

mixin ContentMixin {
  ContentCopyWith<p0.Content, p0.Content, p0.Content> get copyWith => _ContentCopyWithImpl(this as p0.Content, $identity, $identity);
}

extension ContentObjectCopy<$R, $Out extends p0.Content> on ObjectCopyWith<$R, p0.Content, $Out> {
  ContentCopyWith<$R, p0.Content, $Out> get asContent => base.as((v, t, t2) => _ContentCopyWithImpl(v, t, t2));
}

abstract class ContentCopyWith<$R, $In extends p0.Content, $Out extends p0.Content> implements ObjectCopyWith<$R, $In, $Out> {
  ContentCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p0.Content>(Then<p0.Content, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ContentCopyWithImpl<$R, $Out extends p0.Content> extends BaseCopyWith<$R, p0.Content, $Out> implements ContentCopyWith<$R, p0.Content, $Out> {
  _ContentCopyWithImpl(super.value, super.then, super.then2);
  @override ContentCopyWith<$R2, p0.Content, $Out2> _chain<$R2, $Out2 extends p0.Content>(Then<p0.Content, $Out2> t, Then<$Out2, $R2> t2) => _ContentCopyWithImpl($value, t, t2);

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
  DataCopyWith<p0.Data> get copyWith => _DataCopyWithImpl(this, $identity, $identity);
}

extension DataObjectCopy<$R> on ObjectCopyWith<$R, p0.Data, p0.Data> {
  DataCopyWith<$R> get asData => base.as((v, t, t2) => _DataCopyWithImpl(v, t, t2));
}

abstract class DataCopyWith<$R> implements ObjectCopyWith<$R, p0.Data, p0.Data> {
  DataCopyWith<$R2> _chain<$R2>(Then<p0.Data, p0.Data> t, Then<p0.Data, $R2> t2);
  $R call({String? data});
}

class _DataCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Data, p0.Data> implements DataCopyWith<$R> {
  _DataCopyWithImpl(super.value, super.then, super.then2);
  @override DataCopyWith<$R2> _chain<$R2>(Then<p0.Data, p0.Data> t, Then<p0.Data, $R2> t2) => _DataCopyWithImpl($value, t, t2);

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
  SingleSettingCopyWith<p0.SingleSetting<T>, T> get copyWith => _SingleSettingCopyWithImpl(this, $identity, $identity);
}

extension SingleSettingObjectCopy<$R, T> on ObjectCopyWith<$R, p0.SingleSetting<T>, p0.SingleSetting<T>> {
  SingleSettingCopyWith<$R, T> get asSingleSetting => base.as((v, t, t2) => _SingleSettingCopyWithImpl(v, t, t2));
}

abstract class SingleSettingCopyWith<$R, T> implements ObjectCopyWith<$R, p0.SingleSetting<T>, p0.SingleSetting<T>> {
  SingleSettingCopyWith<$R2, T> _chain<$R2>(Then<p0.SingleSetting<T>, p0.SingleSetting<T>> t, Then<p0.SingleSetting<T>, $R2> t2);
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties;
  $R call({List<T>? properties});
}

class _SingleSettingCopyWithImpl<$R, T> extends BaseCopyWith<$R, p0.SingleSetting<T>, p0.SingleSetting<T>> implements SingleSettingCopyWith<$R, T> {
  _SingleSettingCopyWithImpl(super.value, super.then, super.then2);
  @override SingleSettingCopyWith<$R2, T> _chain<$R2>(Then<p0.SingleSetting<T>, p0.SingleSetting<T>> t, Then<p0.SingleSetting<T>, $R2> t2) => _SingleSettingCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties => $value.properties != null ? ListCopyWith($value.properties!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(properties: v)) : null;
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
  SettingsCopyWith<p0.Settings> get copyWith => _SettingsCopyWithImpl(this, $identity, $identity);
}

extension SettingsObjectCopy<$R> on ObjectCopyWith<$R, p0.Settings, p0.Settings> {
  SettingsCopyWith<$R> get asSettings => base.as((v, t, t2) => _SettingsCopyWithImpl(v, t, t2));
}

abstract class SettingsCopyWith<$R> implements ObjectCopyWith<$R, p0.Settings, p0.Settings> {
  SettingsCopyWith<$R2> _chain<$R2>(Then<p0.Settings, p0.Settings> t, Then<p0.Settings, $R2> t2);
  MapCopyWith<$R, String, p0.SingleSetting<dynamic>, SingleSettingCopyWith<$R, dynamic>>? get settings;
  $R call({Map<String, p0.SingleSetting<dynamic>>? settings});
}

class _SettingsCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Settings, p0.Settings> implements SettingsCopyWith<$R> {
  _SettingsCopyWithImpl(super.value, super.then, super.then2);
  @override SettingsCopyWith<$R2> _chain<$R2>(Then<p0.Settings, p0.Settings> t, Then<p0.Settings, $R2> t2) => _SettingsCopyWithImpl($value, t, t2);

  @override MapCopyWith<$R, String, p0.SingleSetting<dynamic>, SingleSettingCopyWith<$R, dynamic>>? get settings => $value.settings != null ? MapCopyWith($value.settings!, (v, t) => v.copyWith._chain($identity, t), (v) => call(settings: v)) : null;
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

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
