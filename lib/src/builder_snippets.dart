/// A set of Mappers for primitive types
const defaultMappers = '''
  // primitive mappers
  typeOf<String>(): _PrimitiveMapper<String>((dynamic v) => v.toString()),
  typeOf<int>(): _PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  typeOf<double>(): _PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  typeOf<num>(): _PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  typeOf<bool>(): _PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  // generated mappers''';

/// Declarations for the Mapper class
const mapperCode = r'''
abstract class Mapper<T> {

  T decode(dynamic value);
  dynamic encode(T self);

  String stringify(T self);
  int hash(T self);
  bool equals(T self, Object? other);

  Mapper._();

  static T fromValue<T>(dynamic value, {Type? toType}) {
    var type = toType ?? T;
    if (value.runtimeType == type) {
      return value as T;
    } else if (_mappers[type] != null) {
      return (_mappers[type] as Mapper<T>).decode(value);
    } else {
      throw MapperException(
          'Cannot decode value $value of type ${value.runtimeType} to type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static dynamic toValue(dynamic value) {
    var type = value.runtimeType;
    if (_mappers[type] != null) {
      return _mappers[type]!.encode(value);
    } else {
      throw MapperException(
          'Cannot decode value to type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  static Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
    }
  }

  static T fromJson<T>(String json) => fromValue<T>(jsonDecode(json) as Map<String, dynamic>);
  static String toJson(dynamic object) => jsonEncode(toValue(object));

  static bool isEqual(dynamic value, Object? other) {
    var type = value.runtimeType;
    if (_mappers[type] != null) {
      return _mappers[type]!.equals(value, other);
    } else {
      throw MapperException(
          'Cannot compare value of type $type for equality. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static String asString(dynamic value) {
    var type = value.runtimeType;
    if (_mappers[type] != null) {
      return _mappers[type]!.stringify(value);
    } else {
      throw MapperException(
          'Cannot stringify value of type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static void use<T>(Mapper<T> mapper) => _mappers[typeOf<T>()] = mapper;
}

abstract class Mappable<T> {
  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() => _mappers[T]?.encode(this) as Map<String, dynamic>? ?? {};

  @override String toString() => _mappers[T]?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => _mappers[T]?.equals(this, other) ?? this == other;
  @override int get hashCode => _mappers[T]?.hash(this) ?? this.hashCode;
}

Type typeOf<T>() => T;

abstract class StrictMapper<T, U> implements Mapper<T> {
  T strictDecode(U value);
  U strictEncode(T value);

  bool strictEquals(T self, T other);

  @override
  T decode(dynamic value) {
    if (value is U) {
      return strictDecode(value);
    } else {
      throw MapperException(
          'Cannot decode value of type ${value.runtimeType} to type $T, because a value of type $U is expected.');
    }
  }

  @override
  U encode(T value) => strictEncode(value);

  @override
  bool equals(T self, Object? other) =>
      identical(self, other) ||
      other is T &&
          self.runtimeType == other.runtimeType &&
          strictEquals(self, other as T);
}

abstract class BaseMapper<T> implements Mapper<T> {
  @override bool equals(T self, Object? other) => self == other;
  @override int hash(T self) => self.hashCode;
  @override String stringify(T self) => self.toString();
}

class _PrimitiveMapper<T> with BaseMapper<T> implements Mapper<T> {
  final T Function(dynamic value) parse;
  const _PrimitiveMapper(this.parse);

  @override T decode(dynamic value) => parse(value);
  @override dynamic encode(T value) => value;
}

class _EnumMapper<T> extends StrictMapper<T, String> with BaseMapper<T> {

  _EnumMapper(this.decoder, this.encoder);

  final T Function(String value) decoder;
  final String Function(T value) encoder;

  @override T strictDecode(String value) => decoder(value);
  @override String strictEncode(T value) => encoder(value);
  @override bool strictEquals(T self, T other) => self == other;
}

extension on Map<String, dynamic> {
  T get<T>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.fromValue<T>(this[key]!);
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
      throw MapperException(
          'Parameter ${this[key]} with key $key is not a List');
    }
    List value = this[key] as List<dynamic>;
    return value.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
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
      throw MapperException(
          'Parameter ${this[key]} with key $key is not a Map');
    }
    Map value = this[key] as Map<dynamic, dynamic>;
    return value.map((dynamic key, dynamic value) =>
        MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
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
''';
