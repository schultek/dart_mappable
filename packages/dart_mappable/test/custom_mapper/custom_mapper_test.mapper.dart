// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'custom_mapper_test.dart';

class TestObjMapper extends MapperBase<TestObj> {
  static MapperContainer container = MapperContainer(
    mappers: {TestObjMapper(), BigIntMapper()},
  );

  @override
  TestObjMapperElement createElement(MapperContainer container) {
    return TestObjMapperElement._(this, container);
  }

  @override
  String get id => 'TestObj';

  static final fromMap = container.fromMap<TestObj>;
  static final fromJson = container.fromJson<TestObj>;
}

class TestObjMapperElement extends MapperElementBase<TestObj> {
  TestObjMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  TestObj decode(dynamic v) =>
      const UnmappedPropertiesHook('unmappedProps').decode(
          v,
          (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
          container);
  TestObj fromMap(Map<String, dynamic> map) => TestObj.explicit(
      container.$getOpt(map, 'x'), container.$get(map, 'unmappedProps'));

  @override
  Function get encoder => encode;
  dynamic encode(TestObj v) => const UnmappedPropertiesHook('unmappedProps')
      .encode<TestObj>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(TestObj t) => {
        'x': container.$enc(t.x, 'x'),
        'unmappedProps': container.$enc(t.unmappedProps, 'unmappedProps')
      };

  @override
  String stringify(TestObj self) =>
      'TestObj(x: ${container.asString(self.x)}, unmappedProps: ${container.asString(self.unmappedProps)})';
  @override
  int hash(TestObj self) =>
      container.hash(self.x) ^ container.hash(self.unmappedProps);
  @override
  bool equals(TestObj self, TestObj other) =>
      container.isEqual(self.x, other.x) &&
      container.isEqual(self.unmappedProps, other.unmappedProps);
}

mixin TestObjMappable {
  String toJson() => TestObjMapper.container.toJson(this as TestObj);
  Map<String, dynamic> toMap() =>
      TestObjMapper.container.toMap(this as TestObj);
  TestObjCopyWith<TestObj, TestObj, TestObj> get copyWith =>
      _TestObjCopyWithImpl(this as TestObj, $identity, $identity);
  @override
  String toString() => TestObjMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          TestObjMapper.container.isEqual(this, other));
  @override
  int get hashCode => TestObjMapper.container.hash(this);
}

extension TestObjValueCopy<$R, $Out extends TestObj>
    on ObjectCopyWith<$R, TestObj, $Out> {
  TestObjCopyWith<$R, TestObj, $Out> get asTestObj =>
      base.as((v, t, t2) => _TestObjCopyWithImpl(v, t, t2));
}

typedef TestObjCopyWithBound = TestObj;

abstract class TestObjCopyWith<$R, $In extends TestObj, $Out extends TestObj>
    implements ObjectCopyWith<$R, $In, $Out> {
  TestObjCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends TestObj>(
      Then<TestObj, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps;
  $R call({BigInt? x, Map<String, dynamic>? unmappedProps});
}

class _TestObjCopyWithImpl<$R, $Out extends TestObj>
    extends CopyWithBase<$R, TestObj, $Out>
    implements TestObjCopyWith<$R, TestObj, $Out> {
  _TestObjCopyWithImpl(super.value, super.then, super.then2);
  @override
  TestObjCopyWith<$R2, TestObj, $Out2> chain<$R2, $Out2 extends TestObj>(
          Then<TestObj, $Out2> t, Then<$Out2, $R2> t2) =>
      _TestObjCopyWithImpl($value, t, t2);

  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps => MapCopyWith(
          $value.unmappedProps,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(unmappedProps: v));
  @override
  $R call({Object? x = $none, Map<String, dynamic>? unmappedProps}) => $then(
      TestObj.explicit(or(x, $value.x), unmappedProps ?? $value.unmappedProps));
}
