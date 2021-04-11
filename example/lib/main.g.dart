import 'dart:convert';
import 'package:dart_mappable_example/main.dart';

// ignore_for_file: unnecessary_cast

extension PersonMapper on Person {
  static Person fromMap(Map<String, dynamic> map) => Person(map.get('name'), map.get('age'), car: map.getOpt('car'), isAdmin: map.getOpt('isAdmin') ?? false, nums: map.getListOpt('nums') ?? const [], cars: map.getList('cars'));
  Map<String, dynamic> toMap() => {'name': name, 'age': age, 'car': car?.toMap(), 'isAdmin': isAdmin, 'nums': nums, 'cars': cars.map((c) => c.toMap()).toList()};
  Person copyWith({String? name, dynamic? age, Car? car, bool? isAdmin, List<int>? nums, List<Car>? cars}) => Person(name ?? this.name, age ?? this.age, car: car ?? this.car, isAdmin: isAdmin ?? this.isAdmin, nums: nums ?? this.nums, cars: cars ?? this.cars);
}

extension CarMapper on Car {
  static Car fromMap(Map<String, dynamic> map) => Car(map.get('miles'), map.get('brand'));
  Map<String, dynamic> toMap() => {'miles': miles, 'brand': brand.toStringValue()};
  Car copyWith({int? miles, Brand? brand}) => Car(miles ?? this.miles, brand ?? this.brand);
}


extension BrandMapper on Brand {
  static Brand fromString(String value) {
    int index = Brand.values.indexWhere((e) => e.toString().toLowerCase() == "Brand."+value.toLowerCase());
    if (index == -1) {
      throw MapperError("Enum Brand does not contain value $value, available values are ${Brand.values.join(", ")}");
    }
    return Brand.values[index];
  }
  String toStringValue() => toString().toLowerCase().split(".")[1];
}


typedef ObjectFactory = dynamic Function(Map<String, dynamic> map);
typedef EnumFactory = dynamic Function(String value);
Type typeOf<T>() => T;

var objectFactories = <Type, ObjectFactory>{
 typeOf<Person>(): PersonMapper.fromMap,
 typeOf<Car>(): CarMapper.fromMap,
};

var enumFactories = <Type, EnumFactory>{
 typeOf<Brand>(): BrandMapper.fromString,
};

class ObjectMapper {
  ObjectMapper._();

  static T fromMap<T>(Map<String, dynamic> map) {
    return objectFactories[T]!(map) as T;
  }
  static Map<String, dynamic> toMap(dynamic object) {
    return object.toMap();
  }
  static T fromJson<T>(String json) {
    return fromMap<T>(jsonDecode(json));
  }
  static String toJson(dynamic object) {
    return jsonEncode(toMap(object));
  }
}

extension MapMethods on Map<String, dynamic> {

  T get<T>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    }
    return _to<T>(this[key]!);
  }
  
  T? getOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return get<T>(key);
  }
  
  List<T> getList<T>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    } else if (this[key] is! List) {
      throw MapperError("Parameter ${this[key]} with key $key is not a List");
    }
    List value = this[key] as List;
    return value.map((item) => _to<T>(item)).toList();
  }
  
  List<T>? getListOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getList<T>(key);
  }
  
  Map<K, V> getMap<K, V>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    } else if (this[key] is! Map) {
      throw MapperError("Parameter ${this[key]} with key $key is not a Map");
    }
    Map value = this[key] as Map;
    return value.map((key, value) => MapEntry(_to<K>(key), _to<V>(value)));
  }
  
  Map<K, V>? getMapOpt<K, V>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getMap<K, V>(key);
  }
}

T _to<T>(dynamic value) {
  if (value is T) {
    return value;
  } else if (T == String) {
    return value.toString() as T;
  } else if (T == int) {
    return num.parse(value.toString()).round() as T;
  } else if (T == double) {
    return double.parse(value.toString()) as T;
  } else if (T == bool) {
    return (value is num ? value != 0 : value.toString() == "true") as T;
  } else if (objectFactories[T] != null) {
    if (value is Map<String, dynamic>) return ObjectMapper.fromMap(value);
    else return ObjectMapper.fromJson(value.toString());
  } else if (enumFactories[T] != null) {
    return enumFactories[T]!(value.toString()) as T;
  } else {
    throw MapperError("Cannot transform value $value of type ${value.runtimeType} to type $T");
  }
}

class MapperError {
  final String message;
  const MapperError(this.message);
  
  @override
  String toString() => "MapperError: $message";
}
