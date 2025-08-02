// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Union {
  @MappableField(key: 'mykey')
  int get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'mykey') int value) data,
    required TResult Function(int value) loading,
    required TResult Function(int value, String? message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'mykey') int value)? data,
    TResult? Function(int value)? loading,
    TResult? Function(int value, String? message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'mykey') int value)? data,
    TResult Function(int value)? loading,
    TResult Function(int value, String? message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnionCopyWith<Union> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionCopyWith<$Res> {
  factory $UnionCopyWith(Union value, $Res Function(Union) then) =
      _$UnionCopyWithImpl<$Res, Union>;
  @useResult
  $Res call({@MappableField(key: 'mykey') int value});
}

/// @nodoc
class _$UnionCopyWithImpl<$Res, $Val extends Union>
    implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $UnionCopyWith<$Res> {
  factory _$$DataImplCopyWith(
    _$DataImpl value,
    $Res Function(_$DataImpl) then,
  ) = __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@MappableField(key: 'mykey') int value});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
    : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$DataImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'data')
class _$DataImpl implements Data {
  const _$DataImpl(@MappableField(key: 'mykey') this.value);

  @override
  @MappableField(key: 'mykey')
  final int value;

  @override
  String toString() {
    return 'Union.data(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'mykey') int value) data,
    required TResult Function(int value) loading,
    required TResult Function(int value, String? message) error,
  }) {
    return data(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'mykey') int value)? data,
    TResult? Function(int value)? loading,
    TResult? Function(int value, String? message)? error,
  }) {
    return data?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'mykey') int value)? data,
    TResult Function(int value)? loading,
    TResult Function(int value, String? message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements Union {
  const factory Data(@MappableField(key: 'mykey') final int value) = _$DataImpl;

  @override
  @MappableField(key: 'mykey')
  int get value;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> implements $UnionCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$LoadingImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'loading')
class _$LoadingImpl implements Loading {
  const _$LoadingImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'Union.loading(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'mykey') int value) data,
    required TResult Function(int value) loading,
    required TResult Function(int value, String? message) error,
  }) {
    return loading(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'mykey') int value)? data,
    TResult? Function(int value)? loading,
    TResult? Function(int value, String? message)? error,
  }) {
    return loading?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'mykey') int value)? data,
    TResult Function(int value)? loading,
    TResult Function(int value, String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements Union {
  const factory Loading(final int value) = _$LoadingImpl;

  @override
  int get value;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDetailsImplCopyWith<$Res>
    implements $UnionCopyWith<$Res> {
  factory _$$ErrorDetailsImplCopyWith(
    _$ErrorDetailsImpl value,
    $Res Function(_$ErrorDetailsImpl) then,
  ) = __$$ErrorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String? message});
}

/// @nodoc
class __$$ErrorDetailsImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$ErrorDetailsImpl>
    implements _$$ErrorDetailsImplCopyWith<$Res> {
  __$$ErrorDetailsImplCopyWithImpl(
    _$ErrorDetailsImpl _value,
    $Res Function(_$ErrorDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? message = freezed}) {
    return _then(
      _$ErrorDetailsImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as int,
        freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'error')
class _$ErrorDetailsImpl implements ErrorDetails {
  const _$ErrorDetailsImpl(this.value, [this.message]);

  @override
  final int value;
  @override
  final String? message;

  @override
  String toString() {
    return 'Union.error(value: $value, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailsImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, message);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailsImplCopyWith<_$ErrorDetailsImpl> get copyWith =>
      __$$ErrorDetailsImplCopyWithImpl<_$ErrorDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'mykey') int value) data,
    required TResult Function(int value) loading,
    required TResult Function(int value, String? message) error,
  }) {
    return error(value, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'mykey') int value)? data,
    TResult? Function(int value)? loading,
    TResult? Function(int value, String? message)? error,
  }) {
    return error?.call(value, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'mykey') int value)? data,
    TResult Function(int value)? loading,
    TResult Function(int value, String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(value, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements Union {
  const factory ErrorDetails(final int value, [final String? message]) =
      _$ErrorDetailsImpl;

  @override
  int get value;
  String? get message;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDetailsImplCopyWith<_$ErrorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
