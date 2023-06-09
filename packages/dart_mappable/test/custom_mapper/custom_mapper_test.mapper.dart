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
      MapperContainer.globals.useAll([BigIntMapper(), ...privateMappers]);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'TestObj';

  static BigInt? _$x(TestObj v) => v.x;
  static const Field<TestObj, BigInt> _f$x = Field('x', _$x);
  static Map<String, dynamic> _$unmappedProps(TestObj v) => v.unmappedProps;
  static const Field<TestObj, Map<String, dynamic>> _f$unmappedProps =
      Field('unmappedProps', _$unmappedProps);

  @override
  final Map<Symbol, Field<TestObj, dynamic>> fields = const {
    #x: _f$x,
    #unmappedProps: _f$unmappedProps,
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static TestObj _instantiate(DecodingData data) {
    return TestObj.explicit(data.dec(_f$x), data.dec(_f$unmappedProps));
  }

  @override
  final Function instantiate = _instantiate;

  static TestObj fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TestObj>(map);
  }

  static TestObj fromJson(String json) {
    return ensureInitialized().decodeJson<TestObj>(json);
  }
}

mixin TestObjMappable {
  String toJson() {
    return TestObjMapper.ensureInitialized()
        .encodeJson<TestObj>(this as TestObj);
  }

  Map<String, dynamic> toMap() {
    return TestObjMapper.ensureInitialized()
        .encodeMap<TestObj>(this as TestObj);
  }

  TestObjCopyWith<TestObj, TestObj, TestObj> get copyWith =>
      _TestObjCopyWithImpl(this as TestObj, $identity, $identity);
  @override
  String toString() {
    return TestObjMapper.ensureInitialized().stringifyValue(this as TestObj);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TestObjMapper.ensureInitialized()
                .isValueEqual(this as TestObj, other));
  }

  @override
  int get hashCode {
    return TestObjMapper.ensureInitialized().hashValue(this as TestObj);
  }
}

extension TestObjValueCopy<$R, $Out> on ObjectCopyWith<$R, TestObj, $Out> {
  TestObjCopyWith<$R, TestObj, $Out> get $asTestObj =>
      $base.as((v, t, t2) => _TestObjCopyWithImpl(v, t, t2));
}

abstract class TestObjCopyWith<$R, $In extends TestObj, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps;
  $R call({BigInt? x, Map<String, dynamic>? unmappedProps});
  TestObjCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TestObjCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TestObj, $Out>
    implements TestObjCopyWith<$R, TestObj, $Out> {
  _TestObjCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TestObj> $mapper =
      TestObjMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps => MapCopyWith(
          $value.unmappedProps,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(unmappedProps: v));
  @override
  $R call({Object? x = $none, Map<String, dynamic>? unmappedProps}) =>
      $apply(FieldCopyWithData({
        if (x != $none) #x: x,
        if (unmappedProps != null) #unmappedProps: unmappedProps
      }));
  @override
  TestObj $make(CopyWithData data) => TestObj.explicit(
      data.get(#x, or: $value.x),
      data.get(#unmappedProps, or: $value.unmappedProps));

  @override
  TestObjCopyWith<$R2, TestObj, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TestObjCopyWithImpl($value, $cast, t);
}
