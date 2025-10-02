// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  static const Field<Base, String> _f$id = Field(
    'id',
    _$id,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static String _$name(Base v) => v.name;
  static const Field<Base, String> _f$name = Field(
    'name',
    _$name,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static Map<String, dynamic> _$objects(Base v) => v.objects;
  static const Field<Base, Map<String, dynamic>> _f$objects = Field(
    'objects',
    _$objects,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<Base> fields = const {
    #id: _f$id,
    #name: _f$name,
    #objects: _f$objects,
  };

  static Base _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Base');
  }

  @override
  final Function instantiate = _instantiate;

  static Base fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Base>(map);
  }

  static Base fromJson(String json) {
    return ensureInitialized().decodeJson<Base>(json);
  }
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

abstract class BaseCopyWith<$R, $In extends Base, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>
  get objects;
  $R call({String? id, String? name, Map<String, dynamic>? objects});
  BaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class OneMapper extends ClassMapperBase<One> {
  OneMapper._();

  static OneMapper? _instance;
  static OneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OneMapper._());
      BaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'One';

  static String _$id(One v) => v.id;
  static const Field<One, String> _f$id = Field(
    'id',
    _$id,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static String _$name(One v) => v.name;
  static const Field<One, String> _f$name = Field(
    'name',
    _$name,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static Map<String, dynamic> _$objects(One v) => v.objects;
  static const Field<One, Map<String, dynamic>> _f$objects = Field(
    'objects',
    _$objects,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<One> fields = const {
    #id: _f$id,
    #name: _f$name,
    #objects: _f$objects,
  };

  static One _instantiate(DecodingData data) {
    return One(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      objects: data.dec(_f$objects),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static One fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<One>(map);
  }

  static One fromJson(String json) {
    return ensureInitialized().decodeJson<One>(json);
  }
}

mixin OneMappable {
  String toJson() {
    return OneMapper.ensureInitialized().encodeJson<One>(this as One);
  }

  Map<String, dynamic> toMap() {
    return OneMapper.ensureInitialized().encodeMap<One>(this as One);
  }

  OneCopyWith<One, One, One> get copyWith =>
      _OneCopyWithImpl<One, One>(this as One, $identity, $identity);
  @override
  String toString() {
    return OneMapper.ensureInitialized().stringifyValue(this as One);
  }

  @override
  bool operator ==(Object other) {
    return OneMapper.ensureInitialized().equalsValue(this as One, other);
  }

  @override
  int get hashCode {
    return OneMapper.ensureInitialized().hashValue(this as One);
  }
}

extension OneValueCopy<$R, $Out> on ObjectCopyWith<$R, One, $Out> {
  OneCopyWith<$R, One, $Out> get $asOne =>
      $base.as((v, t, t2) => _OneCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OneCopyWith<$R, $In extends One, $Out>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get objects;
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects});
  OneCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OneCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, One, $Out>
    implements OneCopyWith<$R, One, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<One> $mapper = OneMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get objects => MapCopyWith(
    $value.objects,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(objects: v),
  );
  @override
  $R call({String? id, String? name, Map<String, dynamic>? objects}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (objects != null) #objects: objects,
    }),
  );
  @override
  One $make(CopyWithData data) => One(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    objects: data.get(#objects, or: $value.objects),
  );

  @override
  OneCopyWith<$R2, One, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OneCopyWithImpl<$R2, $Out2>($value, $cast, t);
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
  static const Field<Two, String> _f$id = Field(
    'id',
    _$id,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<Two> fields = const {#id: _f$id};

  static Two _instantiate(DecodingData data) {
    return Two(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static Two fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Two>(map);
  }

  static Two fromJson(String json) {
    return ensureInitialized().decodeJson<Two>(json);
  }
}

mixin TwoMappable {
  String toJson() {
    return TwoMapper.ensureInitialized().encodeJson<Two>(this as Two);
  }

  Map<String, dynamic> toMap() {
    return TwoMapper.ensureInitialized().encodeMap<Two>(this as Two);
  }

  TwoCopyWith<Two, Two, Two> get copyWith =>
      _TwoCopyWithImpl<Two, Two>(this as Two, $identity, $identity);
  @override
  String toString() {
    return TwoMapper.ensureInitialized().stringifyValue(this as Two);
  }

  @override
  bool operator ==(Object other) {
    return TwoMapper.ensureInitialized().equalsValue(this as Two, other);
  }

  @override
  int get hashCode {
    return TwoMapper.ensureInitialized().hashValue(this as Two);
  }
}

extension TwoValueCopy<$R, $Out> on ObjectCopyWith<$R, Two, $Out> {
  TwoCopyWith<$R, Two, $Out> get $asTwo =>
      $base.as((v, t, t2) => _TwoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TwoCopyWith<$R, $In extends Two, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  TwoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TwoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Two, $Out>
    implements TwoCopyWith<$R, Two, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Two> $mapper = TwoMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  Two $make(CopyWithData data) => Two(id: data.get(#id, or: $value.id));

  @override
  TwoCopyWith<$R2, Two, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TwoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

