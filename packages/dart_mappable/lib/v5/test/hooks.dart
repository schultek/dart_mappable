

import '../models/measures.dart';
import '../models/user.dart';
import '../src/extensions/extensions.dart';
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

class RemapPropsHook with HookMixin {

  @override
  T decode<T>(Decoding decoding, Decoder<T> decoder) {
    return decoding.decodeKeyed<String>().decodeObject('m', decoder);
  }

  @override
  void encode<T>(T value, Encoding encoding, Encoder<T> encoder) {
    encoding.encodeKeyed<String>().encodeObject('m', value, encoder);
  }

}

class ObjectWithIdHook with HookMixin {

  @override
  T decode<T>(Decoding decoding, Decoder<T> decoder) {
    final value = decoding.clone().decodeValue();
    if (value is String) {
      return MapDecoding.decode({'id': value}, decoder);
    } else {
      return super.decode(decoding, decoder);
    }
  }

  @override
  void encode<T>(T value, Encoding encoding, Encoder<T> encoder) {
    final map = MapEncoding.encode(value, encoder);
    if (map is Map && map.containsKey('id')) {
      encoding.encodeValue(map['id']);
    } else {
      super.encode(value, encoding, encoder);
    }
  }

}