import '../protocol/protocol.dart';



extension MapDecodable<T> on Decodable<T> {
  T fromMap(Map<String, dynamic> map) {
    return MapDecoding.decode<T>(map, decoder());
  }
}
extension MapDecodable1<T, A> on Decodable1<T, A> {
  T fromMap(Map<String, dynamic> map, [Decoder<A>? d1]) {
    return MapDecoding.decode<T>(map, decoder(d1));
  }
}


extension MapSuperEncodable on SuperEncodable {
  Map<String, dynamic> toMap() {
    final e = encoder();
    return MapEncoding.encode(this, e) as Map<String, dynamic>;
  }
}
extension MapEncodableIt<V> on Encodable<V> {
  Map<String, dynamic> toMap(V value) {
    return MapEncoding.encode<V>(value, encoder()) as Map<String, dynamic>;
  }
}
extension MapEncodable<T extends Encodable<T>> on T {
  Map<String, dynamic> toMap() {
    return MapEncoding.encode<T>(this, encoder()) as Map<String, dynamic>;
  }
}


extension MapEncodable1<T extends Encodable1<T, A>, A> on T {
  Map<String, dynamic> toMap([Encoder<A>? e1]) {
    return MapEncoding.encode<T>(this, encoder(e1)) as Map<String, dynamic>;
  }
}

class MapDecoding implements StructDecoding {
  MapDecoding._(this._value);
  final Object? _value;

  static T decode<T>(Object? value, Decoder<T> decoder) {
    return MapDecoding._(value).decodeObject(decoder);
  }

  @override
  Object? decodeValue() {
    return _value;
  }

  @override
  @pragma('vm:prefer-inline')
  String decodeString() {
    return _value as String;
  }

  @override
  @pragma('vm:prefer-inline')
  String? decodeStringOrNull() {
    return _value as String?;
  }

  @override
  @pragma('vm:prefer-inline')
  bool decodeBool() {
    return _value as bool;
  }

  @override
  @pragma('vm:prefer-inline')
  bool? decodeBoolOrNull() {
    return _value as bool?;
  }

  @override
  @pragma('vm:prefer-inline')
  int decodeInt() {
    return (_value as num).toInt();
  }

  @override
  @pragma('vm:prefer-inline')
  int? decodeIntOrNull() {
    return (_value as num?)?.toInt();
  }

  @override
  @pragma('vm:prefer-inline')
  double decodeDouble() {
    return (_value as num).toDouble();
  }

  @override
  @pragma('vm:prefer-inline')
  double? decodeDoubleOrNull() {
    return (_value as num?)?.toDouble();
  }

  @override
  @pragma('vm:prefer-inline')
  T decodeObject<T>(Decoder<T> decoder) {
    return decoder.decodeStruct(this);
  }

  @override
  @pragma('vm:prefer-inline')
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
    if (_value == null) return null;
    return decoder.decodeStruct(this);
  }

  @override
  @pragma('vm:prefer-inline')
  KeyedStructDecoding<Key> decodeKeyed<Key>() {
    return KeyedMapDecoding._(_value as Map<Key, dynamic>);
  }

  @override
  @pragma('vm:prefer-inline')
  List<T> decodeList<T>() {
    return (_value as List).cast<T>();
  }

  @override
  @pragma('vm:prefer-inline')
  List<T>? decodeListOrNull<T>() {
    return (_value as List?)?.cast<T>();
  }

  @override
  @pragma('vm:prefer-inline')
  List<T> decodeListObject<T>(Decoder<T> decoder) {
    return [
      for (final e in _value as List) decoder.decodeStruct(MapDecoding._(e))
    ];
  }

  @override
  @pragma('vm:prefer-inline')
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder) {
    if (_value == null) return null;
    return [
      for (final e in _value as List) decoder.decodeStruct(MapDecoding._(e))
    ];
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V> decodeMap<K, V>() {
    return (_value as Map).cast<K, V>();
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V>? decodeMapOrNull<K, V>() {
    return (_value as Map?)?.cast<K, V>();
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V> decodeMapObject<K, V>(Decoder<V> decoder) {
    final value = _value as Map;
    final map = <K, V>{};
    for (final key in value.keys) {
      map[key as K] = decoder.decodeStruct(MapDecoding._(value[key]));
    }
    return map;
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V>? decodeMapObjectOrNull<K, V>(Decoder<V> decoder) {
    if (_value == null) return null;
    final value = _value as Map;
    final map = <K, V>{};
    for (final key in value.keys) {
      map[key as K] = decoder.decodeStruct(MapDecoding._(value[key]));
    }
    return map;
  }

}

class KeyedMapDecoding<Key> implements KeyedStructDecoding<Key> {
  KeyedMapDecoding._(this._value);
  final Map<Key, dynamic> _value;

  @override
  @pragma('vm:prefer-inline')
  Object? decodeValue(Key key) {
    return _value[key];
  }

  @override
  @pragma('vm:prefer-inline')
  String decodeString(Key key) {
    return _value[key] as String;
  }

  @override
  @pragma('vm:prefer-inline')
  String? decodeStringOrNull(Key key) {
    return _value[key] as String?;
  }

  @override
  @pragma('vm:prefer-inline')
  bool decodeBool(Key key) {
    return _value[key] as bool;
  }

  @override
  @pragma('vm:prefer-inline')
  bool? decodeBoolOrNull(Key key) {
    return _value[key] as bool?;
  }

  @override
  @pragma('vm:prefer-inline')
  int decodeInt(Key key) {
    return (_value[key] as num).toInt();
  }

  @override
  @pragma('vm:prefer-inline')
  int? decodeIntOrNull(Key key) {
    return (_value[key] as num?)?.toInt();
  }

  @override
  @pragma('vm:prefer-inline')
  double decodeDouble(Key key) {
    return (_value[key] as num).toDouble();
  }

  @override
  @pragma('vm:prefer-inline')
  double? decodeDoubleOrNull(Key key) {
    return (_value[key] as num?)?.toDouble();
  }

  @override
  @pragma('vm:prefer-inline')
  T decodeObject<T>(Key key, Decoder<T> decoder) {
    return decoder.decodeStruct(MapDecoding._(_value[key]));
  }

  @override
  @pragma('vm:prefer-inline')
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decoder) {
    var v = _value[key];
    if (v == null) return null;
    return decoder.decodeStruct(MapDecoding._(v));
  }

  @override
  @pragma('vm:prefer-inline')
  List<T> decodeList<T>(Key key) {
    return (_value[key] as List).cast<T>();
  }

  @override
  @pragma('vm:prefer-inline')
  List<T>? decodeListOrNull<T>(Key key) {
    return (_value[key] as List?)?.cast<T>();
  }

  @override
  @pragma('vm:prefer-inline')
  List<T> decodeListObject<T>(Key key, Decoder<T> decoder) {
    return [
      for (final e in _value[key] as List)
        decoder.decodeStruct(MapDecoding._(e))
    ];
  }

  @override
  @pragma('vm:prefer-inline')
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decoder) {
    var v = _value[key];
    if (v == null) return null;
    return [for (final e in v as List) decoder.decodeStruct(MapDecoding._(e))];
  }


  @override
  @pragma('vm:prefer-inline')
  Map<K, V> decodeMap<K, V>(Key key) {
    return (_value[key] as Map).cast<K, V>();
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V>? decodeMapOrNull<K, V>(Key key) {
    return (_value[key] as Map?)?.cast<K, V>();
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V> decodeMapObject<K, V>(Key key, Decoder<V> decoder) {
    final value = _value[key] as Map;
    final map = <K, V>{};
    for (final key in value.keys) {
      map[key as K] = decoder.decodeStruct(MapDecoding._(value[key]));
    }
    return map;
  }

  @override
  @pragma('vm:prefer-inline')
  Map<K, V>? decodeMapObjectOrNull<K, V>(Key key, Decoder<V> decoder) {
    final value = _value[key] as Map?;
    if (value == null) return null;
    final map = <K, V>{};
    for (final key in value.keys) {
      map[key as K] = decoder.decodeStruct(MapDecoding._(value[key]));
    }
    return map;
  }

}

class MapEncoding implements StructEncoding {
  MapEncoding._();

  Object? _value;

  static Object? encode<T>(T value, Encoder<T> encoder) {
    var encoding = MapEncoding._();
    encoding.encodeObject(value, encoder);
    return encoding._value;
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeValue(Object? value) {
    _value = value;
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoder.encodeStruct(value, this);
  }

  @override
  @pragma('vm:prefer-inline')
  KeyedMapEncoding<Key> encodeKeyed<Key>() {
    return KeyedMapEncoding._(_value = <Key, dynamic>{});
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    _value = [
      for (final e in value) MapEncoding.encode(e, encode(e)),
    ];
  }

  @override
  void encodeMap<K, V>(Map<K, V> value, Encoder<V> Function(V p1) encode) {
    final map = _value = <K, Object?>{};
    for (final key in value.keys) {
      final v = value[key] as V;
      map[key] = MapEncoding.encode<V>(v, encode(v));
    }
  }
}

class KeyedMapEncoding<Key> implements KeyedStructEncoding<Key> {
  KeyedMapEncoding._(this._value);
  final Map<Key, dynamic> _value;

  @override
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeObject<T>(Key key, T value, Encoder<T> encoder) {
    _value[key] = MapEncoding.encode(value, encoder);
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    _value[key] = [for (final e in value) MapEncoding.encode(e, encode(e))];
  }
}
