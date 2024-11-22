part of 'protocol.dart';

abstract interface class Decoder {
  DecodingType whatsNext();
  
  dynamic decodeDynamic();

  bool decodeBool();
  bool? decodeBoolOrNull();
  int decodeInt();
  int? decodeIntOrNull();
  double decodeDouble();
  double? decodeDoubleOrNull();
  num decodeNum();
  num? decodeNumOrNull();
  String decodeString();
  String? decodeStringOrNull();

  List<E> decodeList<E>([Decode<E>? decodeElement]);
  List<E>? decodeListOrNull<E>([Decode<E>? decodeElement]);
  Map<K, V> decodeMap<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]);
  Map<K, V>? decodeMapOrNull<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]);

  T decodeCustom<T>();

  IteratedDecoder decodeIterated();
  KeyedDecoder decodeKeyed();
  MappedDecoder decodeMapped();

  T decodeObject<T>(Decode<T> decode);
  T? decodeObjectOrNull<T>(Decode<T> decode);

  bool skipNull();

  Decoder clone();

  Never expect(String expect);
}

final class DecodingType {

  const DecodingType._(this.type);

  final Type? type;

  static const nil = DecodingType._(Null);
  static const bool = DecodingType._(core.bool);
  static const int = DecodingType._(core.int);
  static const double = DecodingType._(core.double);
  static const num = DecodingType._(core.num);
  static const string = DecodingType._(core.String);
  static const list = DecodingType._(core.List);
  static const map = DecodingType._(core.Map);
  static const iterated = DecodingType._(IteratedDecoder);
  static const keyed = DecodingType._(KeyedDecoder);
  static const mapped = DecodingType._(MappedDecoder); 

  const DecodingType.custom(this.type);

  static const unknown = DecodingType._(null);

}

enum DecodingType2 {
  nil, bool, int, double, num, string, list, map, iterated, keyed, mapped, unknown;
}

abstract class IteratedDecoder implements Decoder {
  bool nextItem();

  void skipCurrentItem();
  void skipRemainingItems();

  @override
  IteratedDecoder clone();
}

abstract class KeyedDecoder implements Decoder {
  Object? nextKey();

  void skipCurrentValue();
  void skipRemainingKeys();

  @override
  KeyedDecoder clone();
}

abstract class MappedDecoder {
  DecodingType whatsNext(String key, [int? id]);

  dynamic decodeDynamic(String key, [int? id]);

  bool decodeBool(String key, [int? id]);
  bool? decodeBoolOrNull(String key, [int? id]);
  int decodeInt(String key, [int? id]);
  int? decodeIntOrNull(String key, [int? id]);
  double decodeDouble(String key, [int? id]);
  double? decodeDoubleOrNull(String key, [int? id]);
  num decodeNum(String key, [int? id]);
  num? decodeNumOrNull(String key, [int? id]);
  String decodeString(String key, [int? id]);
  String? decodeStringOrNull(String key, [int? id]);

  List<E> decodeList<E>(String key, [int? id, Decode<E>? decodeElement]);
  List<E>? decodeListOrNull<E>(String key, [int? id, Decode<E>? decodeElement]);
  Map<K, V> decodeMap<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeValue]);
  Map<K, V>? decodeMapOrNull<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeValue]);

  T decodeCustom<T>(String key, [int? id]);

  IteratedDecoder decodeIterated(String key, [int? id]);
  KeyedDecoder decodeKeyed(String key, [int? id]);
  MappedDecoder decodeMapped(String key, [int? id]);

  T decodeObject<T>(String key, Decode<T> decode, [int? id]);
  T? decodeObjectOrNull<T>(String key, Decode<T> decode, [int? id]);

  bool isNull(String key, [int? id]);

  Iterable<Object> get keys;

  Never expect(String key, String expect, [int? id]);
}


abstract interface class Decode<T> {
  T decode(Decoder decoder);
}