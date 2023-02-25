// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'duplicate_names_test.dart';

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
  final String id = 'Box2';
  @override
  Function get typeFactory => <T extends Content>(f) => f<Box<T>>();

  static int _$size(Box v) => v.size;
  static Content _$contents(Box v) => v.contents;
  static dynamic _arg$contents<T extends Content>(f) => f<T>();

  @override
  final Map<Symbol, Field<Box, dynamic>> fields = const {
    #size: Field<Box, int>('size', _$size),
    #contents: Field<Box, Content>('contents', _$contents, arg: _arg$contents),
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
  $R call({int? size, T? contents});
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
  $R call({int? size, T? contents}) => $apply(FieldCopyWithData({
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

class ContentMapper extends ClassMapperBase<Content> {
  ContentMapper._();
  static ContentMapper? _instance;
  static ContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Content';

  static String _$data(Content v) => v.data;

  @override
  final Map<Symbol, Field<Content, dynamic>> fields = const {
    #data: Field<Content, String>('data', _$data),
  };

  static Content _instantiate(DecodingData data) {
    return Content(data.get(#data));
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
  $R call({String? data});
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
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Content $make(CopyWithData data) => Content(data.get(#data, or: $value.data));

  @override
  ContentCopyWith<$R2, Content, $Out2> $chain<$R2, $Out2 extends Content>(
          Then<Content, $Out2> t, Then<$Out2, $R2> t2) =>
      _ContentCopyWithImpl($value, t, t2);
}
