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
    return ensureInitialized().decodeMap<BoxC<T>>(map);
  }

  static BoxC<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<BoxC<T>>(json);
  }
}

mixin BoxCMappable<T> {
  String toJson() {
    return BoxCMapper.ensureInitialized().encodeJson<BoxC<T>>(this as BoxC<T>);
  }

  Map<String, dynamic> toMap() {
    return BoxCMapper.ensureInitialized().encodeMap<BoxC<T>>(this as BoxC<T>);
  }

  BoxCCopyWith<BoxC<T>, BoxC<T>, BoxC<T>, T> get copyWith =>
      _BoxCCopyWithImpl(this as BoxC<T>, $identity, $identity);
  @override
  String toString() {
    return BoxCMapper.ensureInitialized().stringifyValue(this as BoxC<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BoxCMapper.ensureInitialized()
                .isValueEqual(this as BoxC<T>, other));
  }

  @override
  int get hashCode {
    return BoxCMapper.ensureInitialized().hashValue(this as BoxC<T>);
  }
}

extension BoxCValueCopy<$R, $Out, T> on ObjectCopyWith<$R, BoxC<T>, $Out> {
  BoxCCopyWith<$R, BoxC<T>, $Out, T> get $asBoxC =>
      $base.as((v, t, t2) => _BoxCCopyWithImpl(v, t, t2));
}

abstract class BoxCCopyWith<$R, $In extends BoxC<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? content});
  BoxCCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCCopyWithImpl<$R, $Out, T>
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
  BoxCCopyWith<$R2, BoxC<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCCopyWithImpl($value, $cast, t);
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
    return ensureInitialized().decodeMap<ContentC>(map);
  }

  static ContentC fromJson(String json) {
    return ensureInitialized().decodeJson<ContentC>(json);
  }
}

mixin ContentCMappable {
  String toJson() {
    return ContentCMapper.ensureInitialized()
        .encodeJson<ContentC>(this as ContentC);
  }

  Map<String, dynamic> toMap() {
    return ContentCMapper.ensureInitialized()
        .encodeMap<ContentC>(this as ContentC);
  }

  ContentCCopyWith<ContentC, ContentC, ContentC> get copyWith =>
      _ContentCCopyWithImpl(this as ContentC, $identity, $identity);
  @override
  String toString() {
    return ContentCMapper.ensureInitialized().stringifyValue(this as ContentC);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContentCMapper.ensureInitialized()
                .isValueEqual(this as ContentC, other));
  }

  @override
  int get hashCode {
    return ContentCMapper.ensureInitialized().hashValue(this as ContentC);
  }
}

extension ContentCValueCopy<$R, $Out> on ObjectCopyWith<$R, ContentC, $Out> {
  ContentCCopyWith<$R, ContentC, $Out> get $asContentC =>
      $base.as((v, t, t2) => _ContentCCopyWithImpl(v, t, t2));
}

abstract class ContentCCopyWith<$R, $In extends ContentC, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  ContentCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContentCCopyWithImpl<$R, $Out>
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
  ContentCCopyWith<$R2, ContentC, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ContentCCopyWithImpl($value, $cast, t);
}
