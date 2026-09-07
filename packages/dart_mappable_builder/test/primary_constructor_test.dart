import 'package:test/test.dart';

import 'utils/test_mappable.dart';

void main() {
  group('primary constructor', () {
    test('generates correct mapper code for primary constructor', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class Model(
              final String a, {
              final int b = 18,
              final double? c,
              required final bool d,
            }) with ModelMappable {}
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class ModelMapper extends ClassMapperBase<Model> {
  ModelMapper._();

  static ModelMapper? _instance;
  static ModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Model';

  static String _$a(Model v) => v.a;
  static const Field<Model, String> _f$a = Field('a', _$a);
  static int _$b(Model v) => v.b;
  static const Field<Model, int> _f$b = Field('b', _$b, opt: true, def: 18);
  static double? _$c(Model v) => v.c;
  static const Field<Model, double> _f$c = Field('c', _$c, opt: true);
  static bool _$d(Model v) => v.d;
  static const Field<Model, bool> _f$d = Field('d', _$d);

  @override
  final MappableFields<Model> fields = const {
    #a: _f$a,
    #b: _f$b,
    #c: _f$c,
    #d: _f$d,
  };

  static Model _instantiate(DecodingData data) {
    return Model(
      data.dec(_f$a),
      b: data.dec(_f$b),
      c: data.dec(_f$c),
      d: data.dec(_f$d),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Model fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Model>(map);
  }

  static Model fromJson(String json) {
    return ensureInitialized().decodeJson<Model>(json);
  }
}

mixin ModelMappable {
  String toJson() {
    return ModelMapper.ensureInitialized().encodeJson<Model>(this as Model);
  }

  Map<String, dynamic> toMap() {
    return ModelMapper.ensureInitialized().encodeMap<Model>(this as Model);
  }

  ModelCopyWith<Model, Model, Model> get copyWith =>
      _ModelCopyWithImpl<Model, Model>(this as Model, $identity, $identity);
  @override
  String toString() {
    return ModelMapper.ensureInitialized().stringifyValue(this as Model);
  }

  @override
  bool operator ==(Object other) {
    return ModelMapper.ensureInitialized().equalsValue(this as Model, other);
  }

  @override
  int get hashCode {
    return ModelMapper.ensureInitialized().hashValue(this as Model);
  }
}

extension ModelValueCopy<$R, $Out> on ObjectCopyWith<$R, Model, $Out> {
  ModelCopyWith<$R, Model, $Out> get $asModel =>
      $base.as((v, t, t2) => _ModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModelCopyWith<$R, $In extends Model, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? a, int? b, double? c, bool? d});
  ModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Model, $Out>
    implements ModelCopyWith<$R, Model, $Out> {
  _ModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Model> $mapper = ModelMapper.ensureInitialized();
  @override
  $R call({String? a, int? b, Object? c = $none, bool? d}) => $apply(
    FieldCopyWithData({
      if (a != null) #a: a,
      if (b != null) #b: b,
      if (c != $none) #c: c,
      if (d != null) #d: d,
    }),
  );
  @override
  Model $make(CopyWithData data) => Model(
    data.get(#a, or: $value.a),
    b: data.get(#b, or: $value.b),
    c: data.get(#c, or: $value.c),
    d: data.get(#d, or: $value.d),
  );

  @override
  ModelCopyWith<$R2, Model, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

''',
        },
      );
    });

    test('primary constructor with body initializers', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class DeltaPoint(final int x, int delta) with DeltaPointMappable {
              final int y = delta;
            }
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class DeltaPointMapper extends ClassMapperBase<DeltaPoint> {
  DeltaPointMapper._();

  static DeltaPointMapper? _instance;
  static DeltaPointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeltaPointMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DeltaPoint';

  static int _$x(DeltaPoint v) => v.x;
  static const Field<DeltaPoint, int> _f$x = Field('x', _$x);
  static int _$y(DeltaPoint v) => v.y;
  static const Field<DeltaPoint, int> _f$y = Field('y', _$y, key: r'delta');

  @override
  final MappableFields<DeltaPoint> fields = const {#x: _f$x, #y: _f$y};

  static DeltaPoint _instantiate(DecodingData data) {
    return DeltaPoint(data.dec(_f$x), data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static DeltaPoint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeltaPoint>(map);
  }

  static DeltaPoint fromJson(String json) {
    return ensureInitialized().decodeJson<DeltaPoint>(json);
  }
}

mixin DeltaPointMappable {
  String toJson() {
    return DeltaPointMapper.ensureInitialized().encodeJson<DeltaPoint>(
      this as DeltaPoint,
    );
  }

  Map<String, dynamic> toMap() {
    return DeltaPointMapper.ensureInitialized().encodeMap<DeltaPoint>(
      this as DeltaPoint,
    );
  }

  DeltaPointCopyWith<DeltaPoint, DeltaPoint, DeltaPoint> get copyWith =>
      _DeltaPointCopyWithImpl<DeltaPoint, DeltaPoint>(
        this as DeltaPoint,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DeltaPointMapper.ensureInitialized().stringifyValue(
      this as DeltaPoint,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeltaPointMapper.ensureInitialized().equalsValue(
      this as DeltaPoint,
      other,
    );
  }

  @override
  int get hashCode {
    return DeltaPointMapper.ensureInitialized().hashValue(this as DeltaPoint);
  }
}

extension DeltaPointValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeltaPoint, $Out> {
  DeltaPointCopyWith<$R, DeltaPoint, $Out> get $asDeltaPoint =>
      $base.as((v, t, t2) => _DeltaPointCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DeltaPointCopyWith<$R, $In extends DeltaPoint, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? x, int? delta});
  DeltaPointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeltaPointCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeltaPoint, $Out>
    implements DeltaPointCopyWith<$R, DeltaPoint, $Out> {
  _DeltaPointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeltaPoint> $mapper =
      DeltaPointMapper.ensureInitialized();
  @override
  $R call({int? x, int? delta}) => $apply(
    FieldCopyWithData({if (x != null) #x: x, if (delta != null) #delta: delta}),
  );
  @override
  DeltaPoint $make(CopyWithData data) =>
      DeltaPoint(data.get(#x, or: $value.x), data.get(#delta, or: $value.y));

  @override
  DeltaPointCopyWith<$R2, DeltaPoint, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DeltaPointCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

''',
        },
      );
    });

    test('primary constructor with annotations and default values', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class User({
              @MappableField(key: 'custom_id') required final String id,
              final String name = 'John',
            }) with UserMappable {}
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$id(User v) => v.id;
  static const Field<User, String> _f$id = Field('id', _$id, key: r'custom_id');
  static String _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: 'John',
  );

  @override
  final MappableFields<User> fields = const {#id: _f$id, #name: _f$name};

  static User _instantiate(DecodingData data) {
    return User(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl<User, User>(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({String? id, String? name}) => $apply(
    FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}),
  );
  @override
  User $make(CopyWithData data) => User(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

''',
        },
      );
    });
    test('primary constructor named and const', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class const User.custom({
              required final String id,
            }) with UserMappable {}
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$id(User v) => v.id;
  static const Field<User, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<User> fields = const {#id: _f$id};

  static User _instantiate(DecodingData data) {
    return User.custom(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl<User, User>(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  User $make(CopyWithData data) =>
      User.custom(id: data.get(#id, or: $value.id));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

''',
        },
      );
    });

    test('primary constructor generic', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class Box<T>({
              required final T value,
            }) with BoxMappable<T> {}
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class BoxMapper extends ClassMapperBase<Box> {
  BoxMapper._();

  static BoxMapper? _instance;
  static BoxMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Box';
  @override
  Function get typeFactory =>
      <T>(f) => f<Box<T>>();

  static dynamic _$value(Box v) => v.value;
  static dynamic _arg$value<T>(f) => f<T>();
  static const Field<Box, dynamic> _f$value = Field(
    'value',
    _$value,
    arg: _arg$value,
  );

  @override
  final MappableFields<Box> fields = const {#value: _f$value};

  static Box<T> _instantiate<T>(DecodingData data) {
    return Box(value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Box<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Box<T>>(map);
  }

  static Box<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Box<T>>(json);
  }
}

mixin BoxMappable<T> {
  String toJson() {
    return BoxMapper.ensureInitialized().encodeJson<Box<T>>(this as Box<T>);
  }

  Map<String, dynamic> toMap() {
    return BoxMapper.ensureInitialized().encodeMap<Box<T>>(this as Box<T>);
  }

  BoxCopyWith<Box<T>, Box<T>, Box<T>, T> get copyWith =>
      _BoxCopyWithImpl<Box<T>, Box<T>, T>(this as Box<T>, $identity, $identity);
  @override
  String toString() {
    return BoxMapper.ensureInitialized().stringifyValue(this as Box<T>);
  }

  @override
  bool operator ==(Object other) {
    return BoxMapper.ensureInitialized().equalsValue(this as Box<T>, other);
  }

  @override
  int get hashCode {
    return BoxMapper.ensureInitialized().hashValue(this as Box<T>);
  }
}

extension BoxValueCopy<$R, $Out, T> on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? value});
  BoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  $R call({Object? value = $none}) =>
      $apply(FieldCopyWithData({if (value != $none) #value: value}));
  @override
  Box<T> $make(CopyWithData data) =>
      Box(value: data.get(#value, or: $value.value));

  @override
  BoxCopyWith<$R2, Box<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

''',
        },
      );
    });

    test('primary constructor inheritance', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class Base({
              required final String id,
            }) with BaseMappable {}

            @MappableClass()
            class Sub({
              required super.id,
              required final String extra,
            }) extends Base with SubMappable {}
          ''',
        },
        outputs: {
          'model': r'''// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model.dart';

class BaseMapper extends ClassMapperBase<Base> {
  BaseMapper._();

  static BaseMapper? _instance;
  static BaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseMapper._());
      SubMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Base';

  static String _$id(Base v) => v.id;
  static const Field<Base, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<Base> fields = const {#id: _f$id};

  static Base _instantiate(DecodingData data) {
    return Base(id: data.dec(_f$id));
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
  String toJson() {
    return BaseMapper.ensureInitialized().encodeJson<Base>(this as Base);
  }

  Map<String, dynamic> toMap() {
    return BaseMapper.ensureInitialized().encodeMap<Base>(this as Base);
  }

  BaseCopyWith<Base, Base, Base> get copyWith =>
      _BaseCopyWithImpl<Base, Base>(this as Base, $identity, $identity);
  @override
  String toString() {
    return BaseMapper.ensureInitialized().stringifyValue(this as Base);
  }

  @override
  bool operator ==(Object other) {
    return BaseMapper.ensureInitialized().equalsValue(this as Base, other);
  }

  @override
  int get hashCode {
    return BaseMapper.ensureInitialized().hashValue(this as Base);
  }
}

extension BaseValueCopy<$R, $Out> on ObjectCopyWith<$R, Base, $Out> {
  BaseCopyWith<$R, Base, $Out> get $asBase =>
      $base.as((v, t, t2) => _BaseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BaseCopyWith<$R, $In extends Base, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  BaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Base, $Out>
    implements BaseCopyWith<$R, Base, $Out> {
  _BaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Base> $mapper = BaseMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  Base $make(CopyWithData data) => Base(id: data.get(#id, or: $value.id));

  @override
  BaseCopyWith<$R2, Base, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubMapper extends ClassMapperBase<Sub> {
  SubMapper._();

  static SubMapper? _instance;
  static SubMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubMapper._());
      BaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Sub';

  static String _$id(Sub v) => v.id;
  static const Field<Sub, String> _f$id = Field('id', _$id);
  static String _$extra(Sub v) => v.extra;
  static const Field<Sub, String> _f$extra = Field('extra', _$extra);

  @override
  final MappableFields<Sub> fields = const {#id: _f$id, #extra: _f$extra};

  static Sub _instantiate(DecodingData data) {
    return Sub(id: data.dec(_f$id), extra: data.dec(_f$extra));
  }

  @override
  final Function instantiate = _instantiate;

  static Sub fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Sub>(map);
  }

  static Sub fromJson(String json) {
    return ensureInitialized().decodeJson<Sub>(json);
  }
}

mixin SubMappable {
  String toJson() {
    return SubMapper.ensureInitialized().encodeJson<Sub>(this as Sub);
  }

  Map<String, dynamic> toMap() {
    return SubMapper.ensureInitialized().encodeMap<Sub>(this as Sub);
  }

  SubCopyWith<Sub, Sub, Sub> get copyWith =>
      _SubCopyWithImpl<Sub, Sub>(this as Sub, $identity, $identity);
  @override
  String toString() {
    return SubMapper.ensureInitialized().stringifyValue(this as Sub);
  }

  @override
  bool operator ==(Object other) {
    return SubMapper.ensureInitialized().equalsValue(this as Sub, other);
  }

  @override
  int get hashCode {
    return SubMapper.ensureInitialized().hashValue(this as Sub);
  }
}

extension SubValueCopy<$R, $Out> on ObjectCopyWith<$R, Sub, $Out> {
  SubCopyWith<$R, Sub, $Out> get $asSub =>
      $base.as((v, t, t2) => _SubCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubCopyWith<$R, $In extends Sub, $Out>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? extra});
  SubCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Sub, $Out>
    implements SubCopyWith<$R, Sub, $Out> {
  _SubCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Sub> $mapper = SubMapper.ensureInitialized();
  @override
  $R call({String? id, String? extra}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (extra != null) #extra: extra,
    }),
  );
  @override
  Sub $make(CopyWithData data) => Sub(
    id: data.get(#id, or: $value.id),
    extra: data.get(#extra, or: $value.extra),
  );

  @override
  SubCopyWith<$R2, Sub, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SubCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

''',
        },
      );
    });
  });
}
