// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Union {

@MappableField(key: 'mykey') int get value;
/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnionCopyWith<Union> get copyWith => _$UnionCopyWithImpl<Union>(this as Union, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Union&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Union(value: $value)';
}


}

/// @nodoc
abstract mixin class $UnionCopyWith<$Res>  {
  factory $UnionCopyWith(Union value, $Res Function(Union) _then) = _$UnionCopyWithImpl;
@useResult
$Res call({
@MappableField(key: 'mykey') int value
});




}
/// @nodoc
class _$UnionCopyWithImpl<$Res>
    implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._self, this._then);

  final Union _self;
  final $Res Function(Union) _then;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Union].
extension UnionPatterns on Union {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Data value)?  data,TResult Function( Loading value)?  loading,TResult Function( ErrorDetails value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that);case Loading() when loading != null:
return loading(_that);case ErrorDetails() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Data value)  data,required TResult Function( Loading value)  loading,required TResult Function( ErrorDetails value)  error,}){
final _that = this;
switch (_that) {
case Data():
return data(_that);case Loading():
return loading(_that);case ErrorDetails():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Data value)?  data,TResult? Function( Loading value)?  loading,TResult? Function( ErrorDetails value)?  error,}){
final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that);case Loading() when loading != null:
return loading(_that);case ErrorDetails() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@MappableField(key: 'mykey')  int value)?  data,TResult Function( int value)?  loading,TResult Function( int value,  String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that.value);case Loading() when loading != null:
return loading(_that.value);case ErrorDetails() when error != null:
return error(_that.value,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@MappableField(key: 'mykey')  int value)  data,required TResult Function( int value)  loading,required TResult Function( int value,  String? message)  error,}) {final _that = this;
switch (_that) {
case Data():
return data(_that.value);case Loading():
return loading(_that.value);case ErrorDetails():
return error(_that.value,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@MappableField(key: 'mykey')  int value)?  data,TResult? Function( int value)?  loading,TResult? Function( int value,  String? message)?  error,}) {final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that.value);case Loading() when loading != null:
return loading(_that.value);case ErrorDetails() when error != null:
return error(_that.value,_that.message);case _:
  return null;

}
}

}

/// @nodoc

@MappableClass(discriminatorValue: 'data')
class Data implements Union {
  const Data(@MappableField(key: 'mykey') this.value);
  

@override@MappableField(key: 'mykey') final  int value;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Union.data(value: $value)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> implements $UnionCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@override @useResult
$Res call({
@MappableField(key: 'mykey') int value
});




}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Data(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc

@MappableClass(discriminatorValue: 'loading')
class Loading implements Union {
  const Loading(this.value);
  

@override final  int value;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Union.loading(value: $value)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $UnionCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 int value
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Loading(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc

@MappableClass(discriminatorValue: 'error')
class ErrorDetails implements Union {
  const ErrorDetails(this.value, [this.message]);
  

@override final  int value;
 final  String? message;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDetailsCopyWith<ErrorDetails> get copyWith => _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorDetails&&(identical(other.value, value) || other.value == value)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,value,message);

@override
String toString() {
  return 'Union.error(value: $value, message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorDetailsCopyWith<$Res> implements $UnionCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(ErrorDetails value, $Res Function(ErrorDetails) _then) = _$ErrorDetailsCopyWithImpl;
@override @useResult
$Res call({
 int value, String? message
});




}
/// @nodoc
class _$ErrorDetailsCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(this._self, this._then);

  final ErrorDetails _self;
  final $Res Function(ErrorDetails) _then;

/// Create a copy of Union
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? message = freezed,}) {
  return _then(ErrorDetails(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
