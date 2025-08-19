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
  static const Field<User, UserType> _f$type = Field('type', _$type);

  @override
  final MappableFields<User> fields = const {
    #name: _f$name,
    #age: _f$age,
    #tags: _f$tags,
    #type: _f$type,
  };

  static User _instantiate(DecodingData data) {
    return User(
      name: data.dec(_f$name),
      age: data.dec(_f$age),
      tags: data.dec(_f$tags),
      type: data.dec(_f$type),
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
  $R call({String? name, int? age, List<String>? tags, UserType? type});
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
  $R call({String? name, int? age, List<String>? tags, UserType? type}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (age != null) #age: age,
          if (tags != null) #tags: tags,
          if (type != null) #type: type,
        }),
      );
  @override
  User $make(CopyWithData data) => User(
    name: data.get(#name, or: $value.name),
    age: data.get(#age, or: $value.age),
    tags: data.get(#tags, or: $value.tags),
    type: data.get(#type, or: $value.type),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

