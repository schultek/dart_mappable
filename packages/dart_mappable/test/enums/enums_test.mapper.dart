// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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
  State decodeValue(dynamic value) {
    switch (value) {
      case 'On':
        return State.On;
      case 'off':
        return State.off;
      case 'itsCOMPLICATED':
        return State.itsCOMPLICATED;
      default:
        return State.values[1];
    }
  }

  @override
  dynamic encodeValue(State self) {
    switch (self) {
      case State.On:
        return 'On';
      case State.off:
        return 'off';
      case State.itsCOMPLICATED:
        return 'itsCOMPLICATED';
    }
  }
}

extension StateMapperExtension on State {
  String toValue() {
    StateMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
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
  Color decodeValue(dynamic value) {
    switch (value) {
      case 'green':
        return Color.Green;
      case 'blue':
        return Color.BLUE;
      case 'blood-red':
        return Color.bloodRED;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encodeValue(Color self) {
    switch (self) {
      case Color.Green:
        return 'green';
      case Color.BLUE:
        return 'blue';
      case Color.bloodRED:
        return 'blood-red';
    }
  }
}

extension ColorMapperExtension on Color {
  String toValue() {
    ColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
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
  Items decodeValue(dynamic value) {
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
  dynamic encodeValue(Items self) {
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
    return MapperContainer.globals.toValue(this);
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
  Status decodeValue(dynamic value) {
    switch (value) {
      case 0:
        return Status.zero;
      case 200:
        return Status.success;
      case 'error':
        return Status.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encodeValue(Status self) {
    switch (self) {
      case Status.zero:
        return 0;
      case Status.success:
        return 200;
      case Status.error:
        return 'error';
    }
  }
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this);
  }
}
