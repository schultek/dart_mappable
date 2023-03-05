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

  static A _instantiate(DecodingObject data) {
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
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? a, int? b, double? c, bool? d, B? e});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
}

class _ACopyWithImpl<$R, $Out extends A> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call({String? a, int? b, Object? c = $none, bool? d, Object? e = $none}) =>
      $apply(FieldCopyWithData({
        if (a != null) #a: a,
        if (b != null) #b: b,
        if (c != $none) #c: c,
        if (d != null) #d: d,
        if (e != $none) #e: e
      }));
  @override
  A $make(CopyWithData data) => A(data.get(#a, or: $value.a),
      b: data.get(#b, or: $value.b),
      c: data.get(#c, or: $value.c),
      d: data.get(#d, or: $value.d),
      e: data.get(#e, or: $value.e));

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);
}

class BMapper extends EnumMapper<B> {
  BMapper._();
  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
    }
    return _instance!;
  }

  static B fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  B decode(dynamic value) {
    switch (value) {
      case 'a':
        return B.a;
      case 'bB':
        return B.bB;
      case 'ccCc':
        return B.ccCc;
      default:
        return B.values[0];
    }
  }

  @override
  dynamic encode(B self) {
    switch (self) {
      case B.a:
        return 'a';
      case B.bB:
        return 'bB';
      case B.ccCc:
        return 'ccCc';
    }
  }
}

extension BMapperExtension on B {
  String toValue() {
    BMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
