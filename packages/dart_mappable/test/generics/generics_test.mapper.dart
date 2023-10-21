// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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

  @override
  final String id = 'Box';
  @override
  Function get typeFactory => <T extends Content>(f) => f<Box<T>>();

  static int _$size(Box v) => v.size;
  static const Field<Box, int> _f$size = Field('size', _$size);
  static List<Content> _$contents(Box v) => v.contents;
  static dynamic _arg$contents<T extends Content>(f) => f<List<T>>();
  static const Field<Box, List<Content>> _f$contents =
      Field('contents', _$contents, arg: _arg$contents);

  @override
  final Map<Symbol, Field<Box, dynamic>> fields = const {
    #size: _f$size,
    #contents: _f$contents,
  };

  static Box<T> _instantiate<T extends Content>(DecodingData data) {
    return Box(data.dec(_f$size), contents: data.dec(_f$contents));
  }

  @override
  final Function instantiate = _instantiate;

  static Box<T> fromMap<T extends Content>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Box<T>>(map);
  }

  static Box<T> fromJson<T extends Content>(String json) {
    return ensureInitialized().decodeJson<Box<T>>(json);
  }
}

mixin BoxMappable<T extends Content> {
  String toJson() {
    return BoxMapper.ensureInitialized().encodeJson<Box<T>>(this as Box<T>);
  }

  Map<String, dynamic> toMap() {
    return BoxMapper.ensureInitialized().encodeMap<Box<T>>(this as Box<T>);
  }

  BoxCopyWith<Box<T>, Box<T>, Box<T>, T> get copyWith =>
      _BoxCopyWithImpl(this as Box<T>, $identity, $identity);
  @override
  String toString() {
    return BoxMapper.ensureInitialized().stringifyValue(this as Box<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BoxMapper.ensureInitialized().isValueEqual(this as Box<T>, other));
  }

  @override
  int get hashCode {
    return BoxMapper.ensureInitialized().hashValue(this as Box<T>);
  }
}

extension BoxValueCopy<$R, $Out, T extends Content>
    on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out, T extends Content>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents;
  $R call({int? size, List<T>? contents});
  BoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCopyWithImpl<$R, $Out, T extends Content>
    extends ClassCopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents => ListCopyWith(
      $value.contents,
      (v, t) => (v.copyWith as ContentCopyWith<Content, T, T>).$chain(t),
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
  BoxCopyWith<$R2, Box<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCopyWithImpl($value, $cast, t);
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
    return ensureInitialized().decodeMap<Content>(map);
  }

  static Content fromJson(String json) {
    return ensureInitialized().decodeJson<Content>(json);
  }
}

mixin ContentMappable {
  String toJson() {
    return ContentMapper.ensureInitialized()
        .encodeJson<Content>(this as Content);
  }

  Map<String, dynamic> toMap() {
    return ContentMapper.ensureInitialized()
        .encodeMap<Content>(this as Content);
  }

  ContentCopyWith<Content, Content, Content> get copyWith =>
      _ContentCopyWithImpl(this as Content, $identity, $identity);
  @override
  String toString() {
    return ContentMapper.ensureInitialized().stringifyValue(this as Content);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContentMapper.ensureInitialized()
                .isValueEqual(this as Content, other));
  }

  @override
  int get hashCode {
    return ContentMapper.ensureInitialized().hashValue(this as Content);
  }
}

extension ContentValueCopy<$R, $Out> on ObjectCopyWith<$R, Content, $Out> {
  ContentCopyWith<$R, Content, $Out> get $asContent =>
      $base.as((v, t, t2) => _ContentCopyWithImpl(v, t, t2));
}

abstract class ContentCopyWith<$R, $In extends Content, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContentCopyWithImpl<$R, $Out>
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
  ContentCopyWith<$R2, Content, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ContentCopyWithImpl($value, $cast, t);
}

class ConfettiMapper extends ClassMapperBase<Confetti> {
  ConfettiMapper._();

  static ConfettiMapper? _instance;
  static ConfettiMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfettiMapper._());
      ContentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Confetti';

  static String _$color(Confetti v) => v.color;
  static const Field<Confetti, String> _f$color = Field('color', _$color);

  @override
  final Map<Symbol, Field<Confetti, dynamic>> fields = const {
    #color: _f$color,
  };

  static Confetti _instantiate(DecodingData data) {
    return Confetti(data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static Confetti fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Confetti>(map);
  }

  static Confetti fromJson(String json) {
    return ensureInitialized().decodeJson<Confetti>(json);
  }
}

mixin ConfettiMappable {
  String toJson() {
    return ConfettiMapper.ensureInitialized()
        .encodeJson<Confetti>(this as Confetti);
  }

  Map<String, dynamic> toMap() {
    return ConfettiMapper.ensureInitialized()
        .encodeMap<Confetti>(this as Confetti);
  }

  ConfettiCopyWith<Confetti, Confetti, Confetti> get copyWith =>
      _ConfettiCopyWithImpl(this as Confetti, $identity, $identity);
  @override
  String toString() {
    return ConfettiMapper.ensureInitialized().stringifyValue(this as Confetti);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfettiMapper.ensureInitialized()
                .isValueEqual(this as Confetti, other));
  }

  @override
  int get hashCode {
    return ConfettiMapper.ensureInitialized().hashValue(this as Confetti);
  }
}

extension ConfettiValueCopy<$R, $Out> on ObjectCopyWith<$R, Confetti, $Out> {
  ConfettiCopyWith<$R, Confetti, $Out> get $asConfetti =>
      $base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

abstract class ConfettiCopyWith<$R, $In extends Confetti, $Out>
    implements ContentCopyWith<$R, $In, $Out> {
  @override
  $R call({String? color});
  ConfettiCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfettiCopyWithImpl<$R, $Out>
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
  ConfettiCopyWith<$R2, Confetti, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConfettiCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Data';

  static String _$data(Data v) => v.data;
  static const Field<Data, String> _f$data = Field('data', _$data);

  @override
  final Map<Symbol, Field<Data, dynamic>> fields = const {
    #data: _f$data,
  };

  static Data _instantiate(DecodingData data) {
    return Data(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static Data fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Data>(map);
  }

  static Data fromJson(String json) {
    return ensureInitialized().decodeJson<Data>(json);
  }
}

mixin DataMappable {
  String toJson() {
    return DataMapper.ensureInitialized().encodeJson<Data>(this as Data);
  }

  Map<String, dynamic> toMap() {
    return DataMapper.ensureInitialized().encodeMap<Data>(this as Data);
  }

  DataCopyWith<Data, Data, Data> get copyWith =>
      _DataCopyWithImpl(this as Data, $identity, $identity);
  @override
  String toString() {
    return DataMapper.ensureInitialized().stringifyValue(this as Data);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DataMapper.ensureInitialized().isValueEqual(this as Data, other));
  }

  @override
  int get hashCode {
    return DataMapper.ensureInitialized().hashValue(this as Data);
  }
}

extension DataValueCopy<$R, $Out> on ObjectCopyWith<$R, Data, $Out> {
  DataCopyWith<$R, Data, $Out> get $asData =>
      $base.as((v, t, t2) => _DataCopyWithImpl(v, t, t2));
}

abstract class DataCopyWith<$R, $In extends Data, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  DataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DataCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Data, $Out>
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
  DataCopyWith<$R2, Data, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DataCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'SingleSetting';
  @override
  Function get typeFactory => <T>(f) => f<SingleSetting<T>>();

  static List<dynamic>? _$properties(SingleSetting v) => v.properties;
  static dynamic _arg$properties<T>(f) => f<List<T>>();
  static const Field<SingleSetting, List<dynamic>> _f$properties =
      Field('properties', _$properties, opt: true, arg: _arg$properties);

  @override
  final Map<Symbol, Field<SingleSetting, dynamic>> fields = const {
    #properties: _f$properties,
  };

  static SingleSetting<T> _instantiate<T>(DecodingData data) {
    return SingleSetting(properties: data.dec(_f$properties));
  }

  @override
  final Function instantiate = _instantiate;

  static SingleSetting<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SingleSetting<T>>(map);
  }

  static SingleSetting<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<SingleSetting<T>>(json);
  }
}

mixin SingleSettingMappable<T> {
  String toJson() {
    return SingleSettingMapper.ensureInitialized()
        .encodeJson<SingleSetting<T>>(this as SingleSetting<T>);
  }

  Map<String, dynamic> toMap() {
    return SingleSettingMapper.ensureInitialized()
        .encodeMap<SingleSetting<T>>(this as SingleSetting<T>);
  }

  SingleSettingCopyWith<SingleSetting<T>, SingleSetting<T>, SingleSetting<T>, T>
      get copyWith => _SingleSettingCopyWithImpl(
          this as SingleSetting<T>, $identity, $identity);
  @override
  String toString() {
    return SingleSettingMapper.ensureInitialized()
        .stringifyValue(this as SingleSetting<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SingleSettingMapper.ensureInitialized()
                .isValueEqual(this as SingleSetting<T>, other));
  }

  @override
  int get hashCode {
    return SingleSettingMapper.ensureInitialized()
        .hashValue(this as SingleSetting<T>);
  }
}

extension SingleSettingValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, SingleSetting<T>, $Out> {
  SingleSettingCopyWith<$R, SingleSetting<T>, $Out, T> get $asSingleSetting =>
      $base.as((v, t, t2) => _SingleSettingCopyWithImpl(v, t, t2));
}

abstract class SingleSettingCopyWith<$R, $In extends SingleSetting<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties;
  $R call({List<T>? properties});
  SingleSettingCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SingleSettingCopyWithImpl<$R, $Out, T>
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
  SingleSettingCopyWith<$R2, SingleSetting<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SingleSettingCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Settings';

  static Map<String, SingleSetting<dynamic>>? _$settings(Settings v) =>
      v.settings;
  static const Field<Settings, Map<String, SingleSetting<dynamic>>>
      _f$settings = Field('settings', _$settings, opt: true);

  @override
  final Map<Symbol, Field<Settings, dynamic>> fields = const {
    #settings: _f$settings,
  };

  @override
  final MappingHook hook = const MapHooksAfter();
  static Settings _instantiate(DecodingData data) {
    return Settings(settings: data.dec(_f$settings));
  }

  @override
  final Function instantiate = _instantiate;

  static Settings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Settings>(map);
  }

  static Settings fromJson(String json) {
    return ensureInitialized().decodeJson<Settings>(json);
  }
}

mixin SettingsMappable {
  String toJson() {
    return SettingsMapper.ensureInitialized()
        .encodeJson<Settings>(this as Settings);
  }

  Map<String, dynamic> toMap() {
    return SettingsMapper.ensureInitialized()
        .encodeMap<Settings>(this as Settings);
  }

  SettingsCopyWith<Settings, Settings, Settings> get copyWith =>
      _SettingsCopyWithImpl(this as Settings, $identity, $identity);
  @override
  String toString() {
    return SettingsMapper.ensureInitialized().stringifyValue(this as Settings);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SettingsMapper.ensureInitialized()
                .isValueEqual(this as Settings, other));
  }

  @override
  int get hashCode {
    return SettingsMapper.ensureInitialized().hashValue(this as Settings);
  }
}

extension SettingsValueCopy<$R, $Out> on ObjectCopyWith<$R, Settings, $Out> {
  SettingsCopyWith<$R, Settings, $Out> get $asSettings =>
      $base.as((v, t, t2) => _SettingsCopyWithImpl(v, t, t2));
}

abstract class SettingsCopyWith<$R, $In extends Settings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
      $R,
      String,
      SingleSetting<dynamic>,
      SingleSettingCopyWith<$R, SingleSetting<dynamic>, SingleSetting<dynamic>,
          dynamic>>? get settings;
  $R call({Map<String, SingleSetting<dynamic>>? settings});
  SettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsCopyWithImpl<$R, $Out>
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
      ? MapCopyWith($value.settings!, (v, t) => v.copyWith.$chain(t),
          (v) => call(settings: v))
      : null;
  @override
  $R call({Object? settings = $none}) =>
      $apply(FieldCopyWithData({if (settings != $none) #settings: settings}));
  @override
  Settings $make(CopyWithData data) =>
      Settings(settings: data.get(#settings, or: $value.settings));

  @override
  SettingsCopyWith<$R2, Settings, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SettingsCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Asset';
  @override
  Function get typeFactory => <T>(f) => f<Asset<T>>();

  static dynamic _$data(Asset v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Asset, dynamic> _f$data =
      Field('data', _$data, arg: _arg$data);

  @override
  final Map<Symbol, Field<Asset, dynamic>> fields = const {
    #data: _f$data,
  };

  static Asset<T> _instantiate<T>(DecodingData data) {
    return Asset(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static Asset<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Asset<T>>(map);
  }

  static Asset<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Asset<T>>(json);
  }
}

mixin AssetMappable<T> {
  String toJson() {
    return AssetMapper.ensureInitialized()
        .encodeJson<Asset<T>>(this as Asset<T>);
  }

  Map<String, dynamic> toMap() {
    return AssetMapper.ensureInitialized()
        .encodeMap<Asset<T>>(this as Asset<T>);
  }

  AssetCopyWith<Asset<T>, Asset<T>, Asset<T>, T> get copyWith =>
      _AssetCopyWithImpl(this as Asset<T>, $identity, $identity);
  @override
  String toString() {
    return AssetMapper.ensureInitialized().stringifyValue(this as Asset<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AssetMapper.ensureInitialized()
                .isValueEqual(this as Asset<T>, other));
  }

  @override
  int get hashCode {
    return AssetMapper.ensureInitialized().hashValue(this as Asset<T>);
  }
}

extension AssetValueCopy<$R, $Out, T> on ObjectCopyWith<$R, Asset<T>, $Out> {
  AssetCopyWith<$R, Asset<T>, $Out, T> get $asAsset =>
      $base.as((v, t, t2) => _AssetCopyWithImpl(v, t, t2));
}

abstract class AssetCopyWith<$R, $In extends Asset<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? data});
  AssetCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AssetCopyWithImpl<$R, $Out, T>
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
  AssetCopyWith<$R2, Asset<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AssetCopyWithImpl($value, $cast, t);
}
