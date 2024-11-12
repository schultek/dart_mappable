import '../src/mapper/mapper.dart';
import '../src/protocol/protocol.dart';

class User implements Encodable<User> {
  User(this.id, this.name);

  final String id;
  final String? name;

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }

  static Codable<User> codable() => const UserCodable();
  @override
  Encoder<User> encoder() => const UserEncoder();
}

final class UserEncoder implements Encoder<User> {
  const UserEncoder();

  @override
  void encodeStruct(User value, StructEncoding encoding) {
    encoding.encodeKeyed<String>()
      ..encodeValue('id', value.id)
      ..encodeValue('name', value.name);
  }

  @override
  void encodeSerial(User value, SerialEncoding encoder) {
    encoder.startObject<String>();
    encoder.encodeKey('id');
    encoder.encodeString(value.id);
    encoder.encodeKey('name');
    if (value.name != null) {
      encoder.encodeString(value.name!);
    } else {
      encoder.encodeNull();
    }
    encoder.endObject();
  }
}

final class UserDecoder implements Decoder<User> {
  const UserDecoder();

  @override
  User decodeSerial(SerialDecoding decoder) {
    late String id;
    late String? name;

    for (Object? key; (key = decoder.nextKey()) != null;) {
      switch (key) {
        case 'id':
          id = decoder.decodeString();
        case 'name':
          name = decoder.decodeStringOrNull();
        default:
          decoder.skipNext();
      }
    }

    return User(id, name);
  }

  @override
  User decodeStruct(StructDecoding decoder) {
    var keyed = decoder.decodeKeyed<String>();
    return User(
      keyed.decodeString('id'),
      keyed.decodeStringOrNull('name'),
    );
  }
}

class MeasuresMapper extends Mapper<User> implements CodableMapper<User> {
  const MeasuresMapper();

  @override
  Codable<User> codable() => const UserCodable();
}

class UserCodable implements Codable<User> {
  const UserCodable();

  @override
  Decoder<User> decoder() => const UserDecoder();

  @override
  Encoder<User> encoder() => const UserEncoder();
}
