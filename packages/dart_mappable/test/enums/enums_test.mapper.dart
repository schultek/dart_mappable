// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enums_test.dart';

class StateMapper extends EnumMapper<State> {
  static MapperContainer container = MapperContainer(
    mappers: {StateMapper()},
  );

  static final fromValue = container.fromValue<State>;

  @override
  State decode(dynamic value) {
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
  dynamic encode(State self) {
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
  String toValue() => StateMapper.container.toValue(this) as String;
}

class ColorMapper extends EnumMapper<Color> {
  static MapperContainer container = MapperContainer(
    mappers: {ColorMapper()},
  );

  static final fromValue = container.fromValue<Color>;

  @override
  Color decode(dynamic value) {
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
  dynamic encode(Color self) {
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
  String toValue() => ColorMapper.container.toValue(this) as String;
}

class ItemsMapper extends EnumMapper<Items> {
  static MapperContainer container = MapperContainer(
    mappers: {ItemsMapper()},
  );

  static final fromValue = container.fromValue<Items>;

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
  dynamic toValue() => ItemsMapper.container.toValue(this);
}

class StatusMapper extends EnumMapper<Status> {
  static MapperContainer container = MapperContainer(
    mappers: {StatusMapper()},
  );

  static final fromValue = container.fromValue<Status>;

  @override
  Status decode(dynamic value) {
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
  dynamic encode(Status self) {
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
  dynamic toValue() => StatusMapper.container.toValue(this);
}
