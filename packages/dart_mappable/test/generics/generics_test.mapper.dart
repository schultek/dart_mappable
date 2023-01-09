// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generics_test.dart';

class BoxMapper extends MapperBase<Box> {
  static MapperContainer container = MapperContainer(
    mappers: {BoxMapper()},
  )..linkAll({ContentMapper.container});

  @override
  BoxMapperElement createElement(MapperContainer container) {
    return BoxMapperElement._(this, container);
  }

  @override
  String get id => 'Box';
  @override
  Function get typeFactory => <T extends Content>(f) => f<Box<T>>();

  static Box<T> fromMap<T extends Content>(Map<String, dynamic> map) =>
      container.fromMap<Box<T>>(map);
  static Box<T> fromJson<T extends Content>(String json) =>
      container.fromJson<Box<T>>(json);
}

class BoxMapperElement extends MapperElementBase<Box> {
  BoxMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Box<T> decode<T extends Content>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T extends Content>(Map<String, dynamic> map) =>
      Box(container.$get(map, 'size'),
          contents: container.$get(map, 'contents'));

  @override
  Function get encoder => encode;
  dynamic encode<T extends Content>(Box<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T extends Content>(Box<T> b) => {
        'size': container.$enc(b.size, 'size'),
        'contents': container.$enc(b.contents, 'contents')
      };

  @override
  String stringify(Box self) =>
      'Box(size: ${container.asString(self.size)}, contents: ${container.asString(self.contents)})';
  @override
  int hash(Box self) =>
      container.hash(self.size) ^ container.hash(self.contents);
  @override
  bool equals(Box self, Box other) =>
      container.isEqual(self.size, other.size) &&
      container.isEqual(self.contents, other.contents);
}

mixin BoxMappable<T extends Content> {
  String toJson() => BoxMapper.container.toJson(this as Box<T>);
  Map<String, dynamic> toMap() => BoxMapper.container.toMap(this as Box<T>);
  BoxCopyWith<Box<T>, Box<T>, Box<T>, T> get copyWith =>
      _BoxCopyWithImpl(this as Box<T>, $identity, $identity);
  @override
  String toString() => BoxMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BoxMapper.container.isEqual(this, other));
  @override
  int get hashCode => BoxMapper.container.hash(this);
}

extension BoxValueCopy<$R, $Out extends Box, T extends Content>
    on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get asBox =>
      base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

typedef BoxCopyWithBound = Box;

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out extends Box,
    T extends Content> implements ObjectCopyWith<$R, $In, $Out> {
  BoxCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends Box>(
      Then<Box<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents;
  $R call({int? size, List<T>? contents});
}

class _BoxCopyWithImpl<$R, $Out extends Box, T extends Content>
    extends CopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);
  @override
  BoxCopyWith<$R2, Box<T>, $Out2, T> chain<$R2, $Out2 extends Box>(
          Then<Box<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BoxCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, ContentCopyWith<$R, T, T>> get contents => ListCopyWith(
      $value.contents,
      (v, t) => $cast(v.copyWith.chain<$R, T>($cast, t)),
      (v) => call(contents: v));
  @override
  $R call({int? size, List<T>? contents}) =>
      $then(Box(size ?? $value.size, contents: contents ?? $value.contents));
}

class ConfettiMapper extends MapperBase<Confetti> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {ConfettiMapper()},
      ))
        ..linkAll({ContentMapper.container}));

  @override
  ConfettiMapperElement createElement(MapperContainer container) {
    return ConfettiMapperElement._(this, container);
  }

  @override
  String get id => 'Confetti';

  static final fromMap = container.fromMap<Confetti>;
  static final fromJson = container.fromJson<Confetti>;
}

class ConfettiMapperElement extends MapperElementBase<Confetti> {
  ConfettiMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Confetti decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) =>
      Confetti(container.$get(map, 'color'));

  @override
  Function get encoder => encode;
  dynamic encode(Confetti v) => toMap(v);
  Map<String, dynamic> toMap(Confetti c) =>
      {'color': container.$enc(c.color, 'color')};

  @override
  String stringify(Confetti self) =>
      'Confetti(color: ${container.asString(self.color)})';
  @override
  int hash(Confetti self) => container.hash(self.color);
  @override
  bool equals(Confetti self, Confetti other) =>
      container.isEqual(self.color, other.color);
}

mixin ConfettiMappable {
  String toJson() => ConfettiMapper.container.toJson(this as Confetti);
  Map<String, dynamic> toMap() =>
      ConfettiMapper.container.toMap(this as Confetti);
  ConfettiCopyWith<Confetti, Confetti, Confetti> get copyWith =>
      _ConfettiCopyWithImpl(this as Confetti, $identity, $identity);
  @override
  String toString() => ConfettiMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ConfettiMapper.container.isEqual(this, other));
  @override
  int get hashCode => ConfettiMapper.container.hash(this);
}

extension ConfettiValueCopy<$R, $Out extends Content>
    on ObjectCopyWith<$R, Confetti, $Out> {
  ConfettiCopyWith<$R, Confetti, $Out> get asConfetti =>
      base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

typedef ConfettiCopyWithBound = Content;

abstract class ConfettiCopyWith<$R, $In extends Confetti, $Out extends Content>
    implements ContentCopyWith<$R, $In, $Out> {
  ConfettiCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Content>(
      Then<Confetti, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? color});
}

class _ConfettiCopyWithImpl<$R, $Out extends Content>
    extends CopyWithBase<$R, Confetti, $Out>
    implements ConfettiCopyWith<$R, Confetti, $Out> {
  _ConfettiCopyWithImpl(super.value, super.then, super.then2);
  @override
  ConfettiCopyWith<$R2, Confetti, $Out2> chain<$R2, $Out2 extends Content>(
          Then<Confetti, $Out2> t, Then<$Out2, $R2> t2) =>
      _ConfettiCopyWithImpl($value, t, t2);

  @override
  $R call({String? color}) => $then(Confetti(color ?? $value.color));
}

class ContentMapper extends MapperBase<Content> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {ContentMapper()},
      ))
        ..linkAll({ConfettiMapper.container}));

  @override
  ContentMapperElement createElement(MapperContainer container) {
    return ContentMapperElement._(this, container);
  }

  @override
  String get id => 'Content';

  static final fromMap = container.fromMap<Content>;
  static final fromJson = container.fromJson<Content>;
}

class ContentMapperElement extends MapperElementBase<Content> {
  ContentMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Content decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Content fromMap(Map<String, dynamic> map) => Content();

  @override
  Function get encoder => encode;
  dynamic encode(Content v) => toMap(v);
  Map<String, dynamic> toMap(Content c) => {};

  @override
  String stringify(Content self) => 'Content()';
  @override
  int hash(Content self) => 0;
  @override
  bool equals(Content self, Content other) => true;
}

mixin ContentMappable {
  String toJson() => ContentMapper.container.toJson(this as Content);
  Map<String, dynamic> toMap() =>
      ContentMapper.container.toMap(this as Content);
  ContentCopyWith<Content, Content, Content> get copyWith =>
      _ContentCopyWithImpl(this as Content, $identity, $identity);
  @override
  String toString() => ContentMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ContentMapper.container.isEqual(this, other));
  @override
  int get hashCode => ContentMapper.container.hash(this);
}

extension ContentValueCopy<$R, $Out extends Content>
    on ObjectCopyWith<$R, Content, $Out> {
  ContentCopyWith<$R, Content, $Out> get asContent =>
      base.as((v, t, t2) => _ContentCopyWithImpl(v, t, t2));
}

typedef ContentCopyWithBound = Content;

abstract class ContentCopyWith<$R, $In extends Content, $Out extends Content>
    implements ObjectCopyWith<$R, $In, $Out> {
  ContentCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Content>(
      Then<Content, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ContentCopyWithImpl<$R, $Out extends Content>
    extends CopyWithBase<$R, Content, $Out>
    implements ContentCopyWith<$R, Content, $Out> {
  _ContentCopyWithImpl(super.value, super.then, super.then2);
  @override
  ContentCopyWith<$R2, Content, $Out2> chain<$R2, $Out2 extends Content>(
          Then<Content, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(Content());
}

class DataMapper extends MapperBase<Data> {
  static MapperContainer container = MapperContainer(
    mappers: {DataMapper()},
  );

  @override
  DataMapperElement createElement(MapperContainer container) {
    return DataMapperElement._(this, container);
  }

  @override
  String get id => 'Data';

  static final fromMap = container.fromMap<Data>;
  static final fromJson = container.fromJson<Data>;
}

class DataMapperElement extends MapperElementBase<Data> {
  DataMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Data decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Data fromMap(Map<String, dynamic> map) => Data(container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode(Data v) => toMap(v);
  Map<String, dynamic> toMap(Data d) =>
      {'data': container.$enc(d.data, 'data')};

  @override
  String stringify(Data self) => 'Data(data: ${container.asString(self.data)})';
  @override
  int hash(Data self) => container.hash(self.data);
  @override
  bool equals(Data self, Data other) =>
      container.isEqual(self.data, other.data);
}

mixin DataMappable {
  String toJson() => DataMapper.container.toJson(this as Data);
  Map<String, dynamic> toMap() => DataMapper.container.toMap(this as Data);
  DataCopyWith<Data, Data, Data> get copyWith =>
      _DataCopyWithImpl(this as Data, $identity, $identity);
  @override
  String toString() => DataMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DataMapper.container.isEqual(this, other));
  @override
  int get hashCode => DataMapper.container.hash(this);
}

extension DataValueCopy<$R, $Out extends Data>
    on ObjectCopyWith<$R, Data, $Out> {
  DataCopyWith<$R, Data, $Out> get asData =>
      base.as((v, t, t2) => _DataCopyWithImpl(v, t, t2));
}

typedef DataCopyWithBound = Data;

abstract class DataCopyWith<$R, $In extends Data, $Out extends Data>
    implements ObjectCopyWith<$R, $In, $Out> {
  DataCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Data>(
      Then<Data, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? data});
}

class _DataCopyWithImpl<$R, $Out extends Data>
    extends CopyWithBase<$R, Data, $Out>
    implements DataCopyWith<$R, Data, $Out> {
  _DataCopyWithImpl(super.value, super.then, super.then2);
  @override
  DataCopyWith<$R2, Data, $Out2> chain<$R2, $Out2 extends Data>(
          Then<Data, $Out2> t, Then<$Out2, $R2> t2) =>
      _DataCopyWithImpl($value, t, t2);

  @override
  $R call({String? data}) => $then(Data(data ?? $value.data));
}

class SingleSettingMapper extends MapperBase<SingleSetting> {
  static MapperContainer container = MapperContainer(
    mappers: {SingleSettingMapper()},
  );

  @override
  SingleSettingMapperElement createElement(MapperContainer container) {
    return SingleSettingMapperElement._(this, container);
  }

  @override
  String get id => 'SingleSetting';
  @override
  Function get typeFactory => <T>(f) => f<SingleSetting<T>>();

  static SingleSetting<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<SingleSetting<T>>(map);
  static SingleSetting<T> fromJson<T>(String json) =>
      container.fromJson<SingleSetting<T>>(json);
}

class SingleSettingMapperElement extends MapperElementBase<SingleSetting> {
  SingleSettingMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  SingleSetting<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  SingleSetting<T> fromMap<T>(Map<String, dynamic> map) =>
      SingleSetting(properties: container.$getOpt(map, 'properties'));

  @override
  Function get encoder => encode;
  dynamic encode<T>(SingleSetting<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(SingleSetting<T> s) =>
      {'properties': container.$enc(s.properties, 'properties')};

  @override
  String stringify(SingleSetting self) =>
      'SingleSetting(properties: ${container.asString(self.properties)})';
  @override
  int hash(SingleSetting self) => container.hash(self.properties);
  @override
  bool equals(SingleSetting self, SingleSetting other) =>
      container.isEqual(self.properties, other.properties);
}

mixin SingleSettingMappable<T> {
  String toJson() =>
      SingleSettingMapper.container.toJson(this as SingleSetting<T>);
  Map<String, dynamic> toMap() =>
      SingleSettingMapper.container.toMap(this as SingleSetting<T>);
  SingleSettingCopyWith<SingleSetting<T>, SingleSetting<T>, SingleSetting<T>, T>
      get copyWith => _SingleSettingCopyWithImpl(
          this as SingleSetting<T>, $identity, $identity);
  @override
  String toString() => SingleSettingMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          SingleSettingMapper.container.isEqual(this, other));
  @override
  int get hashCode => SingleSettingMapper.container.hash(this);
}

extension SingleSettingValueCopy<$R, $Out extends SingleSetting, T>
    on ObjectCopyWith<$R, SingleSetting<T>, $Out> {
  SingleSettingCopyWith<$R, SingleSetting<T>, $Out, T> get asSingleSetting =>
      base.as((v, t, t2) => _SingleSettingCopyWithImpl(v, t, t2));
}

typedef SingleSettingCopyWithBound = SingleSetting;

abstract class SingleSettingCopyWith<$R, $In extends SingleSetting<T>,
    $Out extends SingleSetting, T> implements ObjectCopyWith<$R, $In, $Out> {
  SingleSettingCopyWith<$R2, $In, $Out2, T>
      chain<$R2, $Out2 extends SingleSetting>(
          Then<SingleSetting<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties;
  $R call({List<T>? properties});
}

class _SingleSettingCopyWithImpl<$R, $Out extends SingleSetting, T>
    extends CopyWithBase<$R, SingleSetting<T>, $Out>
    implements SingleSettingCopyWith<$R, SingleSetting<T>, $Out, T> {
  _SingleSettingCopyWithImpl(super.value, super.then, super.then2);
  @override
  SingleSettingCopyWith<$R2, SingleSetting<T>, $Out2, T>
      chain<$R2, $Out2 extends SingleSetting>(
              Then<SingleSetting<T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _SingleSettingCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get properties =>
      $value.properties != null
          ? ListCopyWith(
              $value.properties!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(properties: v))
          : null;
  @override
  $R call({Object? properties = $none}) =>
      $then(SingleSetting(properties: or(properties, $value.properties)));
}

class SettingsMapper extends MapperBase<Settings> {
  static MapperContainer container = MapperContainer(
    mappers: {SettingsMapper()},
  )..linkAll({SingleSettingMapper.container});

  @override
  SettingsMapperElement createElement(MapperContainer container) {
    return SettingsMapperElement._(this, container);
  }

  @override
  String get id => 'Settings';

  static final fromMap = container.fromMap<Settings>;
  static final fromJson = container.fromJson<Settings>;
}

class SettingsMapperElement extends MapperElementBase<Settings> {
  SettingsMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Settings decode(dynamic v) => const MapHooksAfter().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  Settings fromMap(Map<String, dynamic> map) =>
      Settings(settings: container.$getOpt(map, 'settings'));

  @override
  Function get encoder => encode;
  dynamic encode(Settings v) =>
      const MapHooksAfter().encode<Settings>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Settings s) =>
      {'settings': container.$enc(s.settings, 'settings')};

  @override
  String stringify(Settings self) =>
      'Settings(settings: ${container.asString(self.settings)})';
  @override
  int hash(Settings self) => container.hash(self.settings);
  @override
  bool equals(Settings self, Settings other) =>
      container.isEqual(self.settings, other.settings);
}

mixin SettingsMappable {
  String toJson() => SettingsMapper.container.toJson(this as Settings);
  Map<String, dynamic> toMap() =>
      SettingsMapper.container.toMap(this as Settings);
  SettingsCopyWith<Settings, Settings, Settings> get copyWith =>
      _SettingsCopyWithImpl(this as Settings, $identity, $identity);
  @override
  String toString() => SettingsMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          SettingsMapper.container.isEqual(this, other));
  @override
  int get hashCode => SettingsMapper.container.hash(this);
}

extension SettingsValueCopy<$R, $Out extends Settings>
    on ObjectCopyWith<$R, Settings, $Out> {
  SettingsCopyWith<$R, Settings, $Out> get asSettings =>
      base.as((v, t, t2) => _SettingsCopyWithImpl(v, t, t2));
}

typedef SettingsCopyWithBound = Settings;

abstract class SettingsCopyWith<$R, $In extends Settings, $Out extends Settings>
    implements ObjectCopyWith<$R, $In, $Out> {
  SettingsCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Settings>(
      Then<Settings, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<
      $R,
      String,
      SingleSetting<dynamic>,
      SingleSettingCopyWith<$R, SingleSetting<dynamic>, SingleSetting<dynamic>,
          dynamic>>? get settings;
  $R call({Map<String, SingleSetting<dynamic>>? settings});
}

class _SettingsCopyWithImpl<$R, $Out extends Settings>
    extends CopyWithBase<$R, Settings, $Out>
    implements SettingsCopyWith<$R, Settings, $Out> {
  _SettingsCopyWithImpl(super.value, super.then, super.then2);
  @override
  SettingsCopyWith<$R2, Settings, $Out2> chain<$R2, $Out2 extends Settings>(
          Then<Settings, $Out2> t, Then<$Out2, $R2> t2) =>
      _SettingsCopyWithImpl($value, t, t2);

  @override
  MapCopyWith<
      $R,
      String,
      SingleSetting<dynamic>,
      SingleSettingCopyWith<$R, SingleSetting<dynamic>, SingleSetting<dynamic>,
          dynamic>>? get settings => $value.settings != null
      ? MapCopyWith(
          $value.settings!,
          (v, t) => v.copyWith.chain<$R, SingleSetting<dynamic>>($identity, t),
          (v) => call(settings: v))
      : null;
  @override
  $R call({Object? settings = $none}) =>
      $then(Settings(settings: or(settings, $value.settings)));
}

class AssetMapper extends MapperBase<Asset> {
  static MapperContainer container = MapperContainer(
    mappers: {AssetMapper()},
  );

  @override
  AssetMapperElement createElement(MapperContainer container) {
    return AssetMapperElement._(this, container);
  }

  @override
  String get id => 'Asset';
  @override
  Function get typeFactory => <T>(f) => f<Asset<T>>();

  static Asset<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<Asset<T>>(map);
  static Asset<T> fromJson<T>(String json) =>
      container.fromJson<Asset<T>>(json);
}

class AssetMapperElement extends MapperElementBase<Asset> {
  AssetMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Asset<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Asset<T> fromMap<T>(Map<String, dynamic> map) =>
      Asset(data: container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode<T>(Asset<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(Asset<T> a) =>
      {'data': container.$enc(a.data, 'data')};

  @override
  String stringify(Asset self) =>
      'Asset(data: ${container.asString(self.data)})';
  @override
  int hash(Asset self) => container.hash(self.data);
  @override
  bool equals(Asset self, Asset other) =>
      container.isEqual(self.data, other.data);
}

mixin AssetMappable<T> {
  String toJson() => AssetMapper.container.toJson(this as Asset<T>);
  Map<String, dynamic> toMap() => AssetMapper.container.toMap(this as Asset<T>);
  AssetCopyWith<Asset<T>, Asset<T>, Asset<T>, T> get copyWith =>
      _AssetCopyWithImpl(this as Asset<T>, $identity, $identity);
  @override
  String toString() => AssetMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AssetMapper.container.isEqual(this, other));
  @override
  int get hashCode => AssetMapper.container.hash(this);
}

extension AssetValueCopy<$R, $Out extends Asset, T>
    on ObjectCopyWith<$R, Asset<T>, $Out> {
  AssetCopyWith<$R, Asset<T>, $Out, T> get asAsset =>
      base.as((v, t, t2) => _AssetCopyWithImpl(v, t, t2));
}

typedef AssetCopyWithBound = Asset;

abstract class AssetCopyWith<$R, $In extends Asset<T>, $Out extends Asset, T>
    implements ObjectCopyWith<$R, $In, $Out> {
  AssetCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends Asset>(
      Then<Asset<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call({T? data});
}

class _AssetCopyWithImpl<$R, $Out extends Asset, T>
    extends CopyWithBase<$R, Asset<T>, $Out>
    implements AssetCopyWith<$R, Asset<T>, $Out, T> {
  _AssetCopyWithImpl(super.value, super.then, super.then2);
  @override
  AssetCopyWith<$R2, Asset<T>, $Out2, T> chain<$R2, $Out2 extends Asset>(
          Then<Asset<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _AssetCopyWithImpl($value, t, t2);

  @override
  $R call({T? data}) => $then(Asset(data: data ?? $value.data));
}
