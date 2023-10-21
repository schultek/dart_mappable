// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'collection_copy_with_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'A';
  @override
  Function get typeFactory => <T>(f) => f<A<T>>();

  static List<dynamic> _$items(A v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();
  static const Field<A, List<dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #items: _f$items,
  };

  static A<T> _instantiate<T>(DecodingData data) {
    return A(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static A<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A<T>>(map);
  }

  static A<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<A<T>>(json);
  }
}

mixin AMappable<T> {
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
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AMapper.ensureInitialized().isValueEqual(this as A<T>, other));
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A<T>);
  }
}

extension AValueCopy<$R, $Out, T> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  $R call({List<T>? items});
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({List<T>? items}) =>
      $apply(FieldCopyWithData({if (items != null) #items: items}));
  @override
  A<T> $make(CopyWithData data) => A(data.get(#items, or: $value.items));

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
    }
    return _instance!;
  }

  @override
  final String id = 'B';
  @override
  Function get typeFactory => <T>(f) => f<B<T>>();

  static Map<String, dynamic> _$items(B v) => v.items;
  static dynamic _arg$items<T>(f) => f<Map<String, T>>();
  static const Field<B, Map<String, dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {
    #items: _f$items,
  };

  static B<T> _instantiate<T>(DecodingData data) {
    return B(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static B<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<B<T>>(map);
  }

  static B<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<B<T>>(json);
  }
}

mixin BMappable<T> {
  String toJson() {
    return BMapper.ensureInitialized().encodeJson<B<T>>(this as B<T>);
  }

  Map<String, dynamic> toMap() {
    return BMapper.ensureInitialized().encodeMap<B<T>>(this as B<T>);
  }

  BCopyWith<B<T>, B<T>, B<T>, T> get copyWith =>
      _BCopyWithImpl(this as B<T>, $identity, $identity);
  @override
  String toString() {
    return BMapper.ensureInitialized().stringifyValue(this as B<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BMapper.ensureInitialized().isValueEqual(this as B<T>, other));
  }

  @override
  int get hashCode {
    return BMapper.ensureInitialized().hashValue(this as B<T>);
  }
}

extension BValueCopy<$R, $Out, T> on ObjectCopyWith<$R, B<T>, $Out> {
  BCopyWith<$R, B<T>, $Out, T> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R, $In extends B<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, T, ObjectCopyWith<$R, T, T>> get items;
  $R call({Map<String, T>? items});
  BCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, B<T>, $Out>
    implements BCopyWith<$R, B<T>, $Out, T> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, T, ObjectCopyWith<$R, T, T>> get items => MapCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({Map<String, T>? items}) =>
      $apply(FieldCopyWithData({if (items != null) #items: items}));
  @override
  B<T> $make(CopyWithData data) => B(data.get(#items, or: $value.items));

  @override
  BCopyWith<$R2, B<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}
