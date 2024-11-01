import '../src/mapper/inheritance.dart';
import '../src/mapper/mapper.dart';
import '../src/protocol/common.dart';

abstract class Animal implements Encodable<Animal> {
  Animal({required this.type});

  final String type;

  static Decoder<Animal> decoder() => const AnimalDecoder();
}

class Cat extends Animal {
  Cat({this.lives = 7, super.type = 'cat'});

  final int lives;

  static Decoder<Cat> decoder() => const CatDecoder();
  @override
  Encoder<Cat> encoder() => const CatEncoder();
}

class Dog extends Animal {
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

    throw "Unknown subtype of Animal";
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
  Object? encodeStruct(Cat value, StructEncoding encoding) {
    return encoding.encodeKeyed<String>()
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
    implements DecoderOf<Bird>, EncoderOf<Bird> {
  const BirdMapper();

  @override
  Decoder<Bird> decoder() => const BirdDecoder();

  @override
  Encoder<Bird> encoder() => const BirdEncoder();
}
