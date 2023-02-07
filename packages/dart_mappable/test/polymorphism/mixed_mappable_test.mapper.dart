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
    ensureInitialized();
    return MapperContainer.globals.fromMap<Base>(map);
  }
  static Base fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Base>(json);
  }
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

typedef BaseCopyWithBound = Base;
abstract class BaseCopyWith<$R, $In extends Base, $Out extends Base> implements ObjectCopyWith<$R, $In, $Out> {
  BaseCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Base>(Then<Base, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?> get objects;
  $R call({String? id, String? name, Map<String, dynamic>? objects});
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
    return One(id: data.get(#id), name: data.get(#name), objects: data.get(#objects));
  }
  @override
  final Function instantiate = _instantiate;

  static One fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<One>(map);
  }
  static One fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<One>(json);
  }
}

mixin OneMappable {
  String toJson() {
    OneMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as One);
  }
  Map<String, dynamic> toMap() {
    OneMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as One);
  }
  OneCopyWith<One, One, One> get copyWith => _OneCopyWithImpl(this as One, $identity, $identity);
  @override
  String toString() {
    OneMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    OneMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    OneMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension OneValueCopy<$R, $Out extends Base> on ObjectCopyWith<$R, One, $Out> {
  OneCopyWith<$R, One, $Out> get asOne => base.as((v, t, t2) => _OneCopyWithImpl(v, t, t2));
}

typedef OneCopyWithBound = Base;
abstract class OneCopyWith<$R, $In extends One, $Out extends Base> implements BaseCopyWith<$R, $In, $Out> {
  OneCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Base>(Then<One, $Out2> t, Then<$Out2, $R2> t2);
  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects;
  @override $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class _OneCopyWithImpl<$R, $Out extends Base> extends CopyWithBase<$R, One, $Out> implements OneCopyWith<$R, One, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);
  @override OneCopyWith<$R2, One, $Out2> chain<$R2, $Out2 extends Base>(Then<One, $Out2> t, Then<$Out2, $R2> t2) => _OneCopyWithImpl($value, t, t2);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects => MapCopyWith($value.objects, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(objects: v));
  @override $R call({String? id, String? name, Map<String, dynamic>? objects}) => $then(One(id: id ?? $value.id, name: name ?? $value.name, objects: objects ?? $value.objects));
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
    ensureInitialized();
    return MapperContainer.globals.fromMap<Two>(map);
  }
  static Two fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Two>(json);
  }
}

mixin TwoMappable {
  String toJson() {
    TwoMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Two);
  }
  Map<String, dynamic> toMap() {
    TwoMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Two);
  }
  TwoCopyWith<Two, Two, Two> get copyWith => _TwoCopyWithImpl(this as Two, $identity, $identity);
  @override
  String toString() {
    TwoMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    TwoMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    TwoMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension TwoValueCopy<$R, $Out extends Two> on ObjectCopyWith<$R, Two, $Out> {
  TwoCopyWith<$R, Two, $Out> get asTwo => base.as((v, t, t2) => _TwoCopyWithImpl(v, t, t2));
}

typedef TwoCopyWithBound = Two;
abstract class TwoCopyWith<$R, $In extends Two, $Out extends Two> implements ObjectCopyWith<$R, $In, $Out> {
  TwoCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Two>(Then<Two, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
}

class _TwoCopyWithImpl<$R, $Out extends Two> extends CopyWithBase<$R, Two, $Out> implements TwoCopyWith<$R, Two, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);
  @override TwoCopyWith<$R2, Two, $Out2> chain<$R2, $Out2 extends Two>(Then<Two, $Out2> t, Then<$Out2, $R2> t2) => _TwoCopyWithImpl($value, t, t2);

  @override $R call({String? id}) => $then(Two(id: id ?? $value.id));
}
