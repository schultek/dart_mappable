// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recursive_generics_test.dart';

class ComparableBoxMapper extends ClassMapperBase<ComparableBox> {
  ComparableBoxMapper._();

  static ComparableBoxMapper? _instance;
  static ComparableBoxMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Comparable>(<T>(f) => f<Comparable<T>>());
      MapperContainer.globals.use(_instance = ComparableBoxMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ComparableBox';
  @override
  Function get typeFactory => <T extends Comparable>(f) =>
      <T>[] is List<Comparable<T>> ? _typeFactory<T>(f) : f<ComparableBox>();
  final Function _typeFactory =
      <T extends Comparable<T>>(f) => f<ComparableBox<T>>();

  static Comparable<Object?> _$value(ComparableBox v) => v.value;
  static dynamic _arg$value<T extends Comparable<T>>(f) => f<T>();
  static const Field<ComparableBox, Comparable<Object?>> _f$value =
      Field('value', _$value, arg: _arg$value);

  @override
  final MappableFields<ComparableBox> fields = const {
    #value: _f$value,
  };

  static ComparableBox<T> _instantiate<T extends Comparable<T>>(
      DecodingData data) {
    return ComparableBox(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static ComparableBox<T> fromMap<T extends Comparable<T>>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ComparableBox<T>>(map);
  }

  static ComparableBox<T> fromJson<T extends Comparable<T>>(String json) {
    return ensureInitialized().decodeJson<ComparableBox<T>>(json);
  }
}

mixin ComparableBoxMappable<T extends Comparable<T>> {
  String toJson() {
    return ComparableBoxMapper.ensureInitialized()
        .encodeJson<ComparableBox<T>>(this as ComparableBox<T>);
  }

  Map<String, dynamic> toMap() {
    return ComparableBoxMapper.ensureInitialized()
        .encodeMap<ComparableBox<T>>(this as ComparableBox<T>);
  }

  ComparableBoxCopyWith<ComparableBox<T>, ComparableBox<T>, ComparableBox<T>, T>
      get copyWith =>
          _ComparableBoxCopyWithImpl<ComparableBox<T>, ComparableBox<T>, T>(
              this as ComparableBox<T>, $identity, $identity);
  @override
  String toString() {
    return ComparableBoxMapper.ensureInitialized()
        .stringifyValue(this as ComparableBox<T>);
  }

  @override
  bool operator ==(Object other) {
    return ComparableBoxMapper.ensureInitialized()
        .equalsValue(this as ComparableBox<T>, other);
  }

  @override
  int get hashCode {
    return ComparableBoxMapper.ensureInitialized()
        .hashValue(this as ComparableBox<T>);
  }
}

extension ComparableBoxValueCopy<$R, $Out, T extends Comparable<T>>
    on ObjectCopyWith<$R, ComparableBox<T>, $Out> {
  ComparableBoxCopyWith<$R, ComparableBox<T>, $Out, T> get $asComparableBox =>
      $base.as((v, t, t2) => _ComparableBoxCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class ComparableBoxCopyWith<$R, $In extends ComparableBox<T>, $Out,
    T extends Comparable<T>> implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? value});
  ComparableBoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ComparableBoxCopyWithImpl<$R, $Out, T extends Comparable<T>>
    extends ClassCopyWithBase<$R, ComparableBox<T>, $Out>
    implements ComparableBoxCopyWith<$R, ComparableBox<T>, $Out, T> {
  _ComparableBoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ComparableBox> $mapper =
      ComparableBoxMapper.ensureInitialized();
  @override
  $R call({T? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  ComparableBox<T> $make(CopyWithData data) =>
      ComparableBox(data.get(#value, or: $value.value));

  @override
  ComparableBoxCopyWith<$R2, ComparableBox<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ComparableBoxCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
