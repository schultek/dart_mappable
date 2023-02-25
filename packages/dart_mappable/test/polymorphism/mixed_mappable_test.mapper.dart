// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'mixed_mappable_test.dart';

class BaseMapper extends ClassMapperBase<Base> {
  BaseMapper._();
  static BaseMapper? _instance;
  static BaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseMapper._());
      OneMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Base';

  static String _$id(Base v) => v.id;
  static String _$name(Base v) => v.name;
  static Map<String, dynamic> _$objects(Base v) => v.objects;

  @override
  final Map<Symbol, Field<Base, dynamic>> fields = const {
    #id: Field<Base, String>('id', _$id),
    #name: Field<Base, String>('name', _$name),
    #objects: Field<Base, Map<String, dynamic>>('objects', _$objects),
  };

  static Base _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Base');
  }

  @override
  final Function instantiate = _instantiate;

  static Base fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Base>(map));
  }

  static Base fromJson(String json) {
    return _guard((c) => c.fromJson<Base>(json));
  }
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

typedef BaseCopyWithBound = Base;

abstract class BaseCopyWith<$R, $In extends Base, $Out extends Base>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>
      get objects;
  $R call({String? id, String? name, Map<String, dynamic>? objects});
  BaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Base>(
      Then<Base, $Out2> t, Then<$Out2, $R2> t2);
}

class OneMapper extends ClassMapperBase<One> {
  OneMapper._();
  static OneMapper? _instance;
  static OneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OneMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'One';

  static String _$id(One v) => v.id;
  static String _$name(One v) => v.name;
  static Map<String, dynamic> _$objects(One v) => v.objects;

  @override
  final Map<Symbol, Field<One, dynamic>> fields = const {
    #id: Field<One, String>('id', _$id),
    #name: Field<One, String>('name', _$name),
    #objects: Field<One, Map<String, dynamic>>('objects', _$objects),
  };

  static One _instantiate(DecodingData data) {
    return One(
        id: data.get(#id), name: data.get(#name), objects: data.get(#objects));
  }

  @override
  final Function instantiate = _instantiate;

  static One fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<One>(map));
  }

  static One fromJson(String json) {
    return _guard((c) => c.fromJson<One>(json));
  }
}

mixin OneMappable {
  String toJson() {
    return OneMapper._guard((c) => c.toJson(this as One));
  }

  Map<String, dynamic> toMap() {
    return OneMapper._guard((c) => c.toMap(this as One));
  }

  OneCopyWith<One, One, One> get copyWith =>
      _OneCopyWithImpl(this as One, $identity, $identity);
  @override
  String toString() {
    return OneMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OneMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OneMapper._guard((c) => c.hash(this));
  }
}

extension OneValueCopy<$R, $Out extends Base> on ObjectCopyWith<$R, One, $Out> {
  OneCopyWith<$R, One, $Out> get $asOne =>
      $base.as((v, t, t2) => _OneCopyWithImpl(v, t, t2));
}

typedef OneCopyWithBound = Base;

abstract class OneCopyWith<$R, $In extends One, $Out extends Base>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get objects;
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects});
  OneCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Base>(
      Then<One, $Out2> t, Then<$Out2, $R2> t2);
}

class _OneCopyWithImpl<$R, $Out extends Base>
    extends ClassCopyWithBase<$R, One, $Out>
    implements OneCopyWith<$R, One, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<One> $mapper = OneMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get objects => MapCopyWith($value.objects,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(objects: v));
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (objects != null) #objects: objects
      }));
  @override
  One $make(CopyWithData data) => One(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      objects: data.get(#objects, or: $value.objects));

  @override
  OneCopyWith<$R2, One, $Out2> $chain<$R2, $Out2 extends Base>(
          Then<One, $Out2> t, Then<$Out2, $R2> t2) =>
      _OneCopyWithImpl($value, t, t2);
}

class TwoMapper extends ClassMapperBase<Two> {
  TwoMapper._();
  static TwoMapper? _instance;
  static TwoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TwoMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Two';

  static String _$id(Two v) => v.id;
  static String _$name(Two v) => v.name;

  @override
  final Map<Symbol, Field<Two, dynamic>> fields = const {
    #id: Field<Two, String>('id', _$id),
    #name: Field<Two, String>('name', _$name, mode: FieldMode.member),
  };

  static Two _instantiate(DecodingData data) {
    return Two(id: data.get(#id));
  }

  @override
  final Function instantiate = _instantiate;

  static Two fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Two>(map));
  }

  static Two fromJson(String json) {
    return _guard((c) => c.fromJson<Two>(json));
  }
}

mixin TwoMappable {
  String toJson() {
    return TwoMapper._guard((c) => c.toJson(this as Two));
  }

  Map<String, dynamic> toMap() {
    return TwoMapper._guard((c) => c.toMap(this as Two));
  }

  TwoCopyWith<Two, Two, Two> get copyWith =>
      _TwoCopyWithImpl(this as Two, $identity, $identity);
  @override
  String toString() {
    return TwoMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TwoMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TwoMapper._guard((c) => c.hash(this));
  }
}

extension TwoValueCopy<$R, $Out extends Two> on ObjectCopyWith<$R, Two, $Out> {
  TwoCopyWith<$R, Two, $Out> get $asTwo =>
      $base.as((v, t, t2) => _TwoCopyWithImpl(v, t, t2));
}

typedef TwoCopyWithBound = Two;

abstract class TwoCopyWith<$R, $In extends Two, $Out extends Two>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  TwoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Two>(
      Then<Two, $Out2> t, Then<$Out2, $R2> t2);
}

class _TwoCopyWithImpl<$R, $Out extends Two>
    extends ClassCopyWithBase<$R, Two, $Out>
    implements TwoCopyWith<$R, Two, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Two> $mapper = TwoMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  Two $make(CopyWithData data) => Two(id: data.get(#id, or: $value.id));

  @override
  TwoCopyWith<$R2, Two, $Out2> $chain<$R2, $Out2 extends Two>(
          Then<Two, $Out2> t, Then<$Out2, $R2> t2) =>
      _TwoCopyWithImpl($value, t, t2);
}
