import '../src/extensions/extensions.dart';
import '../src/mapper/inheritance.dart';
import '../src/mapper/mapper.dart';
import '../src/protocol/protocol.dart';

class Animal implements SuperEncodable {
  Animal({required this.type});

  final String type;

  static Decoder<Animal> decoder() => const AnimalDecoder();

  @override
  Encoder<Animal> encoder() => AnimalEncoder();
}

class AnimalEncoder implements Encoder<Animal> {
  @override
  void encodeSerial(Animal value, SerialEncoding encoding) {
    encoding
      ..startObject<String>()
      ..encodeKey('type')
      ..encodeString(value.type)
      ..endObject();
  }

  @override
  void encodeStruct(Animal value, StructEncoding encoding) {
    encoding.encodeKeyed<String>()
      .encodeValue('type', value.type);
  }
  
}

class Cat extends Animal implements Encodable<Cat> {
  Cat({this.lives = 7, super.type = 'cat'});

  final int lives;

  static Decoder<Cat> decoder() => const CatDecoder();
  @override
  Encoder<Cat> encoder() => const CatEncoder();
}

class Dog extends Animal implements Encodable<Dog> {
  Dog({required this.breed, super.type = 'dog'});

  final String breed;

  static Decoder<Dog> decoder() => const DogDecoder();
  @override
  Encoder<Dog> encoder() => const DogEncoder();
}

class Bird extends Animal {
  Bird({required this.color, super.type = 'bird'});

  final String color;

  static Decoder<Bird> decoder() => const BirdDecoder();
  @override
  Encoder<Bird> encoder() => const BirdEncoder();
}

class AnimalDecoder with DecoderMixin<Animal>, SuperDecoderMixin<Animal> {
  const AnimalDecoder();

  @override
  final String discriminatorKey = 'type';

  @override
  List<SubDecoderMixin> getSubDecoders() => const [
        CatDecoder(),
        DogDecoder(),
      ];

  @override
  Animal decode(Decoding decoding) {
    final subDecoder = getSubDecoder(decoding);

    if (subDecoder != null) {
      return decoding.decodeObject(subDecoder);
    }

    return Animal(type: decoding.decodeKeyed().decodeString('type'));
  }
}

class CatDecoder with DecoderMixin<Cat>, SubDecoderMixin<Cat> {
  const CatDecoder();

  @override
  final String discriminatorValue = 'cat';

  @override
  Cat decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return Cat(
      type: keyed.decodeString('type'),
      lives: keyed.decodeInt('lives'),
    );
  }
}

class DogDecoder with DecoderMixin<Dog>, SubDecoderMixin<Dog> {
  const DogDecoder();

  @override
  final String discriminatorValue = 'dog';

  @override
  Dog decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return Dog(
      type: keyed.decodeString('type'),
      breed: keyed.decodeString('breed'),
    );
  }
}

class CatEncoder implements Encoder<Cat> {
  const CatEncoder();

  @override
  void encodeSerial(Cat value, SerialEncoding encoding) {
    encoding
      ..startObject<String>()
      ..encodeKey('type')
      ..encodeString(value.type)
      ..encodeKey('lives')
      ..encodeInt(value.lives)
      ..endObject();
  }

  @override
  void encodeStruct(Cat value, StructEncoding encoding) {
    encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('lives', value.lives);
  }
}

class DogEncoder with EncoderMixin<Dog> {
  const DogEncoder();

  @override
  Object? encode(Dog value, Encoding encoding) {
    return encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('breed', value.breed);
  }
}

class BirdDecoder with DecoderMixin<Bird>, SubDecoderMixin<Bird> {
  const BirdDecoder();

  @override
  final String discriminatorValue = 'bird';

  @override
  Bird decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return Bird(
      type: keyed.decodeString('type'),
      color: keyed.decodeString('color'),
    );
  }
}

class BirdEncoder with EncoderMixin<Bird> {
  const BirdEncoder();

  @override
  Object? encode(Bird value, Encoding encoding) {
    return encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('color', value.color);
  }
}

class BirdMapper extends Mapper<Bird>
    implements CodableMapper<Bird> {
  const BirdMapper();

  @override
  Codable<Bird> codable() => const BirdCodable();
}

class BirdCodable implements Codable<Bird> {
  const BirdCodable();

  @override
  Decoder<Bird> decoder() => const BirdDecoder();

  @override
  Encoder<Bird> encoder() => const BirdEncoder();
}