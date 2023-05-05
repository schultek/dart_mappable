// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generic.dart';

class BoxCMapper extends ClassMapperBase<BoxC> {
  BoxCMapper._();

  static BoxCMapper? _instance;
  static BoxCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxCMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BoxC';
  @override
  Function get typeFactory => <T>(f) => f<BoxC<T>>();

  static dynamic _$content(BoxC v) => v.content;
  static dynamic _arg$content<T>(f) => f<T>();
  static const Field<BoxC, dynamic> _f$content =
      Field('content', _$content, arg: _arg$content);

  @override
  final Map<Symbol, Field<BoxC, dynamic>> fields = const {
    #content: _f$content,
  };

  static BoxC<T> _instantiate<T>(DecodingData data) {
    return BoxC(content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static BoxC<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BoxC<T>>(map));
  }

  static BoxC<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<BoxC<T>>(json));
  }
}

mixin BoxCMappable<T> {
  String toJson() {
    return BoxCMapper._guard((c) => c.toJson(this as BoxC<T>));
  }

  Map<String, dynamic> toMap() {
    return BoxCMapper._guard((c) => c.toMap(this as BoxC<T>));
  }

  BoxCCopyWith<BoxC<T>, BoxC<T>, BoxC<T>, T> get copyWith =>
      _BoxCCopyWithImpl(this as BoxC<T>, $identity, $identity);
  @override
  String toString() {
    return BoxCMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BoxCMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BoxCMapper._guard((c) => c.hash(this));
  }
}

extension BoxCValueCopy<$R, $Out extends BoxC, T>
    on ObjectCopyWith<$R, BoxC<T>, $Out> {
  BoxCCopyWith<$R, BoxC<T>, $Out, T> get $asBoxC =>
      $base.as((v, t, t2) => _BoxCCopyWithImpl(v, t, t2));
}

typedef BoxCCopyWithBound = BoxC;

abstract class BoxCCopyWith<$R, $In extends BoxC<T>, $Out extends BoxC, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? content});
  BoxCCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2 extends BoxC>(
      Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _BoxCCopyWithImpl<$R, $Out extends BoxC, T>
    extends ClassCopyWithBase<$R, BoxC<T>, $Out>
    implements BoxCCopyWith<$R, BoxC<T>, $Out, T> {
  _BoxCCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BoxC> $mapper = BoxCMapper.ensureInitialized();
  @override
  $R call({T? content}) =>
      $apply(FieldCopyWithData({if (content != null) #content: content}));
  @override
  BoxC<T> $make(CopyWithData data) =>
      BoxC(content: data.get(#content, or: $value.content));

  @override
  BoxCCopyWith<$R2, BoxC<T>, $Out2, T> $chain<$R2, $Out2 extends BoxC>(
          Then<BoxC<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BoxCCopyWithImpl($value, t, t2);
}

class ContentCMapper extends ClassMapperBase<ContentC> {
  ContentCMapper._();

  static ContentCMapper? _instance;
  static ContentCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentCMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ContentC';

  static String _$data(ContentC v) => v.data;
  static const Field<ContentC, String> _f$data = Field('data', _$data);

  @override
  final Map<Symbol, Field<ContentC, dynamic>> fields = const {
    #data: _f$data,
  };

  static ContentC _instantiate(DecodingData data) {
    return ContentC(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static ContentC fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ContentC>(map));
  }

  static ContentC fromJson(String json) {
    return _guard((c) => c.fromJson<ContentC>(json));
  }
}

mixin ContentCMappable {
  String toJson() {
    return ContentCMapper._guard((c) => c.toJson(this as ContentC));
  }

  Map<String, dynamic> toMap() {
    return ContentCMapper._guard((c) => c.toMap(this as ContentC));
  }

  ContentCCopyWith<ContentC, ContentC, ContentC> get copyWith =>
      _ContentCCopyWithImpl(this as ContentC, $identity, $identity);
  @override
  String toString() {
    return ContentCMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContentCMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ContentCMapper._guard((c) => c.hash(this));
  }
}

extension ContentCValueCopy<$R, $Out extends ContentC>
    on ObjectCopyWith<$R, ContentC, $Out> {
  ContentCCopyWith<$R, ContentC, $Out> get $asContentC =>
      $base.as((v, t, t2) => _ContentCCopyWithImpl(v, t, t2));
}

typedef ContentCCopyWithBound = ContentC;

abstract class ContentCCopyWith<$R, $In extends ContentC, $Out extends ContentC>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  ContentCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends ContentC>(
      Then<ContentC, $Out2> t, Then<$Out2, $R2> t2);
}

class _ContentCCopyWithImpl<$R, $Out extends ContentC>
    extends ClassCopyWithBase<$R, ContentC, $Out>
    implements ContentCCopyWith<$R, ContentC, $Out> {
  _ContentCCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContentC> $mapper =
      ContentCMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  ContentC $make(CopyWithData data) =>
      ContentC(data.get(#data, or: $value.data));

  @override
  ContentCCopyWith<$R2, ContentC, $Out2> $chain<$R2, $Out2 extends ContentC>(
          Then<ContentC, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentCCopyWithImpl($value, t, t2);
}
