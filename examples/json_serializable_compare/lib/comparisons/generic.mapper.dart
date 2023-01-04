// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generic.dart';

class BoxBMapper extends MapperBase<BoxB> {
  static MapperContainer container = MapperContainer(
    mappers: {BoxBMapper()},
  );

  @override
  BoxBMapperElement createElement(MapperContainer container) {
    return BoxBMapperElement._(this, container);
  }

  @override
  String get id => 'BoxB';
  @override
  Function get typeFactory => <T>(f) => f<BoxB<T>>();

  static BoxB<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<BoxB<T>>(map);
  static BoxB<T> fromJson<T>(String json) => container.fromJson<BoxB<T>>(json);
}

class BoxBMapperElement extends MapperElementBase<BoxB> {
  BoxBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BoxB<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  BoxB<T> fromMap<T>(Map<String, dynamic> map) =>
      BoxB(content: container.$get(map, 'content'));

  @override
  Function get encoder => encode;
  dynamic encode<T>(BoxB<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(BoxB<T> b) =>
      {'content': container.$enc(b.content, 'content')};

  @override
  String stringify(BoxB self) =>
      'BoxB(content: ${container.asString(self.content)})';
  @override
  int hash(BoxB self) => container.hash(self.content);
  @override
  bool equals(BoxB self, BoxB other) =>
      container.isEqual(self.content, other.content);
}

mixin BoxBMappable<T> {
  String toJson() => BoxBMapper.container.toJson(this as BoxB<T>);
  Map<String, dynamic> toMap() => BoxBMapper.container.toMap(this as BoxB<T>);
  BoxBCopyWith<BoxB<T>, BoxB<T>, BoxB<T>, T> get copyWith =>
      _BoxBCopyWithImpl(this as BoxB<T>, $identity, $identity);
  @override
  String toString() => BoxBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BoxBMapper.container.isEqual(this, other));
  @override
  int get hashCode => BoxBMapper.container.hash(this);
}

extension BoxBValueCopy<$R, $Out extends BoxB, T>
    on ObjectCopyWith<$R, BoxB<T>, $Out> {
  BoxBCopyWith<$R, BoxB<T>, $Out, T> get asBoxB =>
      base.as((v, t, t2) => _BoxBCopyWithImpl(v, t, t2));
}

typedef BoxBCopyWithBound = BoxB;

abstract class BoxBCopyWith<$R, $In extends BoxB<T>, $Out extends BoxB, T>
    implements ObjectCopyWith<$R, $In, $Out> {
  BoxBCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends BoxB>(
      Then<BoxB<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call({T? content});
}

class _BoxBCopyWithImpl<$R, $Out extends BoxB, T>
    extends CopyWithBase<$R, BoxB<T>, $Out>
    implements BoxBCopyWith<$R, BoxB<T>, $Out, T> {
  _BoxBCopyWithImpl(super.value, super.then, super.then2);
  @override
  BoxBCopyWith<$R2, BoxB<T>, $Out2, T> chain<$R2, $Out2 extends BoxB>(
          Then<BoxB<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BoxBCopyWithImpl($value, t, t2);

  @override
  $R call({T? content}) => $then(BoxB(content: content ?? $value.content));
}

class ContentBMapper extends MapperBase<ContentB> {
  static MapperContainer container = MapperContainer(
    mappers: {ContentBMapper()},
  );

  @override
  ContentBMapperElement createElement(MapperContainer container) {
    return ContentBMapperElement._(this, container);
  }

  @override
  String get id => 'ContentB';

  static final fromMap = container.fromMap<ContentB>;
  static final fromJson = container.fromJson<ContentB>;
}

class ContentBMapperElement extends MapperElementBase<ContentB> {
  ContentBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ContentB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ContentB fromMap(Map<String, dynamic> map) =>
      ContentB(container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode(ContentB v) => toMap(v);
  Map<String, dynamic> toMap(ContentB c) =>
      {'data': container.$enc(c.data, 'data')};

  @override
  String stringify(ContentB self) =>
      'ContentB(data: ${container.asString(self.data)})';
  @override
  int hash(ContentB self) => container.hash(self.data);
  @override
  bool equals(ContentB self, ContentB other) =>
      container.isEqual(self.data, other.data);
}

mixin ContentBMappable {
  String toJson() => ContentBMapper.container.toJson(this as ContentB);
  Map<String, dynamic> toMap() =>
      ContentBMapper.container.toMap(this as ContentB);
  ContentBCopyWith<ContentB, ContentB, ContentB> get copyWith =>
      _ContentBCopyWithImpl(this as ContentB, $identity, $identity);
  @override
  String toString() => ContentBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ContentBMapper.container.isEqual(this, other));
  @override
  int get hashCode => ContentBMapper.container.hash(this);
}

extension ContentBValueCopy<$R, $Out extends ContentB>
    on ObjectCopyWith<$R, ContentB, $Out> {
  ContentBCopyWith<$R, ContentB, $Out> get asContentB =>
      base.as((v, t, t2) => _ContentBCopyWithImpl(v, t, t2));
}

typedef ContentBCopyWithBound = ContentB;

abstract class ContentBCopyWith<$R, $In extends ContentB, $Out extends ContentB>
    implements ObjectCopyWith<$R, $In, $Out> {
  ContentBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ContentB>(
      Then<ContentB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? data});
}

class _ContentBCopyWithImpl<$R, $Out extends ContentB>
    extends CopyWithBase<$R, ContentB, $Out>
    implements ContentBCopyWith<$R, ContentB, $Out> {
  _ContentBCopyWithImpl(super.value, super.then, super.then2);
  @override
  ContentBCopyWith<$R2, ContentB, $Out2> chain<$R2, $Out2 extends ContentB>(
          Then<ContentB, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentBCopyWithImpl($value, t, t2);

  @override
  $R call({String? data}) => $then(ContentB(data ?? $value.data));
}
