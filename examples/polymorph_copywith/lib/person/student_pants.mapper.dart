// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'student_pants.dart';

class StudentPantsMapper extends ClassMapperBase<StudentPants> {
  StudentPantsMapper._();

  static StudentPantsMapper? _instance;
  static StudentPantsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentPantsMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'StudentPants';

  static String _$material(StudentPants v) => v.material;
  static const Field<StudentPants, String> _f$material =
      Field('material', _$material);
  static String _$extraSomething(StudentPants v) => v.extraSomething;
  static const Field<StudentPants, String> _f$extraSomething =
      Field('extraSomething', _$extraSomething);

  @override
  final Map<Symbol, Field<StudentPants, dynamic>> fields = const {
    #material: _f$material,
    #extraSomething: _f$extraSomething,
  };

  static StudentPants _instantiate(DecodingData data) {
    return StudentPants(
        material: data.dec(_f$material),
        extraSomething: data.dec(_f$extraSomething));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentPants fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<StudentPants>(map));
  }

  static StudentPants fromJson(String json) {
    return _guard((c) => c.fromJson<StudentPants>(json));
  }
}

mixin StudentPantsMappable {
  String toJson() {
    return StudentPantsMapper._guard((c) => c.toJson(this as StudentPants));
  }

  Map<String, dynamic> toMap() {
    return StudentPantsMapper._guard((c) => c.toMap(this as StudentPants));
  }

  StudentPantsCopyWith<StudentPants, StudentPants, StudentPants> get copyWith =>
      _StudentPantsCopyWithImpl(this as StudentPants, $identity, $identity);
  @override
  String toString() {
    return StudentPantsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StudentPantsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return StudentPantsMapper._guard((c) => c.hash(this));
  }
}

extension StudentPantsValueCopy<$R, $Out extends StudentPants>
    on ObjectCopyWith<$R, StudentPants, $Out> {
  StudentPantsCopyWith<$R, StudentPants, $Out> get $asStudentPants =>
      $base.as((v, t, t2) => _StudentPantsCopyWithImpl(v, t, t2));
}

abstract class StudentPantsCopyWith<$R, $In extends StudentPants,
    $Out extends StudentPants> implements PantsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? material, String? extraSomething});
  StudentPantsCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _StudentPantsCopyWithImpl<$R, $Out extends StudentPants>
    extends ClassCopyWithBase<$R, StudentPants, $Out>
    implements StudentPantsCopyWith<$R, StudentPants, $Out> {
  _StudentPantsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentPants> $mapper =
      StudentPantsMapper.ensureInitialized();
  @override
  $R call({String? material, String? extraSomething}) =>
      $apply(FieldCopyWithData({
        if (material != null) #material: material,
        if (extraSomething != null) #extraSomething: extraSomething
      }));
  @override
  StudentPants $make(CopyWithData data) => StudentPants(
      material: data.get(#material, or: $value.material),
      extraSomething: data.get(#extraSomething, or: $value.extraSomething));

  @override
  StudentPantsCopyWith<$R2, StudentPants, $Out> $chain<$R2>(
          Then<$Out, $R2> t) =>
      _StudentPantsCopyWithImpl($value, $cast, t);
}
