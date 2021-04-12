import 'dart:convert';
import 'package:dart_mappable_example/main.dart';

// ignore_for_file: unnecessary_cast

extension PersonMapper on Person {
  static Person fromMap(Map<String, dynamic> map) => Person(map.get('nameabc'), map.get('age'), car: map.getOpt('car'), isAdmin: map.getOpt('isAdmin') ?? false, nums: map.getListOpt('nums') ?? const [], cars: map.getList('cars'));
  Map<String, dynamic> toMap() => {'nameabc': nameabc, 'age': age, 'car': car?.toMap(), 'isAdmin': isAdmin, 'nums': nums, 'cars': cars.map((c) => c.toMap()).toList()};
  Person copyWith({String? nameabc, dynamic? age, Car? car, bool? isAdmin, List<int>? nums, List<Car>? cars}) => Person(nameabc ?? this.nameabc, age ?? this.age, car: car ?? this.car, isAdmin: isAdmin ?? this.isAdmin, nums: nums ?? this.nums, cars: cars ?? this.cars);
}

extension AnimalMapper on Animal {
  static Animal fromMap(Map<String, dynamic> map) => Animal(map.get('age'));
  Map<String, dynamic> toMap() => {'age': age};
  Animal copyWith({int? age}) => Animal(age ?? this.age);
}

extension DogMapper on Dog {
  static Dog fromMap(Map<String, dynamic> map) => Dog(map.get('breed'), map.get('age'));
  Map<String, dynamic> toMap() => {...(this as Animal).toMap(), 'breed': breed};
  Dog copyWith({String? breed, int? age}) => Dog(breed ?? this.breed, age ?? this.age);
}

extension CarMapper on Car {
  static Car fromMap(Map<String, dynamic> map) => Car(map.get('miles'), map.get('brand'));
  Map<String, dynamic> toMap() => {'miles': miles, 'brand': brand.toStringValue()};
  Car copyWith({int? miles, Brand? brand}) => Car(miles ?? this.miles, brand ?? this.brand);
}


extension BrandMapper on Brand {
  static Brand fromString(String value) {
    switch (value) {
      case 'Toyota': return Brand.Toyota;
      case 'Audi': return Brand.Audi;
      case 'BMW': return Brand.BMW;
      default: throw MapperException('Cannot parse String $value to enum Brand');
    }
  }
  String toStringValue() {
    switch (this) {
      case Brand.Toyota: return 'Toyota';
      case Brand.Audi: return 'Audi';
      case Brand.BMW: return 'BMW';
    }
  }
}


typedef TypeDecoder<T, U> = T Function(U value);
typedef TypeEncoder<T, U> = U Function(T value);

Type typeOf<T>() => T;

abstract class TypeConverter<T> {
  T decode(dynamic value);
  dynamic encode(T value);

  factory TypeConverter.fromHandlers({required TypeDecoder<T, dynamic> decoder, required TypeEncoder<T, dynamic> encoder}) 
    => _CheckedTypeConverter<T, dynamic>(decoder: decoder, encoder: encoder);
}

class _CheckedTypeConverter<T, U> implements TypeConverter<T> {
  final TypeDecoder<T, U> decoder;
  final TypeEncoder<T, U> encoder;

  _CheckedTypeConverter({required this.decoder, required this.encoder});

  T decode(dynamic value) {
    if (value is U) {
      return decoder(value);
    } else {
      throw MapperException('Cannot decode value of type ${value.runtimeType} to type $T, because a value of type $U is expected.');
    }
  }

  U encode(T value) {
    return encoder(value);
  }
}

class _PrimitiveTypeConverter<T> implements TypeConverter<T> {
  final T Function(dynamic value) parse;
  const _PrimitiveTypeConverter(this.parse);

  @override T decode(dynamic value) => parse(value);
  @override dynamic encode(T value) => value;
}


var _typeConverters = <Type, TypeConverter>{
  // primitive type converters
  typeOf<String>(): _PrimitiveTypeConverter<String>((dynamic v) => v.toString()),
  typeOf<int>(): _PrimitiveTypeConverter<int>((dynamic v) => num.parse(v.toString()).round()),
  typeOf<double>(): _PrimitiveTypeConverter<double>((dynamic v) => double.parse(v.toString())),
  typeOf<num>(): _PrimitiveTypeConverter<num>((dynamic v) => num.parse(v.toString())),
  typeOf<bool>(): _PrimitiveTypeConverter<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  // generated type converters

  typeOf<Person>(): _CheckedTypeConverter<Person, Map<String, dynamic>>(decoder: PersonMapper.fromMap, encoder: (Person p) => p.toMap()),
  typeOf<Animal>(): _CheckedTypeConverter<Animal, Map<String, dynamic>>(decoder: AnimalMapper.fromMap, encoder: (Animal a) => a.toMap()),
  typeOf<Dog>(): _CheckedTypeConverter<Dog, Map<String, dynamic>>(decoder: DogMapper.fromMap, encoder: (Dog d) => d.toMap()),
  typeOf<Car>(): _CheckedTypeConverter<Car, Map<String, dynamic>>(decoder: CarMapper.fromMap, encoder: (Car c) => c.toMap()),

  typeOf<Brand>(): _CheckedTypeConverter<Brand, String>(decoder: BrandMapper.fromString, encoder: (Brand b) => b.toStringValue()),

};

class Mapper {
  Mapper._();

  static T decode<T>(dynamic value, {Type? toType}) {
    var type = toType ?? T;
    if (value.runtimeType == type) {
      return value as T;
    } else if (_typeConverters[type] != null) {
      return (_typeConverters[type] as TypeConverter<T>).decode(value);
    } else {
      throw MapperException('Cannot decode value $value of type ${value.runtimeType} to type $type. Unknown type. Did you forgot to include the class or register a custom type converter?');
    }
  }

  static dynamic encode(dynamic value) {
    var type = value.runtimeType;
    if (_typeConverters[type] != null) {
      return _typeConverters[type]!.encode(value);
    } else {
      throw MapperException('Cannot decode value to type $type. Unknown type. Did you forgot to include the class or register a custom type converter?');
    }
  }

  static T fromMap<T>(Map<String, dynamic> map) => decode<T>(map);
  static Map<String, dynamic> toMap(dynamic object) => encode(object) as Map<String, dynamic>;
  static T fromJson<T>(String json) => fromMap<T>(jsonDecode(json) as Map<String, dynamic>);
  static String toJson(dynamic object) => jsonEncode(toMap(object));
  
  static void use<T>(TypeConverter<T> converter) => _typeConverters[typeOf<T>()] = converter;
}

extension on Map<String, dynamic> {

  T get<T>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.decode<T>(this[key]!);
  }
  
  T? getOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return get<T>(key);
  }
  
  List<T> getList<T>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    } else if (this[key] is! List) {
      throw MapperException('Parameter ${this[key]} with key $key is not a List');
    }
    List value = this[key] as List<dynamic>;
    return value.map((dynamic item) => Mapper.decode<T>(item)).toList();
  }
  
  List<T>? getListOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getList<T>(key);
  }
  
  Map<K, V> getMap<K, V>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    } else if (this[key] is! Map) {
      throw MapperException('Parameter ${this[key]} with key $key is not a Map');
    }
    Map value = this[key] as Map<dynamic, dynamic>;
    return value.map((dynamic key, dynamic value) => MapEntry(Mapper.decode<K>(key), Mapper.decode<V>(value)));
  }
  
  Map<K, V>? getMapOpt<K, V>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getMap<K, V>(key);
  }
}

class MapperException implements Exception {
  final String message;
  const MapperException(this.message);
  
  @override
  String toString() => 'MapperException: $message';
}
