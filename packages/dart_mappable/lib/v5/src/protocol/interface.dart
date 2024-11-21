part of 'protocol.dart';

abstract interface class Codable<T> implements Decodable<T>, Encodable<T> {}

abstract interface class Codable1<T, A>
    implements Codable<T>, Decodable1<T, A>, Encodable1<T, A> {}

abstract interface class Codable2<T, A, B>
    implements Codable<T>, Decodable2<T, A, B>, Encodable2<T, A, B> {}


abstract interface class Decodable<T> {
  Decode<T> decode();
}

abstract interface class Decodable1<T, A> implements Decodable<T> {
  @override
  Decode<T> decode([Decode<A>? d1]);
}
abstract interface class Decodable2<T, A, B> implements Decodable<T> {
  @override
  Decode<T> decode([Decode<A>? d1, Decode<B>? d2]);
}


abstract interface class SuperEncodable {
  Encode<Object?> encode();
}

abstract interface class Encodable<T> implements SuperEncodable {
  @override
  Encode<T> encode();
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encode<T> encode([Encode<A>? e1]);
}

abstract interface class Encodable2<T, A, B> implements Encodable<T> {
  @override
  Encode<T> encode([Encode<A>? e1, Encode<B>? e2]);
}
