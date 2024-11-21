part of 'protocol.dart';

abstract interface class Decoder {
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

  IteratedDecoder decodeIterated();
  KeyedDecoder decodeKeyed();
  MappedDecoder decodeMapped();

  T decodeObject<T>(Decode<T> decode);
  T? decodeObjectOrNull<T>(Decode<T> decode);

  bool skipNull();

  DecodingType whatsNext();

  Decoder clone();
}

enum DecodingType {
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

  T decodeObject<T>(String key, Decode<T> decode, [int? id]);
  T? decodeObjectOrNull<T>(String key, Decode<T> decode, [int? id]);
}


sealed class Decode<T> {}

abstract interface class DecodeDynamic<T> implements Decode<T> {
  T decodeDynamic(dynamic value);
}
abstract interface class DecodeBool<T> implements Decode<T> {
  T decodeBool(bool value);
}
abstract interface class DecodeDouble<T> implements Decode<T> {
  T decodeDouble(double value);
}
abstract interface class DecodeInt<T> implements Decode<T> {
  T decodeInt(int value);
}
abstract interface class DecodeNum<T> implements Decode<T> {
  T decodeNum(num value);
}
abstract interface class DecodeString<T> implements Decode<T> {
  T decodeString(String value);
}
abstract interface class DecodeList<T> implements Decode<T> {
  T decodeList<E>(List<E> value);
}
abstract interface class DecodeMap<T> implements Decode<T> {
  T decodeMap<K, V>(Map<K, V> value);
}
abstract interface class DecodeIterated<T> implements Decode<T> {
  T decodeIterated(IteratedDecoder iterated);
}
abstract interface class DecodeKeyed<T> implements Decode<T> {
  T decodeKeyed(KeyedDecoder keyed);
}
abstract interface class DecodeMapped<T> implements Decode<T> {
  T decodeMapped(MappedDecoder mapped);
}
abstract interface class DecodeNull<T> implements Decode<T> {
  T decodeNull();
}
abstract interface class DecodeAny<T> implements Decode<T> {
  T decodeAny(Decoder decoder);
}
abstract interface class DecodeCustom<T, V> implements Decode<T> {
  T decodeCustom(V value);
}

