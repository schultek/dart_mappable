// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'duplicate_names_test.dart';

class BoxMapper extends MapperBase<Box> {
  static MapperContainer container = MapperContainer(
    mappers: {BoxMapper()},
  )..linkAll({ContentMapper.container});

  @override
  BoxMapperElement createElement(MapperContainer container) {
    return BoxMapperElement._(this, container);
  }

  @override
  String get id => 'Box2';
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
  $R call({int? size, T? contents});
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
  $R call({int? size, T? contents}) =>
      $then(Box(size ?? $value.size, contents: contents ?? $value.contents));
}

class ContentMapper extends MapperBase<Content> {
  static MapperContainer container = MapperContainer(
    mappers: {ContentMapper()},
  );

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
  Content fromMap(Map<String, dynamic> map) =>
      Content(container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode(Content v) => toMap(v);
  Map<String, dynamic> toMap(Content c) =>
      {'data': container.$enc(c.data, 'data')};

  @override
  String stringify(Content self) =>
      'Content(data: ${container.asString(self.data)})';
  @override
  int hash(Content self) => container.hash(self.data);
  @override
  bool equals(Content self, Content other) =>
      container.isEqual(self.data, other.data);
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
  $R call({String? data});
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
  $R call({String? data}) => $then(Content(data ?? $value.data));
}
