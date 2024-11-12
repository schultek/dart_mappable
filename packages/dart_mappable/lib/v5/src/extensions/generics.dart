part of 'extensions.dart';

abstract class DecoderBase1<T, A> implements Decoder<T> {
  const DecoderBase1([this.decoderA]);

  final Decoder<A>? decoderA;

  R extract<R>(R Function<A>(Decoder<A>? decoderA) fn) {
    return fn<A>(decoderA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DecoderBase1<T, A> &&
              runtimeType == other.runtimeType &&
              decoderA == other.decoderA;

  @override
  int get hashCode => Object.hash(T, decoderA);
}

abstract class DecoderBase2<T, A, B> implements Decoder<T> {
  const DecoderBase2([this.decoderA, this.decoderB]);

  final Decoder<A>? decoderA;
  final Decoder<B>? decoderB;

  R extract<R>(
      R Function<A, B>(Decoder<A>? decoderA, Decoder<B>? decoderB) fn) {
    return fn<A, B>(decoderA, decoderB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DecoderBase2<T, A, B> &&
              runtimeType == other.runtimeType &&
              decoderA == other.decoderA &&
              decoderB == other.decoderB;

  @override
  int get hashCode => Object.hash(T, decoderA, decoderB);
}

abstract class EncoderBase1<T, A> implements Encoder<T> {
  const EncoderBase1([this.encoderA]);

  final Encoder<A>? encoderA;

  R extract<R>(R Function<A>(Encoder<A>? encoderA) fn) {
    return fn<A>(encoderA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EncoderBase1<T, A> &&
              runtimeType == other.runtimeType &&
              encoderA == other.encoderA;

  @override
  int get hashCode => Object.hash(T, encoderA);
}

abstract class EncoderBase2<T, A, B> implements Encoder<T> {
  const EncoderBase2([this.encoderA, this.encoderB]);

  final Encoder<A>? encoderA;
  final Encoder<B>? encoderB;

  R extract<R>(
      R Function<A, B>(Encoder<A>? encoderA, Encoder<B>? encoderB) fn) {
    return fn<A, B>(encoderA, encoderB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EncoderBase2<T, A, B> &&
              runtimeType == other.runtimeType &&
              encoderA == other.encoderA &&
              encoderB == other.encoderB;

  @override
  int get hashCode => Object.hash(T, encoderA, encoderB);
}
