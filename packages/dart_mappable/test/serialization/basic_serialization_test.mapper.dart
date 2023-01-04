// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic_serialization_test.dart';

class AMapper extends MapperBase<A> {
  static MapperContainer container = MapperContainer(
    mappers: {AMapper()},
  );

  @override
  AMapperElement createElement(MapperContainer container) {
    return AMapperElement._(this, container);
  }

  @override
  String get id => 'A';

  static final fromMap = container.fromMap<A>;
  static final fromJson = container.fromJson<A>;
}

class AMapperElement extends MapperElementBase<A> {
  AMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  A decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  A fromMap(Map<String, dynamic> map) => A(container.$get(map, 'a'),
      b: container.$getOpt(map, 'b') ?? 0,
      c: container.$getOpt(map, 'c'),
      d: container.$get(map, 'd'));

  @override
  Function get encoder => encode;
  dynamic encode(A v) => toMap(v);
  Map<String, dynamic> toMap(A a) => {
        'a': container.$enc(a.a, 'a'),
        'b': container.$enc(a.b, 'b'),
        'c': container.$enc(a.c, 'c'),
        'd': container.$enc(a.d, 'd')
      };

  @override
  String stringify(A self) =>
      'A(a: ${container.asString(self.a)}, b: ${container.asString(self.b)}, c: ${container.asString(self.c)}, d: ${container.asString(self.d)})';
  @override
  int hash(A self) =>
      container.hash(self.a) ^
      container.hash(self.b) ^
      container.hash(self.c) ^
      container.hash(self.d);
  @override
  bool equals(A self, A other) =>
      container.isEqual(self.a, other.a) &&
      container.isEqual(self.b, other.b) &&
      container.isEqual(self.c, other.c) &&
      container.isEqual(self.d, other.d);
}

mixin AMappable {
  String toJson() => AMapper.container.toJson(this as A);
  Map<String, dynamic> toMap() => AMapper.container.toMap(this as A);
  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() => AMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AMapper.container.isEqual(this, other));
  @override
  int get hashCode => AMapper.container.hash(this);
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
  $R call({String? a, int? b, double? c, bool? d});
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call({String? a, int? b, Object? c = $none, bool? d}) => $then(
      A(a ?? $value.a, b: b ?? $value.b, c: or(c, $value.c), d: d ?? $value.d));
}

class BMapper extends EnumMapper<B> {
  static MapperContainer container = MapperContainer(
    mappers: {BMapper()},
  );

  static final fromValue = container.fromValue<B>;

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
  String toValue() => BMapper.container.toValue(this) as String;
}
