

import '../models/measures.dart';
import '../models/user.dart';
import '../src/extended/extended.dart';
import '../src/implementation/json.dart';
import '../src/implementation/map.dart';
import '../src/protocol/protocol.dart';

void testHooks() {

  var m = Measures.codable().hook(UppercaseStringHook()).fromMap({
    'a': 'Hello','b':2,'c':2,'d':true
  });
  print(m);

  m = Measures.codable().hook(RemapPropsHook()).fromMap({'m': {
    'a': 'Hello','b':2,'c':2,'d':true}
  });
  print(m);
  print(Measures.codable().hook(RemapPropsHook()).toMap(m));


  var user = User.codable().hook(ObjectWithIdHook()).fromJson('"id_007"');
  print(user);
  print(User.codable().hook(ObjectWithIdHook()).toJson(user));
}


class UppercaseStringHook with ProxyHook {
  const UppercaseStringHook();

  @override
  String visitString(String value) => value.toUpperCase();

  @override
  String? visitStringOrNull(String? value) => value?.toUpperCase();
}

class RemapPropsHook implements Hook {

  @override
  T decode<T>(Decoder decoder, Decode<T> decode) {
    return decoder.decodeObject(DecodePickProperty('m', decode));
  }

  @override
  void encode<T>(T value, Encoder encoder, Encode<T> encode) {
    encoder.encodeKeyed()
     ..encodeObject('m', value, encode)
     ..end();
  }

}

class DecodePickProperty<T> implements DecodeMapped<T> {
  DecodePickProperty(this.key, this.decode);

  final String key;
  final Decode<T> decode;
  
  @override
  T decodeMapped(MappedDecoder mapped) {
    return mapped.decodeObject(key, decode);
  }
}

class ObjectWithIdHook implements Hook {
  
  @override
  T decode<T>(Decoder decoder, Decode<T> decode) {
    return decoder.decodeObject(DecodeObjectWithId(decode));
  }

  @override
  void encode<T>(T value, Encoder encoder, Encode<T> encode) {
    encoder.encodeObject(value, encode);
  }
}

class DecodeObjectWithId<T> implements DecodeString<T>, DecodeAny<T> {
  DecodeObjectWithId(this.decode);

  final Decode<T> decode;
  
  @override
  T decodeString(String value) {
    return MapDecoder.decode({'id': value}, decode);
  }

  @override
  T decodeAny(Decoder decoder) {
    return decoder.decodeObject(decode);
  }
}