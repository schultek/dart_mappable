// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'field_ignoring_test.dart';

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

  static String _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field('name', _$name);
  static String _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static String? _$passwordValue(User v) => v.passwordValue;
  static const Field<User, String> _f$passwordValue = Field(
    'passwordValue',
    _$passwordValue,
    includeToJson: false,
  );
  static DateTime? _$lastLoginValue(User v) => v.lastLoginValue;
  static const Field<User, DateTime> _f$lastLoginValue = Field(
    'lastLoginValue',
    _$lastLoginValue,
    includeFromJson: false,
  );
  static String? _$secretFieldValue(User v) => v.secretFieldValue;
  static const Field<User, String> _f$secretFieldValue = Field(
    'secretFieldValue',
    _$secretFieldValue,
    includeIfNull: true,
  );

  @override
  final MappableFields<User> fields = const {
    #name: _f$name,
    #email: _f$email,
    #passwordValue: _f$passwordValue,
    #lastLoginValue: _f$lastLoginValue,
    #secretFieldValue: _f$secretFieldValue,
  };

  static User _instantiate(DecodingData data) {
    return User(
      data.dec(_f$name),
      data.dec(_f$email),
      data.dec(_f$passwordValue),
      null,
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
  $R call({
    String? name,
    String? email,
    String? passwordValue,
    DateTime? lastLoginValue,
  });
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    String? email,
    Object? passwordValue = $none,
    Object? lastLoginValue = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (email != null) #email: email,
      if (passwordValue != $none) #passwordValue: passwordValue,
      if (lastLoginValue != $none) #lastLoginValue: lastLoginValue,
    }),
  );
  @override
  User $make(CopyWithData data) => User(
    data.get(#name, or: $value.name),
    data.get(#email, or: $value.email),
    data.get(#passwordValue, or: $value.passwordValue),
    data.get(#lastLoginValue, or: $value.lastLoginValue),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserWithIgnoreNullMapper extends ClassMapperBase<UserWithIgnoreNull> {
  UserWithIgnoreNullMapper._();

  static UserWithIgnoreNullMapper? _instance;
  static UserWithIgnoreNullMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserWithIgnoreNullMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserWithIgnoreNull';

  static String _$name(UserWithIgnoreNull v) => v.name;
  static const Field<UserWithIgnoreNull, String> _f$name = Field(
    'name',
    _$name,
  );
  static String? _$emailValue(UserWithIgnoreNull v) => v.emailValue;
  static const Field<UserWithIgnoreNull, String> _f$emailValue = Field(
    'emailValue',
    _$emailValue,
    includeIfNull: true,
  );
  static String? _$passwordValue(UserWithIgnoreNull v) => v.passwordValue;
  static const Field<UserWithIgnoreNull, String> _f$passwordValue = Field(
    'passwordValue',
    _$passwordValue,
    includeToJson: false,
  );

  @override
  final MappableFields<UserWithIgnoreNull> fields = const {
    #name: _f$name,
    #emailValue: _f$emailValue,
    #passwordValue: _f$passwordValue,
  };
  @override
  final bool ignoreNull = true;

  static UserWithIgnoreNull _instantiate(DecodingData data) {
    return UserWithIgnoreNull(
      data.dec(_f$name),
      data.dec(_f$emailValue),
      data.dec(_f$passwordValue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserWithIgnoreNull fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserWithIgnoreNull>(map);
  }

  static UserWithIgnoreNull fromJson(String json) {
    return ensureInitialized().decodeJson<UserWithIgnoreNull>(json);
  }
}

mixin UserWithIgnoreNullMappable {
  String toJson() {
    return UserWithIgnoreNullMapper.ensureInitialized()
        .encodeJson<UserWithIgnoreNull>(this as UserWithIgnoreNull);
  }

  Map<String, dynamic> toMap() {
    return UserWithIgnoreNullMapper.ensureInitialized()
        .encodeMap<UserWithIgnoreNull>(this as UserWithIgnoreNull);
  }

  UserWithIgnoreNullCopyWith<
    UserWithIgnoreNull,
    UserWithIgnoreNull,
    UserWithIgnoreNull
  >
  get copyWith =>
      _UserWithIgnoreNullCopyWithImpl<UserWithIgnoreNull, UserWithIgnoreNull>(
        this as UserWithIgnoreNull,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserWithIgnoreNullMapper.ensureInitialized().stringifyValue(
      this as UserWithIgnoreNull,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserWithIgnoreNullMapper.ensureInitialized().equalsValue(
      this as UserWithIgnoreNull,
      other,
    );
  }

  @override
  int get hashCode {
    return UserWithIgnoreNullMapper.ensureInitialized().hashValue(
      this as UserWithIgnoreNull,
    );
  }
}

extension UserWithIgnoreNullValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserWithIgnoreNull, $Out> {
  UserWithIgnoreNullCopyWith<$R, UserWithIgnoreNull, $Out>
  get $asUserWithIgnoreNull => $base.as(
    (v, t, t2) => _UserWithIgnoreNullCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UserWithIgnoreNullCopyWith<
  $R,
  $In extends UserWithIgnoreNull,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? emailValue, String? passwordValue});
  UserWithIgnoreNullCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserWithIgnoreNullCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserWithIgnoreNull, $Out>
    implements UserWithIgnoreNullCopyWith<$R, UserWithIgnoreNull, $Out> {
  _UserWithIgnoreNullCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserWithIgnoreNull> $mapper =
      UserWithIgnoreNullMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    Object? emailValue = $none,
    Object? passwordValue = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (emailValue != $none) #emailValue: emailValue,
      if (passwordValue != $none) #passwordValue: passwordValue,
    }),
  );
  @override
  UserWithIgnoreNull $make(CopyWithData data) => UserWithIgnoreNull(
    data.get(#name, or: $value.name),
    data.get(#emailValue, or: $value.emailValue),
    data.get(#passwordValue, or: $value.passwordValue),
  );

  @override
  UserWithIgnoreNullCopyWith<$R2, UserWithIgnoreNull, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserWithIgnoreNullCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MixedFieldModesMapper extends ClassMapperBase<MixedFieldModes> {
  MixedFieldModesMapper._();

  static MixedFieldModesMapper? _instance;
  static MixedFieldModesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MixedFieldModesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MixedFieldModes';

  static String _$name(MixedFieldModes v) => v.name;
  static const Field<MixedFieldModes, String> _f$name = Field('name', _$name);
  static String? _$computedFieldValue(MixedFieldModes v) =>
      v.computedFieldValue;
  static const Field<MixedFieldModes, String> _f$computedFieldValue = Field(
    'computedFieldValue',
    _$computedFieldValue,
    includeIfNull: true,
  );
  static String? _$ignoredFieldValue(MixedFieldModes v) => v.ignoredFieldValue;
  static const Field<MixedFieldModes, String> _f$ignoredFieldValue = Field(
    'ignoredFieldValue',
    _$ignoredFieldValue,
    includeFromJson: false,
    includeToJson: false,
  );

  @override
  final MappableFields<MixedFieldModes> fields = const {
    #name: _f$name,
    #computedFieldValue: _f$computedFieldValue,
    #ignoredFieldValue: _f$ignoredFieldValue,
  };

  static MixedFieldModes _instantiate(DecodingData data) {
    return MixedFieldModes(
      data.dec(_f$name),
      data.dec(_f$computedFieldValue),
      null,
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MixedFieldModes fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MixedFieldModes>(map);
  }

  static MixedFieldModes fromJson(String json) {
    return ensureInitialized().decodeJson<MixedFieldModes>(json);
  }
}

mixin MixedFieldModesMappable {
  String toJson() {
    return MixedFieldModesMapper.ensureInitialized()
        .encodeJson<MixedFieldModes>(this as MixedFieldModes);
  }

  Map<String, dynamic> toMap() {
    return MixedFieldModesMapper.ensureInitialized().encodeMap<MixedFieldModes>(
      this as MixedFieldModes,
    );
  }

  MixedFieldModesCopyWith<MixedFieldModes, MixedFieldModes, MixedFieldModes>
  get copyWith =>
      _MixedFieldModesCopyWithImpl<MixedFieldModes, MixedFieldModes>(
        this as MixedFieldModes,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MixedFieldModesMapper.ensureInitialized().stringifyValue(
      this as MixedFieldModes,
    );
  }

  @override
  bool operator ==(Object other) {
    return MixedFieldModesMapper.ensureInitialized().equalsValue(
      this as MixedFieldModes,
      other,
    );
  }

  @override
  int get hashCode {
    return MixedFieldModesMapper.ensureInitialized().hashValue(
      this as MixedFieldModes,
    );
  }
}

extension MixedFieldModesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MixedFieldModes, $Out> {
  MixedFieldModesCopyWith<$R, MixedFieldModes, $Out> get $asMixedFieldModes =>
      $base.as((v, t, t2) => _MixedFieldModesCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MixedFieldModesCopyWith<$R, $In extends MixedFieldModes, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    String? computedFieldValue,
    String? ignoredFieldValue,
  });
  MixedFieldModesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MixedFieldModesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MixedFieldModes, $Out>
    implements MixedFieldModesCopyWith<$R, MixedFieldModes, $Out> {
  _MixedFieldModesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MixedFieldModes> $mapper =
      MixedFieldModesMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    Object? computedFieldValue = $none,
    Object? ignoredFieldValue = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (computedFieldValue != $none) #computedFieldValue: computedFieldValue,
      if (ignoredFieldValue != $none) #ignoredFieldValue: ignoredFieldValue,
    }),
  );
  @override
  MixedFieldModes $make(CopyWithData data) => MixedFieldModes(
    data.get(#name, or: $value.name),
    data.get(#computedFieldValue, or: $value.computedFieldValue),
    data.get(#ignoredFieldValue, or: $value.ignoredFieldValue),
  );

  @override
  MixedFieldModesCopyWith<$R2, MixedFieldModes, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MixedFieldModesCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

