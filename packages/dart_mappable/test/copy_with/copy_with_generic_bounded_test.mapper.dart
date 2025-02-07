// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'copy_with_generic_bounded_test.dart';

class ContainerMapper extends ClassMapperBase<Container> {
  ContainerMapper._();

  static ContainerMapper? _instance;
  static ContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerMapper._());
      AMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Container';
  @override
  Function get typeFactory => <T extends A<B>>(f) => f<Container<T>>();

  static A<B> _$content(Container v) => v.content;
  static dynamic _arg$content<T extends A<B>>(f) => f<T>();
  static const Field<Container, A<B>> _f$content =
      Field('content', _$content, arg: _arg$content);

  @override
  final MappableFields<Container> fields = const {
    #content: _f$content,
  };

  static Container<T> _instantiate<T extends A<B>>(DecodingData data) {
    return Container(data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Container<T> fromMap<T extends A<B>>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Container<T>>(map);
  }

  static Container<T> fromJson<T extends A<B>>(String json) {
    return ensureInitialized().decodeJson<Container<T>>(json);
  }
}

mixin ContainerMappable<T extends A<B>> {
  String toJson() {
    return ContainerMapper.ensureInitialized()
        .encodeJson<Container<T>>(this as Container<T>);
  }

  Map<String, dynamic> toMap() {
    return ContainerMapper.ensureInitialized()
        .encodeMap<Container<T>>(this as Container<T>);
  }

  ContainerCopyWith<Container<T>, Container<T>, Container<T>, T> get copyWith =>
      _ContainerCopyWithImpl(this as Container<T>, $identity, $identity);
  @override
  String toString() {
    return ContainerMapper.ensureInitialized()
        .stringifyValue(this as Container<T>);
  }

  @override
  bool operator ==(Object other) {
    return ContainerMapper.ensureInitialized()
        .equalsValue(this as Container<T>, other);
  }

  @override
  int get hashCode {
    return ContainerMapper.ensureInitialized().hashValue(this as Container<T>);
  }
}

extension ContainerValueCopy<$R, $Out, T extends A<B>>
    on ObjectCopyWith<$R, Container<T>, $Out> {
  ContainerCopyWith<$R, Container<T>, $Out, T> get $asContainer =>
      $base.as((v, t, t2) => _ContainerCopyWithImpl(v, t, t2));
}

abstract class ContainerCopyWith<$R, $In extends Container<T>, $Out,
    T extends A<B>> implements ClassCopyWith<$R, $In, $Out> {
  ACopyWith<$R, A<B>, T, B> get content;
  $R call({T? content});
  ContainerCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContainerCopyWithImpl<$R, $Out, T extends A<B>>
    extends ClassCopyWithBase<$R, Container<T>, $Out>
    implements ContainerCopyWith<$R, Container<T>, $Out, T> {
  _ContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Container> $mapper =
      ContainerMapper.ensureInitialized();
  @override
  ACopyWith<$R, A<B>, T, B> get content =>
      $value.content.copyWith.$chain((v) => call(content: v));
  @override
  $R call({T? content}) =>
      $apply(FieldCopyWithData({if (content != null) #content: content}));
  @override
  Container<T> $make(CopyWithData data) =>
      Container(data.get(#content, or: $value.content));

  @override
  ContainerCopyWith<$R2, Container<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ContainerCopyWithImpl($value, $cast, t);
}

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'A';
  @override
  Function get typeFactory => <T extends B>(f) => f<A<T>>();

  static B _$b(A v) => v.b;
  static dynamic _arg$b<T extends B>(f) => f<T>();
  static const Field<A, B> _f$b = Field('b', _$b, arg: _arg$b);

  @override
  final MappableFields<A> fields = const {
    #b: _f$b,
  };

  static A<T> _instantiate<T extends B>(DecodingData data) {
    return A(data.dec(_f$b));
  }

  @override
  final Function instantiate = _instantiate;

  static A<T> fromMap<T extends B>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A<T>>(map);
  }

  static A<T> fromJson<T extends B>(String json) {
    return ensureInitialized().decodeJson<A<T>>(json);
  }
}

mixin AMappable<T extends B> {
  String toJson() {
    return AMapper.ensureInitialized().encodeJson<A<T>>(this as A<T>);
  }

  Map<String, dynamic> toMap() {
    return AMapper.ensureInitialized().encodeMap<A<T>>(this as A<T>);
  }

  ACopyWith<A<T>, A<T>, A<T>, T> get copyWith =>
      _ACopyWithImpl(this as A<T>, $identity, $identity);
  @override
  String toString() {
    return AMapper.ensureInitialized().stringifyValue(this as A<T>);
  }

  @override
  bool operator ==(Object other) {
    return AMapper.ensureInitialized().equalsValue(this as A<T>, other);
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A<T>);
  }
}

extension AValueCopy<$R, $Out, T extends B> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A<T>, $Out, T extends B>
    implements ClassCopyWith<$R, $In, $Out> {
  BCopyWith<$R, B, T> get b;
  $R call({T? b});
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T extends B>
    extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  BCopyWith<$R, B, T> get b => $value.b.copyWith.$chain((v) => call(b: v));
  @override
  $R call({T? b}) => $apply(FieldCopyWithData({if (b != null) #b: b}));
  @override
  A<T> $make(CopyWithData data) => A(data.get(#b, or: $value.b));

  @override
  ACopyWith<$R2, A<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class BMapper extends ClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
      B2Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'B';

  static String _$b(B v) => v.b;
  static const Field<B, String> _f$b = Field('b', _$b);

  @override
  final MappableFields<B> fields = const {
    #b: _f$b,
  };

  static B _instantiate(DecodingData data) {
    return B(data.dec(_f$b));
  }

  @override
  final Function instantiate = _instantiate;

  static B fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<B>(map);
  }

  static B fromJson(String json) {
    return ensureInitialized().decodeJson<B>(json);
  }
}

mixin BMappable {
  String toJson() {
    return BMapper.ensureInitialized().encodeJson<B>(this as B);
  }

  Map<String, dynamic> toMap() {
    return BMapper.ensureInitialized().encodeMap<B>(this as B);
  }

  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() {
    return BMapper.ensureInitialized().stringifyValue(this as B);
  }

  @override
  bool operator ==(Object other) {
    return BMapper.ensureInitialized().equalsValue(this as B, other);
  }

  @override
  int get hashCode {
    return BMapper.ensureInitialized().hashValue(this as B);
  }
}

extension BValueCopy<$R, $Out> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R, $In extends B, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? b});
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  $R call({String? b}) => $apply(FieldCopyWithData({if (b != null) #b: b}));
  @override
  B $make(CopyWithData data) => B(data.get(#b, or: $value.b));

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}

class Container1Mapper extends ClassMapperBase<Container1> {
  Container1Mapper._();

  static Container1Mapper? _instance;
  static Container1Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Container1Mapper._());
      AMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Container1';
  @override
  Function get typeFactory => <T extends A<B>>(f) => f<Container1<T>>();

  static A<B> _$content(Container1 v) => v.content;
  static dynamic _arg$content<T extends A<B>>(f) => f<T>();
  static const Field<Container1, A<B>> _f$content =
      Field('content', _$content, arg: _arg$content);

  @override
  final MappableFields<Container1> fields = const {
    #content: _f$content,
  };

  static Container1<T> _instantiate<T extends A<B>>(DecodingData data) {
    return Container1(data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Container1<T> fromMap<T extends A<B>>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Container1<T>>(map);
  }

  static Container1<T> fromJson<T extends A<B>>(String json) {
    return ensureInitialized().decodeJson<Container1<T>>(json);
  }
}

mixin Container1Mappable<T extends A<B>> {
  String toJson() {
    return Container1Mapper.ensureInitialized()
        .encodeJson<Container1<T>>(this as Container1<T>);
  }

  Map<String, dynamic> toMap() {
    return Container1Mapper.ensureInitialized()
        .encodeMap<Container1<T>>(this as Container1<T>);
  }

  Container1CopyWith<Container1<T>, Container1<T>, Container1<T>, T>
      get copyWith =>
          _Container1CopyWithImpl(this as Container1<T>, $identity, $identity);
  @override
  String toString() {
    return Container1Mapper.ensureInitialized()
        .stringifyValue(this as Container1<T>);
  }

  @override
  bool operator ==(Object other) {
    return Container1Mapper.ensureInitialized()
        .equalsValue(this as Container1<T>, other);
  }

  @override
  int get hashCode {
    return Container1Mapper.ensureInitialized()
        .hashValue(this as Container1<T>);
  }
}

extension Container1ValueCopy<$R, $Out, T extends A<B>>
    on ObjectCopyWith<$R, Container1<T>, $Out> {
  Container1CopyWith<$R, Container1<T>, $Out, T> get $asContainer1 =>
      $base.as((v, t, t2) => _Container1CopyWithImpl(v, t, t2));
}

abstract class Container1CopyWith<$R, $In extends Container1<T>, $Out,
    T extends A<B>> implements ClassCopyWith<$R, $In, $Out> {
  ACopyWith<$R, A<B>, T, B> get content;
  $R call({T? content});
  Container1CopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Container1CopyWithImpl<$R, $Out, T extends A<B>>
    extends ClassCopyWithBase<$R, Container1<T>, $Out>
    implements Container1CopyWith<$R, Container1<T>, $Out, T> {
  _Container1CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Container1> $mapper =
      Container1Mapper.ensureInitialized();
  @override
  ACopyWith<$R, A<B>, T, B> get content =>
      $value.content.copyWith.$chain((v) => call(content: v));
  @override
  $R call({T? content}) =>
      $apply(FieldCopyWithData({if (content != null) #content: content}));
  @override
  Container1<T> $make(CopyWithData data) =>
      Container1(data.get(#content, or: $value.content));

  @override
  Container1CopyWith<$R2, Container1<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Container1CopyWithImpl($value, $cast, t);
}

class Container2Mapper extends ClassMapperBase<Container2> {
  Container2Mapper._();

  static Container2Mapper? _instance;
  static Container2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Container2Mapper._());
      AMapper.ensureInitialized();
      BMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Container2';
  @override
  Function get typeFactory =>
      <T extends A<V>, V extends B>(f) => f<Container2<T, V>>();

  static A<B> _$content(Container2 v) => v.content;
  static dynamic _arg$content<T extends A<V>, V extends B>(f) => f<T>();
  static const Field<Container2, A<B>> _f$content =
      Field('content', _$content, arg: _arg$content);

  @override
  final MappableFields<Container2> fields = const {
    #content: _f$content,
  };

  static Container2<T, V> _instantiate<T extends A<V>, V extends B>(
      DecodingData data) {
    return Container2(data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Container2<T, V> fromMap<T extends A<V>, V extends B>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Container2<T, V>>(map);
  }

  static Container2<T, V> fromJson<T extends A<V>, V extends B>(String json) {
    return ensureInitialized().decodeJson<Container2<T, V>>(json);
  }
}

mixin Container2Mappable<T extends A<V>, V extends B> {
  String toJson() {
    return Container2Mapper.ensureInitialized()
        .encodeJson<Container2<T, V>>(this as Container2<T, V>);
  }

  Map<String, dynamic> toMap() {
    return Container2Mapper.ensureInitialized()
        .encodeMap<Container2<T, V>>(this as Container2<T, V>);
  }

  Container2CopyWith<Container2<T, V>, Container2<T, V>, Container2<T, V>, T, V>
      get copyWith => _Container2CopyWithImpl(
          this as Container2<T, V>, $identity, $identity);
  @override
  String toString() {
    return Container2Mapper.ensureInitialized()
        .stringifyValue(this as Container2<T, V>);
  }

  @override
  bool operator ==(Object other) {
    return Container2Mapper.ensureInitialized()
        .equalsValue(this as Container2<T, V>, other);
  }

  @override
  int get hashCode {
    return Container2Mapper.ensureInitialized()
        .hashValue(this as Container2<T, V>);
  }
}

extension Container2ValueCopy<$R, $Out, T extends A<V>, V extends B>
    on ObjectCopyWith<$R, Container2<T, V>, $Out> {
  Container2CopyWith<$R, Container2<T, V>, $Out, T, V> get $asContainer2 =>
      $base.as((v, t, t2) => _Container2CopyWithImpl(v, t, t2));
}

abstract class Container2CopyWith<$R, $In extends Container2<T, V>, $Out,
    T extends A<V>, V extends B> implements ClassCopyWith<$R, $In, $Out> {
  ACopyWith<$R, A<V>, T, V> get content;
  $R call({T? content});
  Container2CopyWith<$R2, $In, $Out2, T, V> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _Container2CopyWithImpl<$R, $Out, T extends A<V>, V extends B>
    extends ClassCopyWithBase<$R, Container2<T, V>, $Out>
    implements Container2CopyWith<$R, Container2<T, V>, $Out, T, V> {
  _Container2CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Container2> $mapper =
      Container2Mapper.ensureInitialized();
  @override
  ACopyWith<$R, A<V>, T, V> get content =>
      $value.content.copyWith.$chain((v) => call(content: v));
  @override
  $R call({T? content}) =>
      $apply(FieldCopyWithData({if (content != null) #content: content}));
  @override
  Container2<T, V> $make(CopyWithData data) =>
      Container2(data.get(#content, or: $value.content));

  @override
  Container2CopyWith<$R2, Container2<T, V>, $Out2, T, V> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Container2CopyWithImpl($value, $cast, t);
}

class Container3Mapper extends ClassMapperBase<Container3> {
  Container3Mapper._();

  static Container3Mapper? _instance;
  static Container3Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Container3Mapper._());
      A2Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Container3';
  @override
  Function get typeFactory => <T extends A2<dynamic>>(f) => f<Container3<T>>();

  static A2<dynamic> _$content(Container3 v) => v.content;
  static dynamic _arg$content<T extends A2<dynamic>>(f) => f<T>();
  static const Field<Container3, A2<dynamic>> _f$content =
      Field('content', _$content, arg: _arg$content);
  static List<A2<dynamic>> _$contents(Container3 v) => v.contents;
  static dynamic _arg$contents<T extends A2<dynamic>>(f) => f<List<T>>();
  static const Field<Container3, List<A2<dynamic>>> _f$contents =
      Field('contents', _$contents, arg: _arg$contents);

  @override
  final MappableFields<Container3> fields = const {
    #content: _f$content,
    #contents: _f$contents,
  };

  static Container3<T> _instantiate<T extends A2<dynamic>>(DecodingData data) {
    return Container3(data.dec(_f$content), data.dec(_f$contents));
  }

  @override
  final Function instantiate = _instantiate;

  static Container3<T> fromMap<T extends A2<dynamic>>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Container3<T>>(map);
  }

  static Container3<T> fromJson<T extends A2<dynamic>>(String json) {
    return ensureInitialized().decodeJson<Container3<T>>(json);
  }
}

mixin Container3Mappable<T extends A2<dynamic>> {
  String toJson() {
    return Container3Mapper.ensureInitialized()
        .encodeJson<Container3<T>>(this as Container3<T>);
  }

  Map<String, dynamic> toMap() {
    return Container3Mapper.ensureInitialized()
        .encodeMap<Container3<T>>(this as Container3<T>);
  }

  Container3CopyWith<Container3<T>, Container3<T>, Container3<T>, T>
      get copyWith =>
          _Container3CopyWithImpl(this as Container3<T>, $identity, $identity);
  @override
  String toString() {
    return Container3Mapper.ensureInitialized()
        .stringifyValue(this as Container3<T>);
  }

  @override
  bool operator ==(Object other) {
    return Container3Mapper.ensureInitialized()
        .equalsValue(this as Container3<T>, other);
  }

  @override
  int get hashCode {
    return Container3Mapper.ensureInitialized()
        .hashValue(this as Container3<T>);
  }
}

extension Container3ValueCopy<$R, $Out, T extends A2<dynamic>>
    on ObjectCopyWith<$R, Container3<T>, $Out> {
  Container3CopyWith<$R, Container3<T>, $Out, T> get $asContainer3 =>
      $base.as((v, t, t2) => _Container3CopyWithImpl(v, t, t2));
}

abstract class Container3CopyWith<$R, $In extends Container3<T>, $Out,
    T extends A2<dynamic>> implements ClassCopyWith<$R, $In, $Out> {
  A2CopyWith<$R, A2<dynamic>, T, dynamic> get content;
  ListCopyWith<$R, T, A2CopyWith<$R, T, T, dynamic>> get contents;
  $R call({T? content, List<T>? contents});
  Container3CopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Container3CopyWithImpl<$R, $Out, T extends A2<dynamic>>
    extends ClassCopyWithBase<$R, Container3<T>, $Out>
    implements Container3CopyWith<$R, Container3<T>, $Out, T> {
  _Container3CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Container3> $mapper =
      Container3Mapper.ensureInitialized();
  @override
  A2CopyWith<$R, A2<dynamic>, T, dynamic> get content =>
      $value.content.copyWith.$chain((v) => call(content: v));
  @override
  ListCopyWith<$R, T, A2CopyWith<$R, T, T, dynamic>> get contents =>
      ListCopyWith(
          $value.contents,
          (v, t) => (v.copyWith as A2CopyWith<A2, T, T, dynamic>).$chain(t),
          (v) => call(contents: v));
  @override
  $R call({T? content, List<T>? contents}) => $apply(FieldCopyWithData({
        if (content != null) #content: content,
        if (contents != null) #contents: contents
      }));
  @override
  Container3<T> $make(CopyWithData data) => Container3(
      data.get(#content, or: $value.content),
      data.get(#contents, or: $value.contents));

  @override
  Container3CopyWith<$R2, Container3<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Container3CopyWithImpl($value, $cast, t);
}

class A2Mapper extends ClassMapperBase<A2> {
  A2Mapper._();

  static A2Mapper? _instance;
  static A2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = A2Mapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'A2';
  @override
  Function get typeFactory => <T>(f) => f<A2<T>>();

  static dynamic _$t(A2 v) => v.t;
  static dynamic _arg$t<T>(f) => f<T>();
  static const Field<A2, dynamic> _f$t = Field('t', _$t, arg: _arg$t);

  @override
  final MappableFields<A2> fields = const {
    #t: _f$t,
  };

  static A2<T> _instantiate<T>(DecodingData data) {
    return A2(data.dec(_f$t));
  }

  @override
  final Function instantiate = _instantiate;

  static A2<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A2<T>>(map);
  }

  static A2<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<A2<T>>(json);
  }
}

mixin A2Mappable<T> {
  String toJson() {
    return A2Mapper.ensureInitialized().encodeJson<A2<T>>(this as A2<T>);
  }

  Map<String, dynamic> toMap() {
    return A2Mapper.ensureInitialized().encodeMap<A2<T>>(this as A2<T>);
  }

  A2CopyWith<A2<T>, A2<T>, A2<T>, T> get copyWith =>
      _A2CopyWithImpl(this as A2<T>, $identity, $identity);
  @override
  String toString() {
    return A2Mapper.ensureInitialized().stringifyValue(this as A2<T>);
  }

  @override
  bool operator ==(Object other) {
    return A2Mapper.ensureInitialized().equalsValue(this as A2<T>, other);
  }

  @override
  int get hashCode {
    return A2Mapper.ensureInitialized().hashValue(this as A2<T>);
  }
}

extension A2ValueCopy<$R, $Out, T> on ObjectCopyWith<$R, A2<T>, $Out> {
  A2CopyWith<$R, A2<T>, $Out, T> get $asA2 =>
      $base.as((v, t, t2) => _A2CopyWithImpl(v, t, t2));
}

abstract class A2CopyWith<$R, $In extends A2<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? t});
  A2CopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _A2CopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, A2<T>, $Out>
    implements A2CopyWith<$R, A2<T>, $Out, T> {
  _A2CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A2> $mapper = A2Mapper.ensureInitialized();
  @override
  $R call({T? t}) => $apply(FieldCopyWithData({if (t != null) #t: t}));
  @override
  A2<T> $make(CopyWithData data) => A2(data.get(#t, or: $value.t));

  @override
  A2CopyWith<$R2, A2<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _A2CopyWithImpl($value, $cast, t);
}

class Container4Mapper extends ClassMapperBase<Container4> {
  Container4Mapper._();

  static Container4Mapper? _instance;
  static Container4Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Container4Mapper._());
      A2Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Container4';
  @override
  Function get typeFactory => <T extends A2<B>>(f) => f<Container4<T>>();

  static A2<B> _$content(Container4 v) => v.content;
  static dynamic _arg$content<T extends A2<B>>(f) => f<T>();
  static const Field<Container4, A2<B>> _f$content =
      Field('content', _$content, arg: _arg$content);
  static List<A2<B>> _$contents(Container4 v) => v.contents;
  static dynamic _arg$contents<T extends A2<B>>(f) => f<List<T>>();
  static const Field<Container4, List<A2<B>>> _f$contents =
      Field('contents', _$contents, arg: _arg$contents);

  @override
  final MappableFields<Container4> fields = const {
    #content: _f$content,
    #contents: _f$contents,
  };

  static Container4<T> _instantiate<T extends A2<B>>(DecodingData data) {
    return Container4(data.dec(_f$content), data.dec(_f$contents));
  }

  @override
  final Function instantiate = _instantiate;

  static Container4<T> fromMap<T extends A2<B>>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Container4<T>>(map);
  }

  static Container4<T> fromJson<T extends A2<B>>(String json) {
    return ensureInitialized().decodeJson<Container4<T>>(json);
  }
}

mixin Container4Mappable<T extends A2<B>> {
  String toJson() {
    return Container4Mapper.ensureInitialized()
        .encodeJson<Container4<T>>(this as Container4<T>);
  }

  Map<String, dynamic> toMap() {
    return Container4Mapper.ensureInitialized()
        .encodeMap<Container4<T>>(this as Container4<T>);
  }

  Container4CopyWith<Container4<T>, Container4<T>, Container4<T>, T>
      get copyWith =>
          _Container4CopyWithImpl(this as Container4<T>, $identity, $identity);
  @override
  String toString() {
    return Container4Mapper.ensureInitialized()
        .stringifyValue(this as Container4<T>);
  }

  @override
  bool operator ==(Object other) {
    return Container4Mapper.ensureInitialized()
        .equalsValue(this as Container4<T>, other);
  }

  @override
  int get hashCode {
    return Container4Mapper.ensureInitialized()
        .hashValue(this as Container4<T>);
  }
}

extension Container4ValueCopy<$R, $Out, T extends A2<B>>
    on ObjectCopyWith<$R, Container4<T>, $Out> {
  Container4CopyWith<$R, Container4<T>, $Out, T> get $asContainer4 =>
      $base.as((v, t, t2) => _Container4CopyWithImpl(v, t, t2));
}

abstract class Container4CopyWith<$R, $In extends Container4<T>, $Out,
    T extends A2<B>> implements ClassCopyWith<$R, $In, $Out> {
  A2CopyWith<$R, A2<B>, T, B> get content;
  ListCopyWith<$R, T, A2CopyWith<$R, T, T, B>> get contents;
  $R call({T? content, List<T>? contents});
  Container4CopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Container4CopyWithImpl<$R, $Out, T extends A2<B>>
    extends ClassCopyWithBase<$R, Container4<T>, $Out>
    implements Container4CopyWith<$R, Container4<T>, $Out, T> {
  _Container4CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Container4> $mapper =
      Container4Mapper.ensureInitialized();
  @override
  A2CopyWith<$R, A2<B>, T, B> get content =>
      $value.content.copyWith.$chain((v) => call(content: v));
  @override
  ListCopyWith<$R, T, A2CopyWith<$R, T, T, B>> get contents => ListCopyWith(
      $value.contents,
      (v, t) => (v.copyWith as A2CopyWith<A2, T, T, B>).$chain(t),
      (v) => call(contents: v));
  @override
  $R call({T? content, List<T>? contents}) => $apply(FieldCopyWithData({
        if (content != null) #content: content,
        if (contents != null) #contents: contents
      }));
  @override
  Container4<T> $make(CopyWithData data) => Container4(
      data.get(#content, or: $value.content),
      data.get(#contents, or: $value.contents));

  @override
  Container4CopyWith<$R2, Container4<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _Container4CopyWithImpl($value, $cast, t);
}

class B2Mapper extends ClassMapperBase<B2> {
  B2Mapper._();

  static B2Mapper? _instance;
  static B2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = B2Mapper._());
      BMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'B2';

  static String _$b(B2 v) => v.b;
  static const Field<B2, String> _f$b = Field('b', _$b);

  @override
  final MappableFields<B2> fields = const {
    #b: _f$b,
  };

  static B2 _instantiate(DecodingData data) {
    return B2(data.dec(_f$b));
  }

  @override
  final Function instantiate = _instantiate;

  static B2 fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<B2>(map);
  }

  static B2 fromJson(String json) {
    return ensureInitialized().decodeJson<B2>(json);
  }
}

mixin B2Mappable {
  String toJson() {
    return B2Mapper.ensureInitialized().encodeJson<B2>(this as B2);
  }

  Map<String, dynamic> toMap() {
    return B2Mapper.ensureInitialized().encodeMap<B2>(this as B2);
  }

  B2CopyWith<B2, B2, B2> get copyWith =>
      _B2CopyWithImpl(this as B2, $identity, $identity);
  @override
  String toString() {
    return B2Mapper.ensureInitialized().stringifyValue(this as B2);
  }

  @override
  bool operator ==(Object other) {
    return B2Mapper.ensureInitialized().equalsValue(this as B2, other);
  }

  @override
  int get hashCode {
    return B2Mapper.ensureInitialized().hashValue(this as B2);
  }
}

extension B2ValueCopy<$R, $Out> on ObjectCopyWith<$R, B2, $Out> {
  B2CopyWith<$R, B2, $Out> get $asB2 =>
      $base.as((v, t, t2) => _B2CopyWithImpl(v, t, t2));
}

abstract class B2CopyWith<$R, $In extends B2, $Out>
    implements BCopyWith<$R, $In, $Out> {
  @override
  $R call({String? b});
  B2CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _B2CopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B2, $Out>
    implements B2CopyWith<$R, B2, $Out> {
  _B2CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B2> $mapper = B2Mapper.ensureInitialized();
  @override
  $R call({String? b}) => $apply(FieldCopyWithData({if (b != null) #b: b}));
  @override
  B2 $make(CopyWithData data) => B2(data.get(#b, or: $value.b));

  @override
  B2CopyWith<$R2, B2, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _B2CopyWithImpl($value, $cast, t);
}
