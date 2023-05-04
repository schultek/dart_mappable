// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'student_clothes.dart';

class StudentClothesMapper extends ClassMapperBase<StudentClothes> {
  StudentClothesMapper._();

  static StudentClothesMapper? _instance;
  static StudentClothesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentClothesMapper._());
      StudentPantsMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'StudentClothes';

  static String _$shirt(StudentClothes v) => v.shirt;
  static const Field<StudentClothes, String> _f$shirt = Field('shirt', _$shirt);
  static List<StudentPants> _$pants(StudentClothes v) => v.pants;
  static const Field<StudentClothes, List<StudentPants>> _f$pants =
      Field('pants', _$pants);
  static String _$badge(StudentClothes v) => v.badge;
  static const Field<StudentClothes, String> _f$badge = Field('badge', _$badge);

  @override
  final Map<Symbol, Field<StudentClothes, dynamic>> fields = const {
    #shirt: _f$shirt,
    #pants: _f$pants,
    #badge: _f$badge,
  };

  static StudentClothes _instantiate(DecodingData data) {
    return StudentClothes(
        shirt: data.dec(_f$shirt),
        pants: data.dec(_f$pants),
        badge: data.dec(_f$badge));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentClothes fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<StudentClothes>(map));
  }

  static StudentClothes fromJson(String json) {
    return _guard((c) => c.fromJson<StudentClothes>(json));
  }
}

mixin StudentClothesMappable {
  String toJson() {
    return StudentClothesMapper._guard((c) => c.toJson(this as StudentClothes));
  }

  Map<String, dynamic> toMap() {
    return StudentClothesMapper._guard((c) => c.toMap(this as StudentClothes));
  }

  StudentClothesCopyWith<StudentClothes, StudentClothes, StudentClothes>
      get copyWith => _StudentClothesCopyWithImpl(
          this as StudentClothes, $identity, $identity);
  @override
  String toString() {
    return StudentClothesMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StudentClothesMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return StudentClothesMapper._guard((c) => c.hash(this));
  }
}

extension StudentClothesValueCopy<$R, $Out extends StudentClothes>
    on ObjectCopyWith<$R, StudentClothes, $Out> {
  StudentClothesCopyWith<$R, StudentClothes, $Out> get $asStudentClothes =>
      $base.as((v, t, t2) => _StudentClothesCopyWithImpl(v, t, t2));
}

abstract class StudentClothesCopyWith<$R, $In extends StudentClothes,
    $Out extends StudentClothes> implements ClothesCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, StudentPants,
      StudentPantsCopyWith<$R, StudentPants, StudentPants>> get pants;
  @override
  $R call({String? shirt, covariant List<StudentPants>? pants, String? badge});
  StudentClothesCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _StudentClothesCopyWithImpl<$R, $Out extends StudentClothes>
    extends ClassCopyWithBase<$R, StudentClothes, $Out>
    implements StudentClothesCopyWith<$R, StudentClothes, $Out> {
  _StudentClothesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentClothes> $mapper =
      StudentClothesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, StudentPants,
          StudentPantsCopyWith<$R, StudentPants, StudentPants>>
      get pants => ListCopyWith($value.pants,
          (v, t) => v.copyWith.$chain<$R>(t), (v) => call(pants: v));
  @override
  $R call({String? shirt, List<StudentPants>? pants, String? badge}) =>
      $apply(FieldCopyWithData({
        if (shirt != null) #shirt: shirt,
        if (pants != null) #pants: pants,
        if (badge != null) #badge: badge
      }));
  @override
  StudentClothes $make(CopyWithData data) => StudentClothes(
      shirt: data.get(#shirt, or: $value.shirt),
      pants: data.get(#pants, or: $value.pants),
      badge: data.get(#badge, or: $value.badge));

  @override
  StudentClothesCopyWith<$R2, StudentClothes, $Out> $chain<$R2>(
          Then<$Out, $R2> t) =>
      _StudentClothesCopyWithImpl($value, $cast, t);
}
