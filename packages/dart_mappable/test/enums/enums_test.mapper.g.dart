import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'enums_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
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

class StateMapper extends EnumMapper<State> {
  StateMapper._();

  @override  State decode(dynamic value) {
    switch (value) {
      case 'on': return State.On;
      case 'off': return State.off;
      case 'itsComplicated': return State.itsCOMPLICATED;
      default: return State.values[1];
    }
  }

  @override  dynamic encode(State self) {
    switch (self) {
      case State.On: return 'on';
      case State.off: return 'off';
      case State.itsCOMPLICATED: return 'itsComplicated';
    }
  }
}

extension StateMapperExtension on State {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}

class ColorMapper extends EnumMapper<Color> {
  ColorMapper._();

  @override  Color decode(dynamic value) {
    switch (value) {
      case 'green': return Color.Green;
      case 'blue': return Color.BLUE;
      case 'blood-red': return Color.bloodRED;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(Color self) {
    switch (self) {
      case Color.Green: return 'green';
      case Color.BLUE: return 'blue';
      case Color.bloodRED: return 'blood-red';
    }
  }
}

extension ColorMapperExtension on Color {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}

class ItemsMapper extends EnumMapper<Items> {
  ItemsMapper._();

  @override  Items decode(dynamic value) {
    switch (value) {
      case 0: return Items.first;
      case 1: return Items.second;
      case 2: return Items.third;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(Items self) {
    switch (self) {
      case Items.first: return 0;
      case Items.second: return 1;
      case Items.third: return 2;
    }
  }
}

extension ItemsMapperExtension on Items {
  dynamic toValue() => Mapper.toValue(this);
}

class StatusMapper extends EnumMapper<Status> {
  StatusMapper._();

  @override  Status decode(dynamic value) {
    switch (value) {
      case 0: return Status.zero;
      case 200: return Status.success;
      case 'error': return Status.error;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(Status self) {
    switch (self) {
      case Status.zero: return 0;
      case Status.success: return 200;
      case Status.error: return 'error';
    }
  }
}

extension StatusMapperExtension on Status {
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

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
