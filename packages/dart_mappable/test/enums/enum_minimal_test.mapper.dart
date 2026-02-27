// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_minimal_test.dart';

class StateMapper extends EnumMapper<State> {
  StateMapper._();

  static StateMapper? _instance;
  static StateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StateMapper._());
    }
    return _instance!;
  }

  static State fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  State decode(dynamic value) => switch (value) {
    0 => State.pending,
    200 => State.success,
    _ => throw MapperException.unknownEnumValue(value),
  };

  @override
  dynamic encode(State self) => switch (self) {
    State.pending => 0,
    State.success => 200,
  };
}

extension StateMapperExtension on State {
  dynamic toValue() {
    StateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<State>(this);
  }

  dynamic get value => toValue();

  String toName() => switch (this) {
    State.pending => r'pending',
    State.success => 'ok',
  };

  String get name => toName();
}

