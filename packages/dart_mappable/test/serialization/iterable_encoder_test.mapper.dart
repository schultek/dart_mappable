// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'iterable_encoder_test.dart';

class FoobarMapper extends ClassMapperBase<Foobar> {
  FoobarMapper._();

  static FoobarMapper? _instance;
  static FoobarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FoobarMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Foobar';

  static int _$id(Foobar v) => v.id;
  static const Field<Foobar, int> _f$id = Field('id', _$id);
  static String _$name(Foobar v) => v.name;
  static const Field<Foobar, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Foobar> fields = const {#id: _f$id, #name: _f$name};

  static Foobar _instantiate(DecodingData data) {
    return Foobar(data.dec(_f$id), data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Foobar fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Foobar>(map);
  }

  static Foobar fromJson(String json) {
    return ensureInitialized().decodeJson<Foobar>(json);
  }
}
mixin FoobarMappable {
  String toJson() {
    return FoobarMapper.ensureInitialized().encodeJson<Foobar>(this as Foobar);
  }

  Map<String, dynamic> toMap() {
    return FoobarMapper.ensureInitialized().encodeMap<Foobar>(this as Foobar);
  }

  FoobarCopyWith<Foobar, Foobar, Foobar> get copyWith =>
      _FoobarCopyWithImpl<Foobar, Foobar>(this as Foobar, $identity, $identity);
  @override
  String toString() {
    return FoobarMapper.ensureInitialized().stringifyValue(this as Foobar);
  }

  @override
  bool operator ==(Object other) {
    return FoobarMapper.ensureInitialized().equalsValue(this as Foobar, other);
  }

  @override
  int get hashCode {
    return FoobarMapper.ensureInitialized().hashValue(this as Foobar);
  }
}

extension FoobarValueCopy<$R, $Out> on ObjectCopyWith<$R, Foobar, $Out> {
  FoobarCopyWith<$R, Foobar, $Out> get $asFoobar =>
      $base.as((v, t, t2) => _FoobarCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FoobarCopyWith<$R, $In extends Foobar, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  FoobarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FoobarCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Foobar, $Out>
    implements FoobarCopyWith<$R, Foobar, $Out> {
  _FoobarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Foobar> $mapper = FoobarMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(
    FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}),
  );
  @override
  Foobar $make(CopyWithData data) =>
      Foobar(data.get(#id, or: $value.id), data.get(#name, or: $value.name));

  @override
  FoobarCopyWith<$R2, Foobar, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FoobarCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
