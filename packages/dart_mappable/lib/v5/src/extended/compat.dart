import '../protocol/protocol.dart';

class CompatMappedDecoder implements MappedDecoder {
  CompatMappedDecoder._(this.decoders);

  static MappedDecoder wrap<T>(KeyedDecoder decoder) {
    final map = <Object, KeyedDecoder>{};
    for (Object? key; (key = decoder.nextKey()) != null;) {
      map[key!] = decoder.clone();
      decoder.skipCurrentValue();
    }
    return CompatMappedDecoder._(map);
  }

  final Map<Object, KeyedDecoder> decoders;

  @override
  Object? decodeDynamic(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeDynamic();
  }

  @override
  String decodeString(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeString();
  }

  @override
  String? decodeStringOrNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeStringOrNull();
  }

  @override
  bool decodeBool(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeBool();
  }

  @override
  bool? decodeBoolOrNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeBoolOrNull();
  }

  @override
  double decodeDouble(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeDouble();
  }

  @override
  double? decodeDoubleOrNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeDoubleOrNull();
  }

  @override
  int decodeInt(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeInt();
  }

  @override
  int? decodeIntOrNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeIntOrNull();
  }

  @override
  T decodeObject<T>(String key, Decode<T> decode, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeObject(decode);
  }

  @override
  T? decodeObjectOrNull<T>(String key, Decode<T> decode, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeObjectOrNull(decode);
  }

  @override
  List<T> decodeList<T>(String key, [int? id, Decode<T>? decodeElement]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeList(decodeElement);
  }

  @override
  List<T>? decodeListOrNull<T>(String key, [int? id, Decode<T>? decodeElement]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeListOrNull(decodeElement);
  }

  @override
  Map<K, V> decodeMap<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeDynamic]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeMap(decodeKey, decodeDynamic);
  }

  @override
  Map<K, V>? decodeMapOrNull<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeDynamic]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeMapOrNull(decodeKey, decodeDynamic);
  }

  @override
  num decodeNum(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeNum();
  }

  @override
  num? decodeNumOrNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d?.clone().decodeNumOrNull();
  }

  @override
  DecodingType whatsNext(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().whatsNext();
  }

  @override
  Iterable<Object> get keys => decoders.keys;

  @override
  IteratedDecoder decodeIterated(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeIterated();
  }

  @override
  KeyedDecoder decodeKeyed(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeKeyed();
  }

  @override
  MappedDecoder decodeMapped(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeMapped();
  }

  @override
  Never expect(String key, String expect, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().expect(expect);
  }

  @override
  bool isNull(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d != null && d.clone().skipNull();
  }
  
  @override
  T decodeCustom<T>(String key, [int? id]) {
    var d = decoders[key] ?? decoders[id];
    return d!.clone().decodeCustom<T>();
  }
}
