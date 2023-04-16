// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enum_map_test.dart';

class EnumAMapper extends EnumMapper<EnumA> {
  EnumAMapper._();

  static EnumAMapper? _instance;
  static EnumAMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnumAMapper._());
    }
    return _instance!;
  }

  static EnumA fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EnumA decode(dynamic value) {
    switch (value) {
      case 'a':
        return EnumA.a;
      case 'aa':
        return EnumA.aa;
      case 'unknown':
        return EnumA.unknown;
      default:
        return EnumA.values[2];
    }
  }

  @override
  dynamic encode(EnumA self) {
    switch (self) {
      case EnumA.a:
        return 'a';
      case EnumA.aa:
        return 'aa';
      case EnumA.unknown:
        return 'unknown';
    }
  }
}

extension EnumAMapperExtension on EnumA {
  String toValue() {
    EnumAMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ClassAMapper extends ClassMapperBase<ClassA> {
  ClassAMapper._();

  static ClassAMapper? _instance;
  static ClassAMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClassAMapper._());
      EnumAMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ClassA';

  static Map<EnumA, bool?> _$someVariable(ClassA v) => v.someVariable;
  static const Field<ClassA, Map<EnumA, bool?>> _f$someVariable =
      Field('someVariable', _$someVariable);

  @override
  final Map<Symbol, Field<ClassA, dynamic>> fields = const {
    #someVariable: _f$someVariable,
  };

  static ClassA _instantiate(DecodingData data) {
    return ClassA(data.dec(_f$someVariable));
  }

  @override
  final Function instantiate = _instantiate;

  static ClassA fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ClassA>(map));
  }

  static ClassA fromJson(String json) {
    return _guard((c) => c.fromJson<ClassA>(json));
  }
}

mixin ClassAMappable {
  String toJson() {
    return ClassAMapper._guard((c) => c.toJson(this as ClassA));
  }

  Map<String, dynamic> toMap() {
    return ClassAMapper._guard((c) => c.toMap(this as ClassA));
  }

  ClassACopyWith<ClassA, ClassA, ClassA> get copyWith =>
      _ClassACopyWithImpl(this as ClassA, $identity, $identity);
  @override
  String toString() {
    return ClassAMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ClassAMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ClassAMapper._guard((c) => c.hash(this));
  }
}

extension ClassAValueCopy<$R, $Out extends ClassA>
    on ObjectCopyWith<$R, ClassA, $Out> {
  ClassACopyWith<$R, ClassA, $Out> get $asClassA =>
      $base.as((v, t, t2) => _ClassACopyWithImpl(v, t, t2));
}

typedef ClassACopyWithBound = ClassA;

abstract class ClassACopyWith<$R, $In extends ClassA, $Out extends ClassA>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, EnumA, bool?, ObjectCopyWith<$R, bool?, bool?>?>
      get someVariable;
  $R call({Map<EnumA, bool?>? someVariable});
  ClassACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends ClassA>(
      Then<ClassA, $Out2> t, Then<$Out2, $R2> t2);
}

class _ClassACopyWithImpl<$R, $Out extends ClassA>
    extends ClassCopyWithBase<$R, ClassA, $Out>
    implements ClassACopyWith<$R, ClassA, $Out> {
  _ClassACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClassA> $mapper = ClassAMapper.ensureInitialized();
  @override
  MapCopyWith<$R, EnumA, bool?, ObjectCopyWith<$R, bool?, bool?>?>
      get someVariable => MapCopyWith(
          $value.someVariable,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(someVariable: v));
  @override
  $R call({Map<EnumA, bool?>? someVariable}) => $apply(FieldCopyWithData(
      {if (someVariable != null) #someVariable: someVariable}));
  @override
  ClassA $make(CopyWithData data) =>
      ClassA(data.get(#someVariable, or: $value.someVariable));

  @override
  ClassACopyWith<$R2, ClassA, $Out2> $chain<$R2, $Out2 extends ClassA>(
          Then<ClassA, $Out2> t, Then<$Out2, $R2> t2) =>
      _ClassACopyWithImpl($value, t, t2);
}
