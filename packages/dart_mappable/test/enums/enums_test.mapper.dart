// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
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
  State decode(dynamic value) {
    switch (value) {
      case r'On':
        return State.On;
      case r'off':
        return State.off;
      case r'itsCOMPLICATED':
        return State.itsCOMPLICATED;
      default:
        return State.values[1];
    }
  }

  @override
  dynamic encode(State self) {
    switch (self) {
      case State.On:
        return r'On';
      case State.off:
        return r'off';
      case State.itsCOMPLICATED:
        return r'itsCOMPLICATED';
    }
  }
}

extension StateMapperExtension on State {
  String toValue() {
    StateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<State>(this) as String;
  }
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
  Color decode(dynamic value) {
    switch (value) {
      case r'green':
        return Color.Green;
      case r'blue':
        return Color.BLUE;
      case r'blood-red':
        return Color.bloodRED;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Color self) {
    switch (self) {
      case Color.Green:
        return r'green';
      case Color.BLUE:
        return r'blue';
      case Color.bloodRED:
        return r'blood-red';
    }
  }
}

extension ColorMapperExtension on Color {
  String toValue() {
    ColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Color>(this) as String;
  }
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
  Items decode(dynamic value) {
    switch (value) {
      case 0:
        return Items.first;
      case 1:
        return Items.second;
      case 2:
        return Items.third;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Items self) {
    switch (self) {
      case Items.first:
        return 0;
      case Items.second:
        return 1;
      case Items.third:
        return 2;
    }
  }
}

extension ItemsMapperExtension on Items {
  dynamic toValue() {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Items>(this);
  }
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
  Status decode(dynamic value) {
    switch (value) {
      case 0:
        return Status.zero;
      case 200:
        return Status.success;
      case State.off:
        return Status.warning;
      case r'error$val':
        return Status.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Status self) {
    switch (self) {
      case Status.zero:
        return 0;
      case Status.success:
        return 200;
      case Status.warning:
        return State.off;
      case Status.error:
        return r'error$val';
    }
  }
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this);
  }
}

