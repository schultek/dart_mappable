// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enum_map_test.dart';

class ClassAMapper extends MapperBase<ClassA> {
  static MapperContainer container = MapperContainer(
    mappers: {ClassAMapper()},
  )..linkAll({EnumAMapper.container});

  @override
  ClassAMapperElement createElement(MapperContainer container) {
    return ClassAMapperElement._(this, container);
  }

  @override
  String get id => 'ClassA';

  static final fromMap = container.fromMap<ClassA>;
  static final fromJson = container.fromJson<ClassA>;
}

class ClassAMapperElement extends MapperElementBase<ClassA> {
  ClassAMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ClassA decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ClassA fromMap(Map<String, dynamic> map) =>
      ClassA(container.$get(map, 'someVariable'));

  @override
  Function get encoder => encode;
  dynamic encode(ClassA v) => toMap(v);
  Map<String, dynamic> toMap(ClassA c) =>
      {'someVariable': container.$enc(c.someVariable, 'someVariable')};

  @override
  String stringify(ClassA self) =>
      'ClassA(someVariable: ${container.asString(self.someVariable)})';
  @override
  int hash(ClassA self) => container.hash(self.someVariable);
  @override
  bool equals(ClassA self, ClassA other) =>
      container.isEqual(self.someVariable, other.someVariable);
}

mixin ClassAMappable {
  String toJson() => ClassAMapper.container.toJson(this as ClassA);
  Map<String, dynamic> toMap() => ClassAMapper.container.toMap(this as ClassA);
  ClassACopyWith<ClassA, ClassA, ClassA> get copyWith =>
      _ClassACopyWithImpl(this as ClassA, $identity, $identity);
  @override
  String toString() => ClassAMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ClassAMapper.container.isEqual(this, other));
  @override
  int get hashCode => ClassAMapper.container.hash(this);
}

extension ClassAValueCopy<$R, $Out extends ClassA>
    on ObjectCopyWith<$R, ClassA, $Out> {
  ClassACopyWith<$R, ClassA, $Out> get asClassA =>
      base.as((v, t, t2) => _ClassACopyWithImpl(v, t, t2));
}

typedef ClassACopyWithBound = ClassA;

abstract class ClassACopyWith<$R, $In extends ClassA, $Out extends ClassA>
    implements ObjectCopyWith<$R, $In, $Out> {
  ClassACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ClassA>(
      Then<ClassA, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, EnumA, bool?, ObjectCopyWith<$R, bool?, bool?>?>
      get someVariable;
  $R call({Map<EnumA, bool?>? someVariable});
}

class _ClassACopyWithImpl<$R, $Out extends ClassA>
    extends CopyWithBase<$R, ClassA, $Out>
    implements ClassACopyWith<$R, ClassA, $Out> {
  _ClassACopyWithImpl(super.value, super.then, super.then2);
  @override
  ClassACopyWith<$R2, ClassA, $Out2> chain<$R2, $Out2 extends ClassA>(
          Then<ClassA, $Out2> t, Then<$Out2, $R2> t2) =>
      _ClassACopyWithImpl($value, t, t2);

  @override
  MapCopyWith<$R, EnumA, bool?, ObjectCopyWith<$R, bool?, bool?>?>
      get someVariable => MapCopyWith(
          $value.someVariable,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(someVariable: v));
  @override
  $R call({Map<EnumA, bool?>? someVariable}) =>
      $then(ClassA(someVariable ?? $value.someVariable));
}

class EnumAMapper extends EnumMapper<EnumA> {
  static MapperContainer container = MapperContainer(
    mappers: {EnumAMapper()},
  );

  static final fromValue = container.fromValue<EnumA>;

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
  String toValue() => EnumAMapper.container.toValue(this) as String;
}
