import '../protocol/protocol.dart';

class CompatKeyedDecoder implements KeyedDecoder {
  CompatKeyedDecoder._(this.decoder) : keys = decoder.keys.iterator;

  static KeyedDecoder wrap<T>(MappedDecoder decoder) {
    return CompatKeyedDecoder._(decoder);
  }

  final MappedDecoder decoder;

  final Iterator<Object?> keys;
  bool _done = false;
  
  @override
  KeyedDecoder clone() {
    return CompatKeyedDecoder._(decoder);
  }
  
  @override
  bool decodeBool() {
    final key = keys.current;
    return decoder.decodeBool(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  bool? decodeBoolOrNull() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeBoolOrNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  double decodeDouble() {
    final key = keys.current;
    return decoder.decodeDouble(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  double? decodeDoubleOrNull() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeDoubleOrNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  dynamic decodeDynamic() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeDynamic(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  int decodeInt() {
    final key = keys.current;
    return decoder.decodeInt(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  int? decodeIntOrNull() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeIntOrNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  IteratedDecoder decodeIterated() {
    final key = keys.current;
    return decoder.decodeIterated(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  KeyedDecoder decodeKeyed() {
    final key = keys.current;
    return decoder.decodeKeyed(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  List<E> decodeList<E>([Decode<E>? decodeElement]) {
    final key = keys.current;
    return decoder.decodeList(key is String ? key : '', key is int ? key : null, decodeElement);
  }
  
  @override
  List<E>? decodeListOrNull<E>([Decode<E>? decodeElement]) {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeListOrNull(key is String ? key : '', key is int ? key : null, decodeElement);
  }
  
  @override
  Map<K, V> decodeMap<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    final key = keys.current;
    return decoder.decodeMap(key is String ? key : '', key is int ? key : null, decodeKey, decodeValue);
  }
  
  @override
  Map<K, V>? decodeMapOrNull<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeMapOrNull(key is String ? key : '', key is int ? key : null, decodeKey, decodeValue);
  }
  
  @override
  MappedDecoder decodeMapped() {
    final key = keys.current;
    return decoder.decodeMapped(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  num decodeNum() {
    final key = keys.current;
    return decoder.decodeNum(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  num? decodeNumOrNull() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeNumOrNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  T decodeObject<T>(Decode<T> decode) {
    final key = keys.current;
    return decoder.decodeObject(key is String ? key : '', decode, key is int ? key : null);
  }
  
  @override
  T? decodeObjectOrNull<T>(Decode<T> decode) {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeObjectOrNull(key is String ? key : '', decode, key is int ? key : null);
  }
  
  @override
  String decodeString() {
    final key = keys.current;
    return decoder.decodeString(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  String? decodeStringOrNull() {
    if (_done) return null;
    final key = keys.current;
    return decoder.decodeStringOrNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  Never expect(String expect) {
    final key = keys.current;
    return decoder.expect(key is String ? key : '', expect, key is int ? key : null);
  }
  
  @override
  Object? nextKey() {
    if (keys.moveNext()) {
      return keys.current;
    } else {
      _done = true;
      return null;
    }
  }
  
  @override
  void skipCurrentValue() {
    // do nothing
  }
  
  @override
  bool skipNull() {
    if (_done) return false;
    final key = keys.current;
    return decoder.isNull(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  void skipRemainingKeys() {
    while (keys.moveNext()) {
      // do nothing
    }
  }
  
  @override
  DecodingType whatsNext() {
    final key = keys.current;
    return decoder.whatsNext(key is String ? key : '', key is int ? key : null);
  }
  
  @override
  T decodeCustom<T>() {
    final key = keys.current;
    return decoder.decodeCustom(key is String ? key : '', key is int ? key : null);
  }






}