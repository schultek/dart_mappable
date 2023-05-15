// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'desync_serialization_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'A';

  static int _$a(A v) => v.a;
  static const Field<A, int> _f$a = Field('a', _$a);
  static int _$b(A v) => v.b;
  static const Field<A, int> _f$b = Field('b', _$b);
  static C _$c(A v) => v.c;
  static const Field<A, C> _f$c = Field('c', _$c);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #a: _f$a,
    #b: _f$b,
    #c: _f$c,
  };

  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$a), data.dec(_f$b), data.dec(_f$c));
  }

  @override
  final Function instantiate = _instantiate;

  static A fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<A>(map));
  }

  static A fromJson(String json) {
    return _guard((c) => c.fromJson<A>(json));
  }
}

mixin AMappable {
  String toJson() {
    return AMapper._guard((c) => c.toJson(this as A));
  }

  Map<String, dynamic> toMap() {
    return AMapper._guard((c) => c.toMap(this as A));
  }

  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() {
    return AMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AMapper._guard((c) => c.hash(this));
  }
}

extension AValueCopy<$R, $Out> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? a});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call({int? a}) => $apply(FieldCopyWithData({if (a != null) #a: a}));
  @override
  A $make(CopyWithData data) => A(data.get(#a, or: $value.a),
      data.get(#b, or: $value.b), data.get(#c, or: $value.c));

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class BMapper extends ClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
      AMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'B';

  static int _$a(B v) => v.a;
  static const Field<B, int> _f$a = Field('a', _$a);
  static int _$d(B v) => v.d;
  static const Field<B, int> _f$d = Field('d', _$d);
  static int _$b(B v) => v.b;
  static const Field<B, int> _f$b = Field('b', _$b);
  static C _$c(B v) => v.c;
  static const Field<B, C> _f$c = Field('c', _$c);

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {
    #a: _f$a,
    #d: _f$d,
    #b: _f$b,
    #c: _f$c,
  };

  static B _instantiate(DecodingData data) {
    return B(data.dec(_f$a), data.dec(_f$d));
  }

  @override
  final Function instantiate = _instantiate;

  static B fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<B>(map));
  }

  static B fromJson(String json) {
    return _guard((c) => c.fromJson<B>(json));
  }
}

mixin BMappable {
  String toJson() {
    return BMapper._guard((c) => c.toJson(this as B));
  }

  Map<String, dynamic> toMap() {
    return BMapper._guard((c) => c.toMap(this as B));
  }

  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() {
    return BMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BMapper._guard((c) => c.hash(this));
  }
}

extension BValueCopy<$R, $Out> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R, $In extends B, $Out>
    implements ACopyWith<$R, $In, $Out> {
  @override
  $R call({int? a, int? d});
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  $R call({int? a, int? d}) =>
      $apply(FieldCopyWithData({if (a != null) #a: a, if (d != null) #d: d}));
  @override
  B $make(CopyWithData data) =>
      B(data.get(#a, or: $value.a), data.get(#d, or: $value.d));

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}

class CMapper extends ClassMapperBase<C> {
  CMapper._();

  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'C';

  static int _$x(C v) => v.x;
  static const Field<C, int> _f$x = Field('x', _$x);

  @override
  final Map<Symbol, Field<C, dynamic>> fields = const {
    #x: _f$x,
  };

  static C _instantiate(DecodingData data) {
    return C(data.dec(_f$x));
  }

  @override
  final Function instantiate = _instantiate;

  static C fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<C>(map));
  }

  static C fromJson(String json) {
    return _guard((c) => c.fromJson<C>(json));
  }
}

mixin CMappable {
  String toJson() {
    return CMapper._guard((c) => c.toJson(this as C));
  }

  Map<String, dynamic> toMap() {
    return CMapper._guard((c) => c.toMap(this as C));
  }

  CCopyWith<C, C, C> get copyWith =>
      _CCopyWithImpl(this as C, $identity, $identity);
  @override
  String toString() {
    return CMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CMapper._guard((c) => c.hash(this));
  }
}

extension CValueCopy<$R, $Out> on ObjectCopyWith<$R, C, $Out> {
  CCopyWith<$R, C, $Out> get $asC =>
      $base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R, $In extends C, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? x});
  CCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, C, $Out>
    implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<C> $mapper = CMapper.ensureInitialized();
  @override
  $R call({int? x}) => $apply(FieldCopyWithData({if (x != null) #x: x}));
  @override
  C $make(CopyWithData data) => C(data.get(#x, or: $value.x));

  @override
  CCopyWith<$R2, C, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CCopyWithImpl($value, $cast, t);
}
