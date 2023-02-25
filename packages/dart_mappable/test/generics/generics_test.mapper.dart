// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generics_test.dart';

class BoxMapper extends ClassMapperBase<Box> {
  BoxMapper._();
  static BoxMapper? _instance;
  static BoxMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxMapper._());
      ContentMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Box';
  @override
  Function get typeFactory => <T extends Content>(f) => f<Box<T>>();

  static int _$size(Box v) => v.size;
  static List<Content> _$contents(Box v) => v.contents;
  static dynamic _arg$contents<T extends Content>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<Box, dynamic>> fields = const {
    #size: Field<Box, int>('size', _$size),
    #contents:
        Field<Box, List<Content>>('contents', _$contents, arg: _arg$contents),
  };

  static Box<T> _instantiate<T extends Content>(DecodingData data) {
    return Box(data.get(#size), contents: data.get(#contents));
  }

  @override
  final Function instantiate = _instantiate;

  static Box<T> fromMap<T extends Content>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Box<T>>(map));
  }

  static Box<T> fromJson<T extends Content>(String json) {
    return _guard((c) => c.fromJson<Box<T>>(json));
  }
}

mixin BoxMappable<T extends Content> {
  String toJson() {
    return BoxMapper._guard((c) => c.toJson(this as Box<T>));
  }

  Map<String, dynamic> toMap() {
    return BoxMapper._guard((c) => c.toMap(this as Box<T>));
  }

  BoxCopyWith<Box<T>, Box<T>, Box<T>, T> get copyWith =>
      _BoxCopyWithImpl(this as Box<T>, $identity, $identity);
  @override
  String toString() {
    return BoxMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BoxMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BoxMapper._guard((c) => c.hash(this));
  }
}

extension BoxValueCopy<$R, $Out extends Box, T extends Content>
    on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

typedef BoxCopyWithBound = Box;

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out extends Box,
    T extends Content> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents;
  $R call({int? size, List<T>? contents});
  BoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2 extends Box>(
      Then<Box<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _BoxCopyWithImpl<$R, $Out extends Box, T extends Content>
    extends ClassCopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents => ListCopyWith(
      $value.contents,
      (v, t) => $cast(v.copyWith.$chain<$R, T>($cast, t)),
      (v) => call(contents: v));
  @override
  $R call({int? size, List<T>? contents}) => $apply(FieldCopyWithData({
        if (size != null) #size: size,
        if (contents != null) #contents: contents
      }));
  @override
  Box<T> $make(CopyWithData data) => Box(data.get(#size, or: $value.size),
      contents: data.get(#contents, or: $value.contents));

  @override
  BoxCopyWith<$R2, Box<T>, $Out2, T> $chain<$R2, $Out2 extends Box>(
          Then<Box<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BoxCopyWithImpl($value, t, t2);
}

class ConfettiMapper extends ClassMapperBase<Confetti> {
  ConfettiMapper._();
  static ConfettiMapper? _instance;
  static ConfettiMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfettiMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Confetti';

  static String _$color(Confetti v) => v.color;

  @override
  final Map<Symbol, Field<Confetti, dynamic>> fields = const {
    #color: Field<Confetti, String>('color', _$color),
  };

  static Confetti _instantiate(DecodingData data) {
    return Confetti(data.get(#color));
  }

  @override
  final Function instantiate = _instantiate;

  static Confetti fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Confetti>(map));
  }

  static Confetti fromJson(String json) {
    return _guard((c) => c.fromJson<Confetti>(json));
  }
}

mixin ConfettiMappable {
  String toJson() {
    return ConfettiMapper._guard((c) => c.toJson(this as Confetti));
  }

  Map<String, dynamic> toMap() {
    return ConfettiMapper._guard((c) => c.toMap(this as Confetti));
  }

  ConfettiCopyWith<Confetti, Confetti, Confetti> get copyWith =>
      _ConfettiCopyWithImpl(this as Confetti, $identity, $identity);
  @override
  String toString() {
    return ConfettiMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfettiMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ConfettiMapper._guard((c) => c.hash(this));
  }
}

extension ConfettiValueCopy<$R, $Out extends Content>
    on ObjectCopyWith<$R, Confetti, $Out> {
  ConfettiCopyWith<$R, Confetti, $Out> get $asConfetti =>
      $base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

typedef ConfettiCopyWithBound = Content;

abstract class ConfettiCopyWith<$R, $In extends Confetti, $Out extends Content>
    implements ContentCopyWith<$R, $In, $Out> {
  @override
  $R call({String? color});
  ConfettiCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Content>(
      Then<Confetti, $Out2> t, Then<$Out2, $R2> t2);
}

class _ConfettiCopyWithImpl<$R, $Out extends Content>
    extends ClassCopyWithBase<$R, Confetti, $Out>
    implements ConfettiCopyWith<$R, Confetti, $Out> {
  _ConfettiCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Confetti> $mapper =
      ConfettiMapper.ensureInitialized();
  @override
  $R call({String? color}) =>
      $apply(FieldCopyWithData({if (color != null) #color: color}));
  @override
  Confetti $make(CopyWithData data) =>
      Confetti(data.get(#color, or: $value.color));

  @override
  ConfettiCopyWith<$R2, Confetti, $Out2> $chain<$R2, $Out2 extends Content>(
          Then<Confetti, $Out2> t, Then<$Out2, $R2> t2) =>
      _ConfettiCopyWithImpl($value, t, t2);
}

class ContentMapper extends ClassMapperBase<Content> {
  ContentMapper._();
  static ContentMapper? _instance;
  static ContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentMapper._());
      ConfettiMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Content';

  @override
  final Map<Symbol, Field<Content, dynamic>> fields = const {};

  static Content _instantiate(DecodingData data) {
    return Content();
  }

  @override
  final Function instantiate = _instantiate;

  static Content fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Content>(map));
  }

  static Content fromJson(String json) {
    return _guard((c) => c.fromJson<Content>(json));
  }
}

mixin ContentMappable {
  String toJson() {
    return ContentMapper._guard((c) => c.toJson(this as Content));
  }

  Map<String, dynamic> toMap() {
    return ContentMapper._guard((c) => c.toMap(this as Content));
  }

  ContentCopyWith<Content, Content, Content> get copyWith =>
      _ContentCopyWithImpl(this as Content, $identity, $identity);
  @override
  String toString() {
    return ContentMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContentMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ContentMapper._guard((c) => c.hash(this));
  }
}

extension ContentValueCopy<$R, $Out extends Content>
    on ObjectCopyWith<$R, Content, $Out> {
  ContentCopyWith<$R, Content, $Out> get $asContent =>
      $base.as((v, t, t2) => _ContentCopyWithImpl(v, t, t2));
}

typedef ContentCopyWithBound = Content;

abstract class ContentCopyWith<$R, $In extends Content, $Out extends Content>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Content>(
      Then<Content, $Out2> t, Then<$Out2, $R2> t2);
}

class _ContentCopyWithImpl<$R, $Out extends Content>
    extends ClassCopyWithBase<$R, Content, $Out>
    implements ContentCopyWith<$R, Content, $Out> {
  _ContentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Content> $mapper =
      ContentMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  Content $make(CopyWithData data) => Content();

  @override
  ContentCopyWith<$R2, Content, $Out2> $chain<$R2, $Out2 extends Content>(
          Then<Content, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentCopyWithImpl($value, t, t2);
}

class DataMapper extends ClassMapperBase<Data> {
  DataMapper._();
  static DataMapper? _instance;
  static DataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Data';

  static String _$data(Data v) => v.data;

  @override
  final Map<Symbol, Field<Data, dynamic>> fields = const {
    #data: Field<Data, String>('data', _$data),
  };

  static Data _instantiate(DecodingData data) {
    return Data(data.get(#data));
  }

  @override
  final Function instantiate = _instantiate;

  static Data fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Data>(map));
  }

  static Data fromJson(String json) {
    return _guard((c) => c.fromJson<Data>(json));
  }
}

mixin DataMappable {
  String toJson() {
    return DataMapper._guard((c) => c.toJson(this as Data));
  }

  Map<String, dynamic> toMap() {
    return DataMapper._guard((c) => c.toMap(this as Data));
  }

  DataCopyWith<Data, Data, Data> get copyWith =>
      _DataCopyWithImpl(this as Data, $identity, $identity);
  @override
  String toString() {
    return DataMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DataMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DataMapper._guard((c) => c.hash(this));
  }
}

extension DataValueCopy<$R, $Out extends Data>
    on ObjectCopyWith<$R, Data, $Out> {
  DataCopyWith<$R, Data, $Out> get $asData =>
      $base.as((v, t, t2) => _DataCopyWithImpl(v, t, t2));
}

typedef DataCopyWithBound = Data;

abstract class DataCopyWith<$R, $In extends Data, $Out extends Data>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  DataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Data>(
      Then<Data, $Out2> t, Then<$Out2, $R2> t2);
}

class _DataCopyWithImpl<$R, $Out extends Data>
    extends ClassCopyWithBase<$R, Data, $Out>
    implements DataCopyWith<$R, Data, $Out> {
  _DataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Data> $mapper = DataMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Data $make(CopyWithData data) => Data(data.get(#data, or: $value.data));

  @override
  DataCopyWith<$R2, Data, $Out2> $chain<$R2, $Out2 extends Data>(
          Then<Data, $Out2> t, Then<$Out2, $R2> t2) =>
      _DataCopyWithImpl($value, t, t2);
}

class SingleSettingMapper extends ClassMapperBase<SingleSetting> {
  SingleSettingMapper._();
  static SingleSettingMapper? _instance;
  static SingleSettingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SingleSettingMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SingleSetting';
  @override
  Function get typeFactory => <T>(f) => f<SingleSetting<T>>();

  static List<dynamic>? _$properties(SingleSetting v) => v.properties;
  static dynamic _arg$properties<T>(f) => f<List<T>?>();

  @override
  final Map<Symbol, Field<SingleSetting, dynamic>> fields = const {
    #properties: Field<SingleSetting, List<dynamic>?>(
        'properties', _$properties,
        opt: true, arg: _arg$properties),
  };

  static SingleSetting<T> _instantiate<T>(DecodingData data) {
    return SingleSetting(properties: data.get(#properties));
  }

  @override
  final Function instantiate = _instantiate;

  static SingleSetting<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SingleSetting<T>>(map));
  }

  static SingleSetting<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<SingleSetting<T>>(json));
  }
}

mixin SingleSettingMappable<T> {
  String toJson() {
    return SingleSettingMapper._guard(
        (c) => c.toJson(this as SingleSetting<T>));
  }

  Map<String, dynamic> toMap() {
    return SingleSettingMapper._guard((c) => c.toMap(this as SingleSetting<T>));
  }

  SingleSettingCopyWith<SingleSetting<T>, SingleSetting<T>, SingleSetting<T>, T>
      get copyWith => _SingleSettingCopyWithImpl(
          this as SingleSetting<T>, $identity, $identity);
  @override
  String toString() {
    return SingleSettingMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SingleSettingMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SingleSettingMapper._guard((c) => c.hash(this));
  }
}

extension SingleSettingValueCopy<$R, $Out extends SingleSetting, T>
    on ObjectCopyWith<$R, SingleSetting<T>, $Out> {
  SingleSettingCopyWith<$R, SingleSetting<T>, $Out, T> get $asSingleSetting =>
      $base.as((v, t, t2) => _SingleSettingCopyWithImpl(v, t, t2));
}

typedef SingleSettingCopyWithBound = SingleSetting;

abstract class SingleSettingCopyWith<$R, $In extends SingleSetting<T>,
    $Out extends SingleSetting, T> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties;
  $R call({List<T>? properties});
  SingleSettingCopyWith<$R2, $In, $Out2, T>
      $chain<$R2, $Out2 extends SingleSetting>(
          Then<SingleSetting<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _SingleSettingCopyWithImpl<$R, $Out extends SingleSetting, T>
    extends ClassCopyWithBase<$R, SingleSetting<T>, $Out>
    implements SingleSettingCopyWith<$R, SingleSetting<T>, $Out, T> {
  _SingleSettingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SingleSetting> $mapper =
      SingleSettingMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties =>
      $value.properties != null
          ? ListCopyWith(
              $value.properties!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(properties: v))
          : null;
  @override
  $R call({Object? properties = $none}) => $apply(
      FieldCopyWithData({if (properties != $none) #properties: properties}));
  @override
  SingleSetting<T> $make(CopyWithData data) =>
      SingleSetting(properties: data.get(#properties, or: $value.properties));

  @override
  SingleSettingCopyWith<$R2, SingleSetting<T>, $Out2, T>
      $chain<$R2, $Out2 extends SingleSetting>(
              Then<SingleSetting<T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _SingleSettingCopyWithImpl($value, t, t2);
}

class SettingsMapper extends ClassMapperBase<Settings> {
  SettingsMapper._();
  static SettingsMapper? _instance;
  static SettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsMapper._());
      SingleSettingMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Settings';

  static Map<String, SingleSetting<dynamic>>? _$settings(Settings v) =>
      v.settings;

  @override
  final Map<Symbol, Field<Settings, dynamic>> fields = const {
    #settings: Field<Settings, Map<String, SingleSetting<dynamic>>?>(
        'settings', _$settings,
        opt: true),
  };

  @override
  final MappingHook hook = const MapHooksAfter();
  static Settings _instantiate(DecodingData data) {
    return Settings(settings: data.get(#settings));
  }

  @override
  final Function instantiate = _instantiate;

  static Settings fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Settings>(map));
  }

  static Settings fromJson(String json) {
    return _guard((c) => c.fromJson<Settings>(json));
  }
}

mixin SettingsMappable {
  String toJson() {
    return SettingsMapper._guard((c) => c.toJson(this as Settings));
  }

  Map<String, dynamic> toMap() {
    return SettingsMapper._guard((c) => c.toMap(this as Settings));
  }

  SettingsCopyWith<Settings, Settings, Settings> get copyWith =>
      _SettingsCopyWithImpl(this as Settings, $identity, $identity);
  @override
  String toString() {
    return SettingsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SettingsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SettingsMapper._guard((c) => c.hash(this));
  }
}

extension SettingsValueCopy<$R, $Out extends Settings>
    on ObjectCopyWith<$R, Settings, $Out> {
  SettingsCopyWith<$R, Settings, $Out> get $asSettings =>
      $base.as((v, t, t2) => _SettingsCopyWithImpl(v, t, t2));
}

typedef SettingsCopyWithBound = Settings;

abstract class SettingsCopyWith<$R, $In extends Settings, $Out extends Settings>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
      $R,
      String,
      SingleSetting<dynamic>,
      SingleSettingCopyWith<$R, SingleSetting<dynamic>, SingleSetting<dynamic>,
          dynamic>>? get settings;
  $R call({Map<String, SingleSetting<dynamic>>? settings});
  SettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Settings>(
      Then<Settings, $Out2> t, Then<$Out2, $R2> t2);
}

class _SettingsCopyWithImpl<$R, $Out extends Settings>
    extends ClassCopyWithBase<$R, Settings, $Out>
    implements SettingsCopyWith<$R, Settings, $Out> {
  _SettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Settings> $mapper =
      SettingsMapper.ensureInitialized();
  @override
  MapCopyWith<
      $R,
      String,
      SingleSetting<dynamic>,
      SingleSettingCopyWith<$R, SingleSetting<dynamic>, SingleSetting<dynamic>,
          dynamic>>? get settings => $value.settings != null
      ? MapCopyWith(
          $value.settings!,
          (v, t) => v.copyWith.$chain<$R, SingleSetting<dynamic>>($identity, t),
          (v) => call(settings: v))
      : null;
  @override
  $R call({Object? settings = $none}) =>
      $apply(FieldCopyWithData({if (settings != $none) #settings: settings}));
  @override
  Settings $make(CopyWithData data) =>
      Settings(settings: data.get(#settings, or: $value.settings));

  @override
  SettingsCopyWith<$R2, Settings, $Out2> $chain<$R2, $Out2 extends Settings>(
          Then<Settings, $Out2> t, Then<$Out2, $R2> t2) =>
      _SettingsCopyWithImpl($value, t, t2);
}

class AssetMapper extends ClassMapperBase<Asset> {
  AssetMapper._();
  static AssetMapper? _instance;
  static AssetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssetMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Asset';
  @override
  Function get typeFactory => <T>(f) => f<Asset<T>>();

  static dynamic _$data(Asset v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();

  @override
  final Map<Symbol, Field<Asset, dynamic>> fields = const {
    #data: Field<Asset, dynamic>('data', _$data, arg: _arg$data),
  };

  static Asset<T> _instantiate<T>(DecodingData data) {
    return Asset(data: data.get(#data));
  }

  @override
  final Function instantiate = _instantiate;

  static Asset<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Asset<T>>(map));
  }

  static Asset<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<Asset<T>>(json));
  }
}

mixin AssetMappable<T> {
  String toJson() {
    return AssetMapper._guard((c) => c.toJson(this as Asset<T>));
  }

  Map<String, dynamic> toMap() {
    return AssetMapper._guard((c) => c.toMap(this as Asset<T>));
  }

  AssetCopyWith<Asset<T>, Asset<T>, Asset<T>, T> get copyWith =>
      _AssetCopyWithImpl(this as Asset<T>, $identity, $identity);
  @override
  String toString() {
    return AssetMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AssetMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AssetMapper._guard((c) => c.hash(this));
  }
}

extension AssetValueCopy<$R, $Out extends Asset, T>
    on ObjectCopyWith<$R, Asset<T>, $Out> {
  AssetCopyWith<$R, Asset<T>, $Out, T> get $asAsset =>
      $base.as((v, t, t2) => _AssetCopyWithImpl(v, t, t2));
}

typedef AssetCopyWithBound = Asset;

abstract class AssetCopyWith<$R, $In extends Asset<T>, $Out extends Asset, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? data});
  AssetCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2 extends Asset>(
      Then<Asset<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _AssetCopyWithImpl<$R, $Out extends Asset, T>
    extends ClassCopyWithBase<$R, Asset<T>, $Out>
    implements AssetCopyWith<$R, Asset<T>, $Out, T> {
  _AssetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Asset> $mapper = AssetMapper.ensureInitialized();
  @override
  $R call({T? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Asset<T> $make(CopyWithData data) =>
      Asset(data: data.get(#data, or: $value.data));

  @override
  AssetCopyWith<$R2, Asset<T>, $Out2, T> $chain<$R2, $Out2 extends Asset>(
          Then<Asset<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _AssetCopyWithImpl($value, t, t2);
}
