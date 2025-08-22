// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'example.dart';

class UserTypeMapper extends EnumMapper<UserType> {
  UserTypeMapper._();

  static UserTypeMapper? _instance;
  static UserTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTypeMapper._());
    }
    return _instance!;
  }

  @override
  Map<String, UserType> get enums => {
    r'user': UserType.user,
    r'admin': UserType.admin,
  };

  static UserType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UserType decode(dynamic value) {
    switch (value) {
      case r'user':
        return UserType.user;
      case r'admin':
        return UserType.admin;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UserType self) {
    switch (self) {
      case UserType.user:
        return r'user';
      case UserType.admin:
        return r'admin';
    }
  }
}

extension UserTypeMapperExtension on UserType {
  String toValue() {
    UserTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<UserType>(this) as String;
  }
}

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
      UserTypeMapper.ensureInitialized();
      _t$_R0Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field('name', _$name);
  static int _$age(User v) => v.age;
  static const Field<User, int> _f$age = Field(
    'age',
    _$age,
    opt: true,
    def: 10,
  );
  static List<String> _$tags(User v) => v.tags;
  static const Field<User, List<String>> _f$tags = Field('tags', _$tags);
  static UserType _$type(User v) => v.type;
  static const Field<User, UserType> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: UserType.admin,
  );
  static _t$_R0<int, int, String> _$info(User v) => v.info;
  static const Field<User, _t$_R0<int, int, String>> _f$info = Field(
    'info',
    _$info,
  );

  @override
  final MappableFields<User> fields = const {
    #name: _f$name,
    #age: _f$age,
    #tags: _f$tags,
    #type: _f$type,
    #info: _f$info,
  };

  static User _instantiate(DecodingData data) {
    return User(
      name: data.dec(_f$name),
      age: data.dec(_f$age),
      tags: data.dec(_f$tags),
      type: data.dec(_f$type),
      info: data.dec(_f$info),
    );
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call({
    String? name,
    int? age,
    List<String>? tags,
    UserType? type,
    _t$_R0<int, int, String>? info,
  });
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  $R call({
    String? name,
    int? age,
    List<String>? tags,
    UserType? type,
    _t$_R0<int, int, String>? info,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (age != null) #age: age,
      if (tags != null) #tags: tags,
      if (type != null) #type: type,
      if (info != null) #info: info,
    }),
  );
  @override
  User $make(CopyWithData data) => User(
    name: data.get(#name, or: $value.name),
    age: data.get(#age, or: $value.age),
    tags: data.get(#tags, or: $value.tags),
    type: data.get(#type, or: $value.type),
    info: data.get(#info, or: $value.info),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

typedef _t$_R0<A, B, C> = (A, B, C);

class _t$_R0Mapper extends RecordMapperBase<_t$_R0> {
  static _t$_R0Mapper? _instance;
  _t$_R0Mapper._();

  static _t$_R0Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _t$_R0Mapper._());
      MapperBase.addType(<A, B, C>(f) => f<(A, B, C)>());
    }
    return _instance!;
  }

  static dynamic _$$1(_t$_R0 v) => v.$1;
  static dynamic _arg$$1<A, B, C>(f) => f<A>();
  static const Field<_t$_R0, dynamic> _f$$1 = Field(
    '\$1',
    _$$1,
    mode: FieldMode.tuple,
    arg: _arg$$1,
  );
  static dynamic _$$2(_t$_R0 v) => v.$2;
  static dynamic _arg$$2<A, B, C>(f) => f<B>();
  static const Field<_t$_R0, dynamic> _f$$2 = Field(
    '\$2',
    _$$2,
    mode: FieldMode.tuple,
    arg: _arg$$2,
  );
  static dynamic _$$3(_t$_R0 v) => v.$3;
  static dynamic _arg$$3<A, B, C>(f) => f<C>();
  static const Field<_t$_R0, dynamic> _f$$3 = Field(
    '\$3',
    _$$3,
    mode: FieldMode.tuple,
    arg: _arg$$3,
  );

  @override
  final MappableFields<_t$_R0> fields = const {
    #$1: _f$$1,
    #$2: _f$$2,
    #$3: _f$$3,
  };

  @override
  Function get typeFactory =>
      <A, B, C>(f) => f<_t$_R0<A, B, C>>();

  static _t$_R0<A, B, C> _instantiate<A, B, C>(DecodingData<_t$_R0> data) {
    return (data.dec(_f$$1), data.dec(_f$$2), data.dec(_f$$3));
  }

  @override
  final Function instantiate = _instantiate;

  static _t$_R0<A, B, C> fromMap<A, B, C>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<_t$_R0<A, B, C>>(map);
  }

  static _t$_R0<A, B, C> fromJson<A, B, C>(String json) {
    return ensureInitialized().decodeJson<_t$_R0<A, B, C>>(json);
  }
}

