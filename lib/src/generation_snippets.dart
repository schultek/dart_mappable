/// Declarations for the TypeConverter
const declarationsCode = r'''
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
''';

/// A set of TypeConverters for primitive types
const defaultTypeConverters = '''
  // primitive type converters
  typeOf<String>(): _PrimitiveTypeConverter<String>((dynamic v) => v.toString()),
  typeOf<int>(): _PrimitiveTypeConverter<int>((dynamic v) => num.parse(v.toString()).round()),
  typeOf<double>(): _PrimitiveTypeConverter<double>((dynamic v) => double.parse(v.toString())),
  typeOf<num>(): _PrimitiveTypeConverter<num>((dynamic v) => num.parse(v.toString())),
  typeOf<bool>(): _PrimitiveTypeConverter<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  // generated type converters
''';

/// Declarations for the Mapper class
const mapperCode = r'''
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
''';
