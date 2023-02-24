// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'selective_generation_test.dart';

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

  static String _$a(A v) => v.a;

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #a: Field<A, String>('a', _$a),
  };

  static A _instantiate(DecodingData data) {
    return A(data.get(#a));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin AMappable {
  String toJson() {
    AMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as A);
  }

  Map<String, dynamic> toMap() {
    AMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as A);
  }

  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
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
  $R call({String? a});
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call({String? a}) => $then(A(a ?? $value.a));
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

  static String _$b(B v) => v.b;

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {
    #b: Field<B, String>('b', _$b),
  };

  static B _instantiate(DecodingData data) {
    return B(data.get(#b));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin BMappable {
  @override
  String toString() {
    BMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }

  @override
  bool operator ==(Object other) {
    BMapper.ensureInitialized();
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MapperContainer.globals.isEqual(this, other));
  }

  @override
  int get hashCode {
    BMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}
