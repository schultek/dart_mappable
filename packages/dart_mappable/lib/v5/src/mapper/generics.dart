import '../protocol/common.dart';

abstract class GenericDecoderBase1<T, A> implements Decoder<T> {
  const GenericDecoderBase1([this.decoderA]);

  final Decoder<A>? decoderA;

  R extract<R>(R Function<A>(Decoder<A>? decoderA) fn) {
    return fn<A>(decoderA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenericDecoderBase1<T, A> &&
          runtimeType == other.runtimeType &&
          decoderA == other.decoderA;

  @override
  int get hashCode => Object.hash(T, decoderA);
}

abstract class GenericDecoderBase2<T, A, B> implements Decoder<T> {
  const GenericDecoderBase2([this.decoderA, this.decoderB]);

  final Decoder<A>? decoderA;
  final Decoder<B>? decoderB;

  R extract<R>(
      R Function<A, B>(Decoder<A>? decoderA, Decoder<B>? decoderB) fn) {
    return fn<A, B>(decoderA, decoderB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenericDecoderBase2<T, A, B> &&
          runtimeType == other.runtimeType &&
          decoderA == other.decoderA &&
          decoderB == other.decoderB;

  @override
  int get hashCode => Object.hash(T, decoderA, decoderB);
}
