// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generic.dart';

class BoxCMapper extends ClassMapperBase<BoxC> {
  static final BoxCMapper instance = BoxCMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance);

  @override
  String get id => 'BoxC';
  @override
  Function get typeFactory => <T>(f) => f<BoxC<T>>();

  static dynamic _$content(BoxC v) => v.content;
  static dynamic _arg$content<T>(f) => f<T>();

  @override
  final Map<Symbol, Field<BoxC, dynamic>> fields = const {
    #content: Field<BoxC, dynamic>('content', _$content, arg: _arg$content),
  };

  static BoxC<T> _instantiate<T>(DecodingData data) {
    return BoxC(content: data.get(#content));
  }
  @override
  final Function instantiate = _instantiate;

  static BoxC<T> fromMap<T>(Map<String, dynamic> map) => container.fromMap<BoxC<T>>(map);
  static BoxC<T> fromJson<T>(String json) => container.fromJson<BoxC<T>>(json);
}

mixin BoxCMappable<T> {
  String toJson() => BoxCMapper.container.toJson(this as BoxC<T>);
  Map<String, dynamic> toMap() => BoxCMapper.container.toMap(this as BoxC<T>);
  BoxCCopyWith<BoxC<T>, BoxC<T>, BoxC<T>, T> get copyWith => _BoxCCopyWithImpl(this as BoxC<T>, $identity, $identity);
  @override String toString() => BoxCMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && BoxCMapper.container.isEqual(this, other));
  @override int get hashCode => BoxCMapper.container.hash(this);
}

extension BoxCValueCopy<$R, $Out extends BoxC, T> on ObjectCopyWith<$R, BoxC<T>, $Out> {
  BoxCCopyWith<$R, BoxC<T>, $Out, T> get asBoxC => base.as((v, t, t2) => _BoxCCopyWithImpl(v, t, t2));
}

typedef BoxCCopyWithBound = BoxC;
abstract class BoxCCopyWith<$R, $In extends BoxC<T>, $Out extends BoxC, T> implements ObjectCopyWith<$R, $In, $Out> {
  BoxCCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends BoxC>(Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call({T? content});
}

class _BoxCCopyWithImpl<$R, $Out extends BoxC, T> extends CopyWithBase<$R, BoxC<T>, $Out> implements BoxCCopyWith<$R, BoxC<T>, $Out, T> {
  _BoxCCopyWithImpl(super.value, super.then, super.then2);
  @override BoxCCopyWith<$R2, BoxC<T>, $Out2, T> chain<$R2, $Out2 extends BoxC>(Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2) => _BoxCCopyWithImpl($value, t, t2);

  @override $R call({T? content}) => $then(BoxC(content: content ?? $value.content));
}

class ContentCMapper extends ClassMapperBase<ContentC> {
  static final ContentCMapper instance = ContentCMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance);

  @override
  String get id => 'ContentC';

  static String _$data(ContentC v) => v.data;

  @override
  final Map<Symbol, Field<ContentC, dynamic>> fields = const {
    #data: Field<ContentC, String>('data', _$data),
  };

  static ContentC _instantiate(DecodingData data) {
    return ContentC(data.get(#data));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<ContentC>;
  static final fromJson = container.fromJson<ContentC>;
}

mixin ContentCMappable {
  String toJson() => ContentCMapper.container.toJson(this as ContentC);
  Map<String, dynamic> toMap() => ContentCMapper.container.toMap(this as ContentC);
  ContentCCopyWith<ContentC, ContentC, ContentC> get copyWith => _ContentCCopyWithImpl(this as ContentC, $identity, $identity);
  @override String toString() => ContentCMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ContentCMapper.container.isEqual(this, other));
  @override int get hashCode => ContentCMapper.container.hash(this);
}

extension ContentCValueCopy<$R, $Out extends ContentC> on ObjectCopyWith<$R, ContentC, $Out> {
  ContentCCopyWith<$R, ContentC, $Out> get asContentC => base.as((v, t, t2) => _ContentCCopyWithImpl(v, t, t2));
}

typedef ContentCCopyWithBound = ContentC;
abstract class ContentCCopyWith<$R, $In extends ContentC, $Out extends ContentC> implements ObjectCopyWith<$R, $In, $Out> {
  ContentCCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ContentC>(Then<ContentC, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? data});
}

class _ContentCCopyWithImpl<$R, $Out extends ContentC> extends CopyWithBase<$R, ContentC, $Out> implements ContentCCopyWith<$R, ContentC, $Out> {
  _ContentCCopyWithImpl(super.value, super.then, super.then2);
  @override ContentCCopyWith<$R2, ContentC, $Out2> chain<$R2, $Out2 extends ContentC>(Then<ContentC, $Out2> t, Then<$Out2, $R2> t2) => _ContentCCopyWithImpl($value, t, t2);

  @override $R call({String? data}) => $then(ContentC(data ?? $value.data));
}
