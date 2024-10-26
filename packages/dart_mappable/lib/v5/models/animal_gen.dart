import '../src/decoding/decoding.dart';
import '../src/encoding/encoding.dart';
import '../src/mapper.dart';

abstract class AnimalGen<T> implements Encodable<AnimalGen<T>> {
  AnimalGen({required this.type});

  final String type;

  static Decoder<AnimalGen<T>> decoder<T>([Decoder<T>? d1]) =>
      AnimalGenDecoder(d1);
}

class CatGen<T> extends AnimalGen<T> {
  CatGen({this.lives = 7, super.type = 'cat'});

  final int lives;

  static Decoder<CatGen<T>> decoder<T>([Decoder<T>? d1]) => CatGenDecoder(d1);
  @override
  Encoder<CatGen<T>> encoder([Encoder<T>? e1]) => CatGenEncoder<T>(e1);
}

class DogGen extends AnimalGen<String> {
  DogGen({required this.breed, super.type = 'dog'});

  final String breed;

  static Decoder<DogGen> decoder() => const DogGenDecoder();
  @override
  Encoder<DogGen> encoder() => const DogGenEncoder();
}

class BirdGen<A, B extends num> extends AnimalGen<B> {
  BirdGen({required this.color, super.type = 'bird'});

  final String color;

  static Decoder<BirdGen> decoder() => const BirdGenDecoder();
  @override
  Encoder<BirdGen<A, B>> encoder([Encoder<A>? e1, Encoder<B>? e2]) =>
      BirdGenEncoder(e1, e2);
}

class AnimalGenDecoder<T>
    with DecoderMixin<AnimalGen<T>>, SuperDecoderMixin<AnimalGen<T>> {
  AnimalGenDecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  late final Set<SubDecoderMixin> subDecoders = {
    CatGenDecoder<T>(d1),
    DogGenDecoder(),
    if (isBounded<T, num>())
      boundedDecoder1<T>(<T extends num>() {
        return BirdGenDecoder<dynamic, T>(null, d1 as Decoder<T>?);
      }),
  };

  @override
  AnimalGen<T> decode(Decoding decoding) {
    final subDecoder = getSubDecoder(decoding);

    if (subDecoder != null) {
      return decoding.decodeDecodable(subDecoder);
    }

    throw "Unknown subtype of Animal";
  }
}

extension BirdGenAnimalGenDecoder<T extends num> on AnimalGenDecoder<T> {
  SubDecoderMixin get birdDecoder => BirdGenDecoder<dynamic, T>(null, d1);
}

class CatGenDecoder<T>
    with DecoderMixin<CatGen<T>>, SubDecoderMixin<CatGen<T>> {
  const CatGenDecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  final String discriminatorKey = 'type';

  @override
  final String discriminatorValue = 'cat';

  @override
  CatGen<T> decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return CatGen(
      type: keyed.decodeString('type'),
      lives: keyed.decodeInt('lives'),
    );
  }
}

class DogGenDecoder with DecoderMixin<DogGen>, SubDecoderMixin<DogGen> {
  const DogGenDecoder();

  @override
  final String discriminatorKey = 'type';

  @override
  final String discriminatorValue = 'dog';

  @override
  DogGen decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return DogGen(
      type: keyed.decodeString('type'),
      breed: keyed.decodeString('breed'),
    );
  }
}

class CatGenEncoder<T> implements Encoder<CatGen<T>> {
  const CatGenEncoder([this.e1]);

  final Encoder<T>? e1;

  @override
  void encodeSerial(CatGen value, SerialEncoding encoding) {
    encoding
      ..startObject<String>()
      ..encodeKey('type')
      ..encodeString(value.type)
      ..encodeKey('lives')
      ..encodeInt(value.lives)
      ..endObject();
  }

  @override
  Object? encodeStruct(CatGen value, StructEncoding encoding) {
    return encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('lives', value.lives);
  }
}

class DogGenEncoder with EncoderMixin<DogGen> {
  const DogGenEncoder();

  @override
  Object? encode(DogGen value, Encoding encoding) {
    return encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('breed', value.breed);
  }
}

class BirdGenDecoder<A, B extends num>
    with DecoderMixin<BirdGen<A, B>>, SubDecoderMixin<BirdGen<A, B>> {
  const BirdGenDecoder([this.d1, this.d2]);

  final Decoder<A>? d1;
  final Decoder<B>? d2;

  @override
  final String discriminatorKey = 'type';

  @override
  final String discriminatorValue = 'bird';

  @override
  BirdGen<A, B> decode(Decoding decoding) {
    final keyed = decoding.decodeKeyed<String>();
    return BirdGen(
      type: keyed.decodeString('type'),
      color: keyed.decodeString('color'),
    );
  }
}

class BirdGenEncoder<A, B extends num> with EncoderMixin<BirdGen<A, B>> {
  const BirdGenEncoder([this.e1, this.e2]);

  final Encoder<A>? e1;
  final Encoder<B>? e2;

  @override
  Object? encode(BirdGen value, Encoding encoding) {
    return encoding.encodeKeyed<String>()
      ..encodeValue('type', value.type)
      ..encodeValue('color', value.color);
  }
}

class BirdGenMapper extends Mapper<BirdGen>
    implements DecoderOf<BirdGen>, EncoderOf<BirdGen> {
  const BirdGenMapper();

  @override
  Decoder<BirdGen> decoder() => const BirdGenDecoder();

  @override
  Encoder<BirdGen> encoder() => const BirdGenEncoder();
}
