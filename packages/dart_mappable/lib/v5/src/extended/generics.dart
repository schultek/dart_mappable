part of 'extended.dart';

abstract class DecodeBase1<T, A> {
  const DecodeBase1([this.decodeA]);

  final Decode<A>? decodeA;

  R extract<R>(R Function<A>(Decode<A>? decodeA) fn) {
    return fn<A>(decodeA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DecodeBase1<T, A> &&
              runtimeType == other.runtimeType &&
              decodeA == other.decodeA;

  @override
  int get hashCode => Object.hash(T, decodeA);
}

abstract class DecodeBase2<T, A, B> {
  const DecodeBase2([this.decodeA, this.decodeB]);

  final Decode<A>? decodeA;
  final Decode<B>? decodeB;

  R extract<R>(
      R Function<A, B>(Decode<A>? decodeA, Decode<B>? decodeB) fn) {
    return fn<A, B>(decodeA, decodeB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DecodeBase2<T, A, B> &&
              runtimeType == other.runtimeType &&
              decodeA == other.decodeA &&
              decodeB == other.decodeB;

  @override
  int get hashCode => Object.hash(T, decodeA, decodeB);
}

abstract class EncodeBase1<T, A> implements Encode<T> {
  const EncodeBase1([this.encodeA]);

  final Encode<A>? encodeA;

  R extract<R>(R Function<A>(Encode<A>? encodeA) fn) {
    return fn<A>(encodeA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EncodeBase1<T, A> &&
              runtimeType == other.runtimeType &&
              encodeA == other.encodeA;

  @override
  int get hashCode => Object.hash(T, encodeA);
}

abstract class EncodeBase2<T, A, B> implements Encode<T> {
  const EncodeBase2([this.encodeA, this.encodeB]);

  final Encode<A>? encodeA;
  final Encode<B>? encodeB;

  R extract<R>(
      R Function<A, B>(Encode<A>? encodeA, Encode<B>? encodeB) fn) {
    return fn<A, B>(encodeA, encodeB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EncodeBase2<T, A, B> &&
              runtimeType == other.runtimeType &&
              encodeA == other.encodeA &&
              encodeB == other.encodeB;

  @override
  int get hashCode => Object.hash(T, encodeA, encodeB);
}
