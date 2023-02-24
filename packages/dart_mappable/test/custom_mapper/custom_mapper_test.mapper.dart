// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'custom_mapper_test.dart';

class TestObjMapper extends ClassMapperBase<TestObj> {
  TestObjMapper._();
  static TestObjMapper? _instance;
  static TestObjMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TestObjMapper._());
      MapperContainer.globals.use(BigIntMapper());
    }
    return _instance!;
  }

  @override
  final String id = 'TestObj';

  static BigInt? _$x(TestObj v) => v.x;
  static Map<String, dynamic> _$unmappedProps(TestObj v) => v.unmappedProps;

  @override
  final Map<Symbol, Field<TestObj, dynamic>> fields = const {
    #x: Field<TestObj, BigInt?>('x', _$x),
    #unmappedProps:
        Field<TestObj, Map<String, dynamic>>('unmappedProps', _$unmappedProps),
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static TestObj _instantiate(DecodingData data) {
    return TestObj.explicit(data.get(#x), data.get(#unmappedProps));
  }

  @override
  final Function instantiate = _instantiate;

  static TestObj fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<TestObj>(map);
  }

  static TestObj fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<TestObj>(json);
  }
}

mixin TestObjMappable {
  String toJson() {
    TestObjMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as TestObj);
  }

  Map<String, dynamic> toMap() {
    TestObjMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as TestObj);
  }

  TestObjCopyWith<TestObj, TestObj, TestObj> get copyWith =>
      _TestObjCopyWithImpl(this as TestObj, $identity, $identity);
  @override
  String toString() {
    TestObjMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }

  @override
  bool operator ==(Object other) {
    TestObjMapper.ensureInitialized();
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MapperContainer.globals.isEqual(this, other));
  }

  @override
  int get hashCode {
    TestObjMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
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
