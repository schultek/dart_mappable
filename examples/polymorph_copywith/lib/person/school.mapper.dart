// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'school.dart';

class SchoolMapper extends ClassMapperBase<School> {
  SchoolMapper._();

  static SchoolMapper? _instance;
  static SchoolMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SchoolMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'School';

  static String _$university(School v) => v.university;
  static const Field<School, String> _f$university =
      Field('university', _$university);

  @override
  final Map<Symbol, Field<School, dynamic>> fields = const {
    #university: _f$university,
  };

  static School _instantiate(DecodingData data) {
    return School(university: data.dec(_f$university));
  }

  @override
  final Function instantiate = _instantiate;

  static School fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<School>(map));
  }

  static School fromJson(String json) {
    return _guard((c) => c.fromJson<School>(json));
  }
}

mixin SchoolMappable {
  String toJson() {
    return SchoolMapper._guard((c) => c.toJson(this as School));
  }

  Map<String, dynamic> toMap() {
    return SchoolMapper._guard((c) => c.toMap(this as School));
  }

  SchoolCopyWith<School, School, School> get copyWith =>
      _SchoolCopyWithImpl(this as School, $identity, $identity);
  @override
  String toString() {
    return SchoolMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SchoolMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SchoolMapper._guard((c) => c.hash(this));
  }
}

extension SchoolValueCopy<$R, $Out extends School>
    on ObjectCopyWith<$R, School, $Out> {
  SchoolCopyWith<$R, School, $Out> get $asSchool =>
      $base.as((v, t, t2) => _SchoolCopyWithImpl(v, t, t2));
}

abstract class SchoolCopyWith<$R, $In extends School, $Out extends School>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? university});
  SchoolCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _SchoolCopyWithImpl<$R, $Out extends School>
    extends ClassCopyWithBase<$R, School, $Out>
    implements SchoolCopyWith<$R, School, $Out> {
  _SchoolCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<School> $mapper = SchoolMapper.ensureInitialized();
  @override
  $R call({String? university}) => $apply(
      FieldCopyWithData({if (university != null) #university: university}));
  @override
  School $make(CopyWithData data) =>
      School(university: data.get(#university, or: $value.university));

  @override
  SchoolCopyWith<$R2, School, $Out> $chain<$R2>(Then<$Out, $R2> t) =>
      _SchoolCopyWithImpl($value, $cast, t);
}
