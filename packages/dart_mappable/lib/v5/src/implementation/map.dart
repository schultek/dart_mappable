import '../extended/compat2.dart';
import '../protocol/protocol.dart';

extension MapDecodable<T> on Decodable<T> {
  T fromMap(Map<String, dynamic> map) {
    return MapDecoder.decode<T>(map, decode());
  }
}

extension MapDecodable1<T, A> on Decodable1<T, A> {
  T fromMap(Map<String, dynamic> map, [Decode<A>? d1]) {
    return MapDecoder.decode<T>(map, decode(d1));
  }
}

extension MapSuperEncodable on SuperEncodable {
  Map<String, dynamic> toMap() {
    final e = encode();
    return MapEncoder.encode(this, e) as Map<String, dynamic>;
  }
}

extension MapEncodableIt<V> on Encodable<V> {
  Map<String, dynamic> toMap(V value) {
    return MapEncoder.encode<V>(value, encode()) as Map<String, dynamic>;
  }
}

extension MapEncodable<T extends Encodable<T>> on T {
  Map<String, dynamic> toMap() {
    return MapEncoder.encode<T>(this, encode()) as Map<String, dynamic>;
  }
}

extension MapEncodable1<T extends Encodable1<T, A>, A> on T {
  Map<String, dynamic> toMap([Encode<A>? e1]) {
    return MapEncoder.encode<T>(this, encode(e1)) as Map<String, dynamic>;
  }
}

class MapDecoder implements Decoder {
  MapDecoder._(this._value);
  final Object? _value;

  static T decode<T>(Object? value, Decode<T> decode) {
    return decode.decode(MapDecoder._(value));
  }

  @override
  T decodeObject<T>(Decode<T> decode) {
    return decode.decode(this);
  }

  @override
  T? decodeObjectOrNull<T>(Decode<T> decode) {
    if (_value == null) return null;
    return decode.decode(this);
  }

  @override
  bool decodeBool() {
    return _value as bool;
  }

  @override
  bool? decodeBoolOrNull() {
    return _value as bool?;
  }

  @override
  double decodeDouble() {
    return (_value as num).toDouble();
  }

  @override
  double? decodeDoubleOrNull() {
    return (_value as num?)?.toDouble();
  }

  @override
  int decodeInt() {
    return (_value as num).toInt();
  }

  @override
  int? decodeIntOrNull() {
    return (_value as num?)?.toInt();
  }

  @override
  List<I> decodeList<I>([Decode<I>? decodeItem]) {
    if (decodeItem == null) return (_value as List).cast<I>();
    return [
      for (final e in _value as List) MapDecoder.decode(e, decodeItem),
    ];
  }

  @override
  List<I>? decodeListOrNull<I>([Decode<I>? decodeItem]) {
    if (skipNull()) return null;
    return decodeList(decodeItem!);
  }

  @override
  Map<K, V> decodeMap<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    return switch ((decodeKey, decodeValue)) {
      (null, null) => (_value as Map).cast<K, V>(),
      (final dk?, null) => (_value as Map).map((key, value) => MapEntry(dk.decode(MapDecoder._(key)), value as V)),
      (null, final dv?) => (_value as Map).map((key, value) => MapEntry(key as K, dv.decode(MapDecoder._(value)))),
      (final dk?, final dv?) =>
        (_value as Map).map((key, value) => MapEntry(dk.decode(MapDecoder._(key)), dv.decode(MapDecoder._(value)))),
    };
  }

  @override
  Map<K, V>? decodeMapOrNull<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    if (skipNull()) return null;
    return decodeMap(decodeKey, decodeValue);
  }

  @override
  num decodeNum() {
    return _value as num;
  }

  @override
  num? decodeNumOrNull() {
    return _value as num?;
  }

  @override
  String decodeString() {
    return _value as String;
  }

  @override
  String? decodeStringOrNull() {
    return _value as String?;
  }

  @override
  bool skipNull() {
    return _value == null;
  }

  @override
  Decoder clone() {
    return this;
  }

  @override
  dynamic decodeDynamic() {
    return _value;
  }

  @override
  IteratedDecoder decodeIterated() {
    return MapIteratedDecoder._(_value as List);
  }

  @override
  KeyedDecoder decodeKeyed() {
    return CompatKeyedDecoder.wrap(decodeMapped());
  }

  @override
  MappedDecoder decodeMapped() {
    return MapMappedDecoder(_value as Map<Object, dynamic>);
  }

  @override
  Never expect(String expect) {
    throw 'Expected $expect, but got ${whatsNext()}';
  }

  @override
  DecodingType whatsNext() {
    return _whatsNext(_value);
  }

  static DecodingType _whatsNext(Object? value) {
    return switch (value) {
      null => DecodingType.nil,
      int() => DecodingType.int,
      double() => DecodingType.double,
      String() => DecodingType.string,
      bool() => DecodingType.bool,
      Map() => DecodingType.map,
      List() => DecodingType.list,
      final v => DecodingType.custom(v.runtimeType),
    };
  }
  
  @override
  T decodeCustom<T>() {
    return _value as T;
  }
}

class MapMappedDecoder implements MappedDecoder {
  MapMappedDecoder(this._value);

  final Map<Object, dynamic> _value;

  @override
  T decodeObject<T>(String key, Decode<T> decode, [int? id]) {
    return decode.decode(MapDecoder._(_value[key]));
  }

  @override
  T? decodeObjectOrNull<T>(String key, Decode<T> decode, [int? id]) {
    final v = _value[key];
    if (v == null) return null;
    return decode.decode(MapDecoder._(v));
  }

  @override
  bool decodeBool(String key, [int? id]) {
    return _value[key] as bool;
  }

  @override
  bool? decodeBoolOrNull(String key, [int? id]) {
    return _value[key] as bool?;
  }

  @override
  double decodeDouble(String key, [int? id]) {
    return (_value[key] as num).toDouble();
  }

  @override
  double? decodeDoubleOrNull(String key, [int? id]) {
    return (_value[key] as num?)?.toDouble();
  }

  @override
  int decodeInt(String key, [int? id]) {
    return (_value[key] as num).toInt();
  }

  @override
  int? decodeIntOrNull(String key, [int? id]) {
    return (_value[key] as num?)?.toInt();
  }

  @override
  List<E> decodeList<E>(String key, [int? id, Decode<E>? decode]) {
    final v = _value[key] as List;
    return switch (decode) {
      null => v.cast<E>(),
      final d => [for (final e in v) MapDecoder._(e).decodeObject(d)],
    };
  }

  @override
  List<E>? decodeListOrNull<E>(String key, [int? id, Decode<E>? decode]) {
    if (_value[key] == null) return null;
    return decodeList(key, id, decode);
  }

  @override
  Map<K, V> decodeMap<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    return switch ((decodeKey, decodeValue)) {
      (null, null) => (_value[key] as Map).cast<K, V>(),
      (final dk?, null) =>
        (_value[key] as Map).map((key, value) => MapEntry(MapDecoder._(key).decodeObject(dk), value as V)),
      (null, final dv?) =>
        (_value[key] as Map).map((key, value) => MapEntry(key as K, MapDecoder._(value).decodeObject(dv))),
      (final dk?, final dv?) => (_value[key] as Map)
          .map((key, value) => MapEntry(MapDecoder._(key).decodeObject(dk), MapDecoder._(value).decodeObject(dv))),
    };
  }

  @override
  Map<K, V>? decodeMapOrNull<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    if (_value[key] == null) return null;
    return decodeMap(key, id, decodeKey, decodeValue);
  }

  @override
  num decodeNum(String key, [int? id]) {
    return _value[key] as num;
  }

  @override
  num? decodeNumOrNull(String key, [int? id]) {
    return _value[key] as num?;
  }

  @override
  String decodeString(String key, [int? id]) {
    return _value[key] as String;
  }

  @override
  String? decodeStringOrNull(String key, [int? id]) {
    return _value[key] as String?;
  }

  @override
  dynamic decodeDynamic(String key, [int? id]) {
    return _value[key];
  }

  @override
  DecodingType whatsNext(String key, [int? id]) {
    return MapDecoder._whatsNext(_value[key]);
  }
  
  @override
  Iterable<Object> get keys => _value.keys;
  
  @override
  IteratedDecoder decodeIterated(String key, [int? id]) {
    return MapIteratedDecoder._(_value[key] as List);
  }
  
  @override
  KeyedDecoder decodeKeyed(String key, [int? id]) {
    return CompatKeyedDecoder.wrap(decodeMapped(key));
  }
  
  @override
  MappedDecoder decodeMapped(String key, [int? id]) {
    return MapMappedDecoder(_value[key] as Map<Object, dynamic>);
  }
  
  @override
  Never expect(String key, String expect, [int? id]) {
    MapDecoder._(_value[key]).expect(expect);
  }
  
  @override
  bool isNull(String key, [int? id]) {
    return _value.containsKey(key) && _value[key] == null;
  }
  
  @override
  T decodeCustom<T>(String key, [int? id]) {
    return _value[key] as T;
  }
}

class MapIteratedDecoder extends MapDecoder implements IteratedDecoder {
  MapIteratedDecoder._(this.__value, [this._index = 0]) : super._(null);

  final List __value;
  int _index;

  @override
  Object? get _value => __value[_index];

  @override
  bool nextItem() {
    _index++;
    return _index < __value.length;
  }

  @override
  void skipCurrentItem() {
    // Do nothing
  }

  @override
  void skipRemainingItems() {
    _index = __value.length;
  }

  @override
  IteratedDecoder clone() {
    return MapIteratedDecoder._(__value, _index);
  }
}

class MapEncoder implements Encoder {
  MapEncoder();

  Object? _value;

  static Object? encode<T>(T value, Encode<T> encode) {
    final encoder = MapEncoder();
    encode.encode(value, encoder);
    return encoder._value;
  }

  @override
  void encodeBool(bool value) {
    _value = value;
  }

  @override
  IteratedEncoder encodeIterated() {
    return MapIteratedEncoder(_value = <dynamic>[]);
  }

  @override
  void encodeDouble(double value) {
    _value = value;
  }

  @override
  void encodeInt(int value) {
    _value = value;
  }

  @override
  void encodeIterable<E>(Iterable<E> value, {Encode<E> Function(E p1)? encodeElement}) {
    if (encodeElement == null) {
      _value = value;
      return;
    }
    _value = value.map((e) => MapEncoder.encode(e, encodeElement(e))).toList();
  }

  @override
  KeyedEncoder encodeKeyed() {
    return MapKeyedEncoder(_value = <String, dynamic>{});
  }

  @override
  void encodeMap<K, V>(Map<K, V> value, {Encode<K> Function(K p1)? encodeKey, Encode<V> Function(V p1)? encodeValue}) {
    if (encodeKey == null && encodeValue == null) {
      _value = value;
      return;
    }
    if (encodeKey == null) {
      _value = value.map((key, value) => MapEntry(key, MapEncoder.encode(value, encodeValue!(value))));
      return;
    }
    if (encodeValue == null) {
      _value = value.map((key, value) => MapEntry(MapEncoder.encode(key, encodeKey(key)), value));
      return;
    }
    _value = value.map(
        (key, value) => MapEntry(MapEncoder.encode(key, encodeKey(key)), MapEncoder.encode(value, encodeValue(value))));
  }

  @override
  void encodeNull() {
    _value = null;
  }

  @override
  void encodeNum(num value) {
    _value = value;
  }

  @override
  void encodeObject<T>(T value, Encode<T> encode) {
    encode.encode(value, this);
  }

  @override
  void encodeString(String value) {
    _value = value;
  }

  @override
  void encodeValue(Object? value) {
    _value = value;
  }
}

class MapIteratedEncoder implements IteratedEncoder {
  MapIteratedEncoder(this._value);

  final List<dynamic> _value;

  @override
  void encodeBool(bool value) {
    _value.add(value);
  }

  @override
  IteratedEncoder encodeIterated() {
    final list = <dynamic>[];
    _value.add(list);
    return MapIteratedEncoder(list);
  }

  @override
  void encodeDouble(double value) {
    _value.add(value);
  }

  @override
  void encodeInt(int value) {
    _value.add(value);
  }

  @override
  void encodeIterable<E>(Iterable<E> value, {Encode<E> Function(E p1)? encodeElement}) {
    if (encodeElement == null) {
      _value.add(value);
      return;
    }
    _value.add(value.map((e) => MapEncoder.encode(e, encodeElement(e))).toList());
  }

  @override
  KeyedEncoder encodeKeyed() {
    final map = <String, dynamic>{};
    _value.add(map);
    return MapKeyedEncoder(map);
  }

  @override
  void encodeMap<K, V>(Map<K, V> value, {Encode<K> Function(K p1)? encodeKey, Encode<V> Function(V p1)? encodeValue}) {
    if (encodeKey == null && encodeValue == null) {
      _value.add(value);
      return;
    }
    if (encodeKey == null) {
      _value.add(value.map((key, value) => MapEntry(key, MapEncoder.encode(value, encodeValue!(value)))));
      return;
    }
    if (encodeValue == null) {
      _value.add(value.map((key, value) => MapEntry(MapEncoder.encode(key, encodeKey(key)), value)));
      return;
    }
    _value.add(value.map((key, value) =>
        MapEntry(MapEncoder.encode(key, encodeKey(key)), MapEncoder.encode(value, encodeValue(value)))));
  }

  @override
  void encodeNull() {
    _value.add(null);
  }

  @override
  void encodeNum(num value) {
    _value.add(value);
  }

  @override
  void encodeObject<T>(T value, Encode<T> encode) {
    encode.encode(value, this);
  }

  @override
  void encodeString(String value) {
    _value.add(value);
  }

  @override
  void encodeValue(Object? value) {
    _value.add(value);
  }

  @override
  void end() {
    // Do nothing
  }
}

class MapKeyedEncoder implements KeyedEncoder {
  MapKeyedEncoder(this._value);

  final Map<String, dynamic> _value;

  @override
  void encodeBool(String key, bool value, {int? id}) {
    _value[key] = value;
  }

  @override
  IteratedEncoder encodeIterated(String key, {int? id}) {
    return MapIteratedEncoder(_value[key] = <dynamic>[]);
  }

  @override
  void encodeDouble(String key, double value, {int? id}) {
    _value[key] = value;
  }

  @override
  void encodeInt(String key, int value, {int? id}) {
    _value[key] = value;
  }

  @override
  void encodeIterable<E>(String key, Iterable<E> value, {int? id, Encode<E> Function(E p1)? encodeElement}) {
    _value[key] = switch (encodeElement) {
      null => value,
      final ee => [for (final e in value) MapEncoder.encode(e, ee(e))],
    };
  }

  @override
  KeyedEncoder encodeKeyed(String key, {int? id}) {
    return MapKeyedEncoder(_value[key] = <String, dynamic>{});
  }

  @override
  void encodeMap<K, V>(String key, Map<K, V> value,
      {int? id, Encode<K> Function(K p1)? encodeKey, Encode<V> Function(V p1)? encodeValue}) {
    _value[key] = switch ((encodeKey, encodeValue)) {
      (null, null) => value,
      (final ek?, null) => value.map((key, value) => MapEntry(MapEncoder.encode(key, ek(key)), value)),
      (null, final ev?) => value.map((key, value) => MapEntry(key, MapEncoder.encode(value, ev(value)))),
      (final ek?, final ev?) =>
        value.map((key, value) => MapEntry(MapEncoder.encode(key, ek(key)), MapEncoder.encode(value, ev(value)))),
    };
  }

  @override
  void encodeNull(String key, {int? id}) {
    _value[key] = null;
  }

  @override
  void encodeNum(String key, num value, {int? id}) {
    _value[key] = value;
  }

  @override
  void encodeObject<T>(String key, T value, Encode<T> encode, {int? id}) {
    _value[key] = MapEncoder.encode(value, encode);
  }

  @override
  void encodeString(String key, String value, {int? id}) {
    _value[key] = value;
  }

  @override
  void encodeValue(String key, Object? value, {int? id}) {
    _value[key] = value;
  }

  @override
  void end() {
    // Do nothing
  }
}
