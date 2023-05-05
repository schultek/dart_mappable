// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic_serialization_test.dart';

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
  static const Field<A, String> _f$a = Field('a', _$a);
  static int _$b(A v) => v.b;
  static const Field<A, int> _f$b = Field('b', _$b, opt: true, def: 0);
  static double? _$c(A v) => v.c;
  static const Field<A, double> _f$c = Field('c', _$c, opt: true);
  static bool _$d(A v) => v.d;
  static const Field<A, bool> _f$d = Field('d', _$d);
  static B? _$e(A v) => v.e;
  static const Field<A, B> _f$e = Field('e', _$e, opt: true);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #a: _f$a,
    #b: _f$b,
    #c: _f$c,
    #d: _f$d,
    #e: _f$e,
  };

  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$a),
        b: data.dec(_f$b),
        c: data.dec(_f$c),
        d: data.dec(_f$d),
        e: data.dec(_f$e));
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
  $R call({String? a, int? b, double? c, bool? d, B? e});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
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
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}
