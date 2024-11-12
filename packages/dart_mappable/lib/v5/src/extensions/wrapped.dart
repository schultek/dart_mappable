
part of 'extensions.dart';

abstract mixin class WrappedDecoding {

  StructDecoding wrapStruct(StructDecoding decoding) => decoding;
  SerialDecoding wrapSerial(SerialDecoding decoding) => decoding;
}

 abstract class WrappedStructDecoding with WrappedDecoding implements StructDecoding {
  WrappedStructDecoding(this.wrapped);
  final StructDecoding wrapped;

  @override
  Object? decodeValue() => wrapped.decodeValue();
  
  @override
  bool decodeBool() => wrapped.decodeBool();

  @override
  bool? decodeBoolOrNull()=> wrapped.decodeBoolOrNull();

  @override
  double decodeDouble() => wrapped.decodeDouble();

  @override
  double? decodeDoubleOrNull() => wrapped.decodeDoubleOrNull();

  @override
  int decodeInt() => wrapped.decodeInt();

  @override
  int? decodeIntOrNull() => wrapped.decodeIntOrNull();

  @override
  KeyedStructDecoding<Key> decodeKeyed<Key>() => wrapped.decodeKeyed();

  @override
  List<T> decodeList<T>() => wrapped.decodeList();

  @override
  List<T> decodeListObject<T>(Decoder<T> decoder) => wrapped.decodeListObject(decoder.wrapped(this));

  @override
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder) => wrapped.decodeListObjectOrNull(decoder.wrapped(this));

  @override
  List<T>? decodeListOrNull<T>() => wrapped.decodeListOrNull();

  @override
  Map<K, V> decodeMap<K, V>() => wrapped.decodeMap();

  @override
  Map<K, V> decodeMapObject<K, V>(Decoder<V> decoder) => wrapped.decodeMapObject(decoder.wrapped(this));

  @override
  Map<K, V>? decodeMapObjectOrNull<K, V>(Decoder<V> decoder) => wrapped.decodeMapObjectOrNull(decoder.wrapped(this));

  @override
  Map<K, V>? decodeMapOrNull<K, V>() => wrapped.decodeMapOrNull();

  @override
  T decodeObject<T>(Decoder<T> decoder) => wrapped.decodeObject(decoder.wrapped(this));

  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) => wrapped.decodeObjectOrNull(decoder.wrapped(this));

  @override
  String decodeString() => wrapped.decodeString();

  @override
  String? decodeStringOrNull() => wrapped.decodeStringOrNull();


}

abstract class WrappedKeyedStructDecoding<Key> implements KeyedStructDecoding<Key> {
  WrappedKeyedStructDecoding(this.wrapped, this.parent);

  final KeyedStructDecoding wrapped;
  final WrappedDecoding parent;

  @override
  Object? decodeValue(Key key) => wrapped.decodeValue(key);

  @override
  bool decodeBool(Key key) => wrapped.decodeBool(key);

  @override
  bool? decodeBoolOrNull(Key key)  => wrapped.decodeBoolOrNull(key);

  @override
  double decodeDouble(Key key)  => wrapped.decodeDouble(key);

  @override
  double? decodeDoubleOrNull(Key key)  => wrapped.decodeDoubleOrNull(key);

  @override
  int decodeInt(Key key) => wrapped.decodeInt(key);

  @override
  int? decodeIntOrNull(Key key) => wrapped.decodeIntOrNull(key);

  @override
  List<T> decodeList<T>(Key key) => wrapped.decodeList(key);

  @override
  List<T>? decodeListOrNull<T>(Key key) => wrapped.decodeListOrNull(key);

  @override
  T decodeObject<T>(Key key, Decoder<T> decoder) => wrapped.decodeObject(key, decoder.wrapped(parent));

  @override
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decoder) => wrapped.decodeObjectOrNull(key, decoder.wrapped(parent));

  @override
  String decodeString(Key key) => wrapped.decodeString(key);

  @override
  String? decodeStringOrNull(Key key) => wrapped.decodeStringOrNull(key);

  @override
  List<T> decodeListObject<T>(Key key, Decoder<T> decoder) => wrapped.decodeListObject(key, decoder.wrapped(parent));

  @override
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decoder)=> wrapped.decodeListObjectOrNull(key, decoder.wrapped(parent));

  @override
  Map<K, V> decodeMap<K, V>(Key key) => wrapped.decodeMap(key);

  @override
  Map<K, V>? decodeMapOrNull<K, V>(Key key)  => wrapped.decodeMapOrNull(key);

  @override
  Map<K, V> decodeMapObject<K, V>(Key key, Decoder<V> decoder) => wrapped.decodeMapObject(key, decoder);

  @override
  Map<K, V>? decodeMapObjectOrNull<K, V>(Key key, Decoder<V> decoder) => wrapped.decodeMapObjectOrNull(key, decoder);

 }

abstract class WrappedSerialDecoding with WrappedDecoding implements SerialDecoding {
  WrappedSerialDecoding(this.wrapped);
  final SerialDecoding wrapped;

  @override
  bool decodeBool() => wrapped.decodeBool();

  @override
  bool? decodeBoolOrNull()=> wrapped.decodeBoolOrNull();

  @override
  double decodeDouble() => wrapped.decodeDouble();

  @override
  double? decodeDoubleOrNull() => wrapped.decodeDoubleOrNull();

  @override
  int decodeInt() => wrapped.decodeInt();

  @override
  int? decodeIntOrNull() => wrapped.decodeIntOrNull();

  @override
  T decodeObject<T>(Decoder<T> decoder) => wrapped.decodeObject(decoder.wrapped(this));

  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) => wrapped.decodeObjectOrNull(decoder.wrapped(this));

  @override
  String decodeString() => wrapped.decodeString();

  @override
  String? decodeStringOrNull() => wrapped.decodeStringOrNull();

  @override
  Object? decodeValue() => wrapped.decodeValue();

  @override
  bool nextItem() => wrapped.nextItem();

  @override
  Object? nextKey() => wrapped.nextKey();

  @override
  void skipNext() => wrapped.skipNext();

  @override
  bool skipNull() => wrapped.skipNull();

  @override
  void skipRemainingItems() => wrapped.skipRemainingItems();

  @override
  void skipRemainingKeys() => wrapped.skipRemainingKeys();

  @override
  SerialDecoding clone() => wrapSerial(wrapped.clone());

}

 extension _Wrap<T> on Decoder<T> {
   Decoder<T> wrapped(WrappedDecoding decoding) => _WrappedDecoder(this, decoding);
 }

 class _WrappedDecoder<T> implements Decoder<T> {
   _WrappedDecoder(this.decoder, this.parent);

   final Decoder<T> decoder;
   final WrappedDecoding parent;

  @override
  T decodeSerial(SerialDecoding decoding) {
    return decoder.decodeSerial(parent.wrapSerial(decoding));
  }

  @override
  T decodeStruct(StructDecoding decoding) {
    return decoder.decodeStruct(parent.wrapStruct(decoding));
  }

 }