// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'model.dart';

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
  final Map<Symbol, Field<A, dynamic>> fields = const {
  };

  static A _instantiate(DecodingData data) {
    return A();
  }
  @override
  final Function instantiate = _instantiate;

  static A fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<A>(map);
  }
  static A fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<A>(json);
  }
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
  ACopyWith<A, A, A> get copyWith => _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() {
    AMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    AMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    AMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension AValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get asA => base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;
abstract class ACopyWith<$R, $In extends A, $Out extends A> implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(Then<A, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out> implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(Then<A, $Out2> t, Then<$Out2, $R2> t2) => _ACopyWithImpl($value, t, t2);

  @override $R call() => $then(A());
}
