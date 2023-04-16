// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'unmapped_props_hook_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'A';

  static Map<String, dynamic> _$unmappedProps(A v) => v.unmappedProps;
  static const Field<A, Map<String, dynamic>> _f$unmappedProps =
      Field('unmappedProps', _$unmappedProps);
  static String? _$a(A v) => v.a;
  static const Field<A, String?> _f$a = Field('a', _$a);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #unmappedProps: _f$unmappedProps,
    #a: _f$a,
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$unmappedProps), data.dec(_f$a));
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

extension AValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps;
  $R call({Map<String, dynamic>? unmappedProps, String? a});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
}

class _ACopyWithImpl<$R, $Out extends A> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps => MapCopyWith(
          $value.unmappedProps,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(unmappedProps: v));
  @override
  $R call({Map<String, dynamic>? unmappedProps, Object? a = $none}) =>
      $apply(FieldCopyWithData({
        if (unmappedProps != null) #unmappedProps: unmappedProps,
        if (a != $none) #a: a
      }));
  @override
  A $make(CopyWithData data) => A(
      data.get(#unmappedProps, or: $value.unmappedProps),
      data.get(#a, or: $value.a));

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);
}
