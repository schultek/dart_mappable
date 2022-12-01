// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'enums_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <MapperElementBase>{
  // class mappers
  // enum mappers
  StateMapper._(),
  ColorMapper._(),
  ItemsMapper._(),
  StatusMapper._(),
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===




// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class StateMapper extends EnumMapper<p0.State> {
  StateMapper._();

  @override  p0.State decode(dynamic value) {
    switch (value) {
      case 'on': return p0.State.On;
      case 'off': return p0.State.off;
      case 'itsComplicated': return p0.State.itsCOMPLICATED;
      default: return p0.State.values[1];
    }
  }

  @override  dynamic encode(p0.State self) {
    switch (self) {
      case p0.State.On: return 'on';
      case p0.State.off: return 'off';
      case p0.State.itsCOMPLICATED: return 'itsComplicated';
    }
  }
}

extension StateMapperExtension on p0.State {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}

class ColorMapper extends EnumMapper<p0.Color> {
  ColorMapper._();

  @override  p0.Color decode(dynamic value) {
    switch (value) {
      case 'green': return p0.Color.Green;
      case 'blue': return p0.Color.BLUE;
      case 'blood-red': return p0.Color.bloodRED;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(p0.Color self) {
    switch (self) {
      case p0.Color.Green: return 'green';
      case p0.Color.BLUE: return 'blue';
      case p0.Color.bloodRED: return 'blood-red';
    }
  }
}

extension ColorMapperExtension on p0.Color {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}

class ItemsMapper extends EnumMapper<p0.Items> {
  ItemsMapper._();

  @override  p0.Items decode(dynamic value) {
    switch (value) {
      case 0: return p0.Items.first;
      case 1: return p0.Items.second;
      case 2: return p0.Items.third;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(p0.Items self) {
    switch (self) {
      case p0.Items.first: return 0;
      case p0.Items.second: return 1;
      case p0.Items.third: return 2;
    }
  }
}

extension ItemsMapperExtension on p0.Items {
  dynamic toValue() => Mapper.toValue(this);
}

class StatusMapper extends EnumMapper<p0.Status> {
  StatusMapper._();

  @override  p0.Status decode(dynamic value) {
    switch (value) {
      case 0: return p0.Status.zero;
      case 200: return p0.Status.success;
      case 'error': return p0.Status.error;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(p0.Status self) {
    switch (self) {
      case p0.Status.zero: return 0;
      case p0.Status.success: return 200;
      case p0.Status.error: return 'error';
    }
  }
}

extension StatusMapperExtension on p0.Status {
  dynamic toValue() => Mapper.toValue(this);
}


// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(MapperElementBase<T> mapper) => i.use<T>(mapper);
  static MapperElementBase<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<MapperElementBase> mappers) => i.useAll(mappers);

  static MapperElementBase<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<MapperElementBase> getAll() => i.getAll();
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
