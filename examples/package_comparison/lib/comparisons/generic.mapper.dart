// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generic.dart';

class BoxCMapper extends MapperBase<BoxC> {
  static MapperContainer container = MapperContainer(
    mappers: {BoxCMapper()},
  );

  @override
  BoxCMapperElement createElement(MapperContainer container) {
    return BoxCMapperElement._(this, container);
  }

  @override
  String get id => 'BoxC';
  @override
  Function get typeFactory => <T>(f) => f<BoxC<T>>();

  static BoxC<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<BoxC<T>>(map);
  static BoxC<T> fromJson<T>(String json) => container.fromJson<BoxC<T>>(json);
}

class BoxCMapperElement extends MapperElementBase<BoxC> {
  BoxCMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BoxC<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  BoxC<T> fromMap<T>(Map<String, dynamic> map) =>
      BoxC(content: container.$get(map, 'content'));

  @override
  Function get encoder => encode;
  dynamic encode<T>(BoxC<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(BoxC<T> b) =>
      {'content': container.$enc(b.content, 'content')};

  @override
  String stringify(BoxC self) =>
      'BoxC(content: ${container.asString(self.content)})';
  @override
  int hash(BoxC self) => container.hash(self.content);
  @override
  bool equals(BoxC self, BoxC other) =>
      container.isEqual(self.content, other.content);
}

mixin BoxCMappable<T> {
  String toJson() => BoxCMapper.container.toJson(this as BoxC<T>);
  Map<String, dynamic> toMap() => BoxCMapper.container.toMap(this as BoxC<T>);
  BoxCCopyWith<BoxC<T>, BoxC<T>, BoxC<T>, T> get copyWith =>
      _BoxCCopyWithImpl(this as BoxC<T>, $identity, $identity);
  @override
  String toString() => BoxCMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BoxCMapper.container.isEqual(this, other));
  @override
  int get hashCode => BoxCMapper.container.hash(this);
}

extension BoxCValueCopy<$R, $Out extends BoxC, T>
    on ObjectCopyWith<$R, BoxC<T>, $Out> {
  BoxCCopyWith<$R, BoxC<T>, $Out, T> get asBoxC =>
      base.as((v, t, t2) => _BoxCCopyWithImpl(v, t, t2));
}

typedef BoxCCopyWithBound = BoxC;

abstract class BoxCCopyWith<$R, $In extends BoxC<T>, $Out extends BoxC, T>
    implements ObjectCopyWith<$R, $In, $Out> {
  BoxCCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends BoxC>(
      Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call({T? content});
}

class _BoxCCopyWithImpl<$R, $Out extends BoxC, T>
    extends CopyWithBase<$R, BoxC<T>, $Out>
    implements BoxCCopyWith<$R, BoxC<T>, $Out, T> {
  _BoxCCopyWithImpl(super.value, super.then, super.then2);
  @override
  BoxCCopyWith<$R2, BoxC<T>, $Out2, T> chain<$R2, $Out2 extends BoxC>(
          Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BoxCCopyWithImpl($value, t, t2);

  @override
  $R call({T? content}) => $then(BoxC(content: content ?? $value.content));
}

class ContentCMapper extends MapperBase<ContentC> {
  static MapperContainer container = MapperContainer(
    mappers: {ContentCMapper()},
  );

  @override
  ContentCMapperElement createElement(MapperContainer container) {
    return ContentCMapperElement._(this, container);
  }

  @override
  String get id => 'ContentC';

  static final fromMap = container.fromMap<ContentC>;
  static final fromJson = container.fromJson<ContentC>;
}

class ContentCMapperElement extends MapperElementBase<ContentC> {
  ContentCMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ContentC decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ContentC fromMap(Map<String, dynamic> map) =>
      ContentC(container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode(ContentC v) => toMap(v);
  Map<String, dynamic> toMap(ContentC c) =>
      {'data': container.$enc(c.data, 'data')};

  @override
  String stringify(ContentC self) =>
      'ContentC(data: ${container.asString(self.data)})';
  @override
  int hash(ContentC self) => container.hash(self.data);
  @override
  bool equals(ContentC self, ContentC other) =>
      container.isEqual(self.data, other.data);
}

mixin ContentCMappable {
  String toJson() => ContentCMapper.container.toJson(this as ContentC);
  Map<String, dynamic> toMap() =>
      ContentCMapper.container.toMap(this as ContentC);
  ContentCCopyWith<ContentC, ContentC, ContentC> get copyWith =>
      _ContentCCopyWithImpl(this as ContentC, $identity, $identity);
  @override
  String toString() => ContentCMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ContentCMapper.container.isEqual(this, other));
  @override
  int get hashCode => ContentCMapper.container.hash(this);
}

extension ContentCValueCopy<$R, $Out extends ContentC>
    on ObjectCopyWith<$R, ContentC, $Out> {
  ContentCCopyWith<$R, ContentC, $Out> get asContentC =>
      base.as((v, t, t2) => _ContentCCopyWithImpl(v, t, t2));
}

typedef ContentCCopyWithBound = ContentC;

abstract class ContentCCopyWith<$R, $In extends ContentC, $Out extends ContentC>
    implements ObjectCopyWith<$R, $In, $Out> {
  ContentCCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ContentC>(
      Then<ContentC, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? data});
}

class _ContentCCopyWithImpl<$R, $Out extends ContentC>
    extends CopyWithBase<$R, ContentC, $Out>
    implements ContentCCopyWith<$R, ContentC, $Out> {
  _ContentCCopyWithImpl(super.value, super.then, super.then2);
  @override
  ContentCCopyWith<$R2, ContentC, $Out2> chain<$R2, $Out2 extends ContentC>(
          Then<ContentC, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentCCopyWithImpl($value, t, t2);

  @override
  $R call({String? data}) => $then(ContentC(data ?? $value.data));
}
