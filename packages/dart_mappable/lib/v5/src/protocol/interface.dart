part of 'protocol.dart';

abstract interface class Codable<T> implements Decodable<T>, Encodable<T> {}

abstract interface class Codable1<T, A>
    implements Codable<T>, Decodable1<T, A>, Encodable1<T, A> {}

abstract interface class Codable2<T, A, B>
    implements Codable<T>, Decodable2<T, A, B>, Encodable2<T, A, B> {}


abstract interface class Decodable<T> {
  Decoder<T> decoder();
}

abstract interface class Decodable1<T, A> implements Decodable<T> {
  @override
  Decoder<T> decoder([Decoder<A>? d1]);
}
abstract interface class Decodable2<T, A, B> implements Decodable<T> {
  @override
  Decoder<T> decoder([Decoder<A>? d1, Decoder<B>? d2]);
}


abstract interface class SuperEncodable {
  Encoder<Object?> encoder();
}

abstract interface class Encodable<T> implements SuperEncodable {
  @override
  Encoder<T> encoder();
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
}

abstract interface class Encodable2<T, A, B> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1, Encoder<B>? e2]);
}
