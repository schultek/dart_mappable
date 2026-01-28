// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'with_getters_test.dart';

class ClassWithGettersMapper extends ClassMapperBase<ClassWithGetters> {
  ClassWithGettersMapper._();

  static ClassWithGettersMapper? _instance;
  static ClassWithGettersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClassWithGettersMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClassWithGetters';

  static String _$name(ClassWithGetters v) => v.name;
  static const Field<ClassWithGetters, String> _f$name = Field('name', _$name);
  static int _$count(ClassWithGetters v) => v.count;
  static const Field<ClassWithGetters, int> _f$count = Field('count', _$count);

  @override
  final MappableFields<ClassWithGetters> fields = const {
    #name: _f$name,
    #count: _f$count,
  };

  static ClassWithGetters _instantiate(DecodingData data) {
    return ClassWithGetters(data.dec(_f$name), data.dec(_f$count));
  }

  @override
  final Function instantiate = _instantiate;

  static ClassWithGetters fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClassWithGetters>(map);
  }

  static ClassWithGetters fromJson(String json) {
    return ensureInitialized().decodeJson<ClassWithGetters>(json);
  }
}

mixin ClassWithGettersMappable {
  String toJson() {
    return ClassWithGettersMapper.ensureInitialized()
        .encodeJson<ClassWithGetters>(this as ClassWithGetters);
  }

  Map<String, dynamic> toMap() {
    return ClassWithGettersMapper.ensureInitialized()
        .encodeMap<ClassWithGetters>(this as ClassWithGetters);
  }

  ClassWithGettersCopyWith<ClassWithGetters, ClassWithGetters, ClassWithGetters>
  get copyWith =>
      _ClassWithGettersCopyWithImpl<ClassWithGetters, ClassWithGetters>(
        this as ClassWithGetters,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClassWithGettersMapper.ensureInitialized().stringifyValue(
      this as ClassWithGetters,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClassWithGettersMapper.ensureInitialized().equalsValue(
      this as ClassWithGetters,
      other,
    );
  }

  @override
  int get hashCode {
    return ClassWithGettersMapper.ensureInitialized().hashValue(
      this as ClassWithGetters,
    );
  }
}

extension ClassWithGettersValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClassWithGetters, $Out> {
  ClassWithGettersCopyWith<$R, ClassWithGetters, $Out>
  get $asClassWithGetters =>
      $base.as((v, t, t2) => _ClassWithGettersCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClassWithGettersCopyWith<$R, $In extends ClassWithGetters, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? count});
  ClassWithGettersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ClassWithGettersCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClassWithGetters, $Out>
    implements ClassWithGettersCopyWith<$R, ClassWithGetters, $Out> {
  _ClassWithGettersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClassWithGetters> $mapper =
      ClassWithGettersMapper.ensureInitialized();
  @override
  $R call({String? name, int? count}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (count != null) #count: count,
    }),
  );
  @override
  ClassWithGetters $make(CopyWithData data) => ClassWithGetters(
    data.get(#name, or: $value.name),
    data.get(#count, or: $value.count),
  );

  @override
  ClassWithGettersCopyWith<$R2, ClassWithGetters, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClassWithGettersCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

