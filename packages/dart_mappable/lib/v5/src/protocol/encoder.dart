part of 'protocol.dart';

abstract interface class Encode<T> {
  void encode(T value, Encoder encoder);
}

abstract interface class Encoder {

  void encodeValue(Object? value);

  void encodeBool(bool value);
  void encodeInt(int value);
  void encodeDouble(double value);
  void encodeNum(num value);
  void encodeString(String value);

  void encodeNull();

  void encodeIterable<E>(Iterable<E> value, {Encode<E> Function(E)? encodeElement});
  void encodeMap<K, V>(Map<K, V> value, {Encode<K> Function(K)? encodeKey, Encode<V> Function(V)? encodeValue});

  void encodeObject<T>(T value, Encode<T> encode);

  IteratedEncoder encodeIterated();
  KeyedEncoder encodeKeyed();
}


abstract interface class IteratedEncoder implements Encoder {
  void end();
}

abstract interface class KeyedEncoder {
  void encodeValue(String key, Object? value, {int? id});

  void encodeBool(String key, bool value, {int? id});
  void encodeInt(String key, int value, {int? id});
  void encodeDouble(String key, double value, {int? id});
  void encodeNum(String key, num value, {int? id});
  void encodeString(String key, String value, {int? id});

  void encodeNull(String key, {int? id});

  void encodeIterable<E>(String key, Iterable<E> value, {int? id, Encode<E> Function(E)? encodeElement});
  void encodeMap<K, V>(String key, Map<K, V> value, {int? id, Encode<K> Function(K)? encodeKey, Encode<V> Function(V)? encodeValue});

  void encodeObject<T>(String key, T value, Encode<T> encode, {int? id});

  IteratedEncoder encodeIterated(String key, {int? id});
  KeyedEncoder encodeKeyed(String key, {int? id});

  void end();
}