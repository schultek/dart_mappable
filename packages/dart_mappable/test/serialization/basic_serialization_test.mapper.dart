// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic_serialization_test.dart';

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'A';

  static String _$a(A v) => v.a;
  static int _$b(A v) => v.b;
  static double? _$c(A v) => v.c;
  static bool _$d(A v) => v.d;
  static B? _$e(A v) => v.e;

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #a: Field<A, String>('a', _$a),
    #b: Field<A, int>('b', _$b, opt: true, def: 0),
    #c: Field<A, double?>('c', _$c, opt: true),
    #d: Field<A, bool>('d', _$d),
    #e: Field<A, B?>('e', _$e, opt: true),
  };

  static A _instantiate(DecodingData data) {
    return A(data.get(#a),
        b: data.get(#b), c: data.get(#c), d: data.get(#d), e: data.get(#e));
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
  ACopyWith<$R, A, $Out> get asA =>
      base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? a, int? b, double? c, bool? d, B? e});
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call({String? a, int? b, Object? c = $none, bool? d, Object? e = $none}) =>
      $then(A(a ?? $value.a,
          b: b ?? $value.b,
          c: or(c, $value.c),
          d: d ?? $value.d,
          e: or(e, $value.e)));
}
