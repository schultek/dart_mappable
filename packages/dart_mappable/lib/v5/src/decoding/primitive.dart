import '../mapper.dart';
import 'decoding.dart';

class ListDecoder<E> extends GenericDecoderBase1<List<E>, E> {
  ListDecoder([super.decoderA]);

  @override
  List<E> decodeSerial(SerialDecoding decoding) {
    final decoder = decoderA ?? findDecoderFor<E>();

    return [
      for (; decoding.nextItem();) decoding.decodeDecodable(decoder),
    ];
  }

  @override
  List<E> decodeStruct(StructDecoding decoding) {
    final decoder = decoderA ?? findDecoderFor<E>();

    return decoding.decodeListDecodable(decoder);
  }
}
