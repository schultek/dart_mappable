// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enums_test.dart';

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
    r'On' => State.On,
    r'off' => State.off,
    r'itsCOMPLICATED' => State.itsCOMPLICATED,
    _ => State.values[1],
  };

  @override
  dynamic encode(State self) => switch (self) {
    State.On => r'On',
    State.off => r'off',
    State.itsCOMPLICATED => r'itsCOMPLICATED',
  };
}

extension StateMapperExtension on State {
  String toValue() {
    StateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<State>(this) as String;
  }

  String toName() => switch (this) {
    State.On => r'On',
    State.off => r'off',
    State.itsCOMPLICATED => r'itsCOMPLICATED',
  };
}

class ColorMapper extends EnumMapper<Color> {
  ColorMapper._();

  static ColorMapper? _instance;
  static ColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ColorMapper._());
    }
    return _instance!;
  }

  static Color fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Color decode(dynamic value) => switch (value) {
    r'green' => Color.Green,
    r'blue' => Color.BLUE,
    r'blood-red' => Color.bloodRED,
    _ => throw MapperException.unknownEnumValue(value),
  };

  @override
  dynamic encode(Color self) => switch (self) {
    Color.Green => r'green',
    Color.BLUE => r'blue',
    Color.bloodRED => r'blood-red',
  };
}

extension ColorMapperExtension on Color {
  String toValue() {
    ColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Color>(this) as String;
  }

  String toName() => switch (this) {
    Color.Green => r'Green',
    Color.BLUE => r'BLUE',
    Color.bloodRED => r'bloodRED',
  };
}

class ItemsMapper extends EnumMapper<Items> {
  ItemsMapper._();

  static ItemsMapper? _instance;
  static ItemsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemsMapper._());
    }
    return _instance!;
  }

  static Items fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Items decode(dynamic value) => switch (value) {
    0 => Items.first,
    1 => Items.second,
    2 => Items.third,
    _ => throw MapperException.unknownEnumValue(value),
  };

  @override
  dynamic encode(Items self) => switch (self) {
    Items.first => 0,
    Items.second => 1,
    Items.third => 2,
  };
}

extension ItemsMapperExtension on Items {
  dynamic toValue() {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Items>(this);
  }

  String toName() => switch (this) {
    Items.first => r'first',
    Items.second => r'second',
    Items.third => r'third',
  };
}

class StatusMapper extends EnumMapper<Status> {
  StatusMapper._();

  static StatusMapper? _instance;
  static StatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StatusMapper._());
    }
    return _instance!;
  }

  static Status fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Status decode(dynamic value) => switch (value) {
    0 => Status.zero,
    200 => Status.success,
    State.off => Status.warning,
    r'error$val' => Status.error,
    _ => throw MapperException.unknownEnumValue(value),
  };

  @override
  dynamic encode(Status self) => switch (self) {
    Status.zero => 0,
    Status.success => 200,
    Status.warning => State.off,
    Status.error => r'error$val',
  };
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this);
  }

  String toName() => switch (this) {
    Status.zero => r'zero',
    Status.success => r'success',
    Status.warning => r'warning',
    Status.error => 'exception',
  };
}

