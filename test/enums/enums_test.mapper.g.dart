import 'package:dart_mappable/internals.dart';

import 'enums_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  // enum mappers
  StateMapper._(),
  ColorMapper._(),
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===




// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class StateMapper extends EnumMapper<State> {
  StateMapper._();

  @override  State fromString(String value) {
    switch (value) {
      case 'on': return State.On;
      case 'off': return State.off;
      case 'itsComplicated': return State.itsCOMPLICATED;
      default: return State.values[1];
    }
  }

  @override  String toStringValue(State value) {
    switch (value) {
      case State.On: return 'on';
      case State.off: return 'off';
      case State.itsCOMPLICATED: return 'itsComplicated';
    }
  }
}

extension StateMapperExtension on State {
  String toStringValue() => Mapper.toValue(this) as String;
}

class ColorMapper extends EnumMapper<Color> {
  ColorMapper._();

  @override  Color fromString(String value) {
    switch (value) {
      case 'green': return Color.Green;
      case 'blue': return Color.BLUE;
      case 'blood-red': return Color.bloodRED;
      default: throw MapperException('Cannot parse String $value to enum Color');
    }
  }

  @override  String toStringValue(Color value) {
    switch (value) {
      case Color.Green: return 'green';
      case Color.BLUE: return 'blue';
      case Color.bloodRED: return 'blood-red';
    }
  }
}

extension ColorMapperExtension on Color {
  String toStringValue() => Mapper.toValue(this) as String;
}


// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static late MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable {
  BaseMapper? get _mapper => Mapper.get(runtimeType);

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) ||
      (runtimeType == other.runtimeType && (_mapper?.equals(this, other) 
      ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => _getOr(
      key, hooks, () => throw MapperException('Parameter $key is required.'));

  T? getOpt<T>(String key, {MappingHooks? hooks}) =>
      _getOr(key, hooks, () => null);

  T _getOr<T>(String key, MappingHooks? hooks, T Function() or) =>
      hooks.decode(this[key], (v) => v == null ? or() : Mapper.fromValue<T>(v));
}
