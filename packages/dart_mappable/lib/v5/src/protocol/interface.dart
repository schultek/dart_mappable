part of 'common.dart';

abstract interface class Encodable<T> {
  Encoder<T> encoder();
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
}

abstract interface class Decodable<T> {
  Decoder<T> decoder();
}



abstract interface class Codable<T> implements Encodable<T>, Decodable<T> {}