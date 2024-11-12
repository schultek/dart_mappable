import 'package:type_plus/type_plus.dart';

import '../src/extensions/extensions.dart';
import '../src/mapper/inheritance.dart';
import '../src/protocol/protocol.dart';

class A<T> {
  static Decoder<A<T>> decoder<T>([Decoder<T>? d1]) => ADecoder(d1);
}

class ADecoder<T> with DecoderMixin<A<T>>, SuperDecoderMixin<A<T>> {
  ADecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  final String discriminatorKey = 'type';

  @override
  List<SubDecoderMixin> getSubDecoders() => [
        BDecoder<T>(d1),
        if (isBounded<T, num>())
          boundedDecoder1<T>(
              <T extends num>() => CDecoder<T>(d1 as Decoder<T>?)),
        DDecoder<dynamic, T>(null, d1),
        GDecoder<T, A<T>>(d1, null),
        HDecoder(),
        if (isBounded<T, num>())
          boundedDecoder1<T>(<T extends num>() => IDecoder<C<T>, T>()),
      ];

  @override
  A<T> decode(Decoding decoding) {
    return A();
  }
}

class B<T> extends A<T> {
  static Decoder<B<T>> decoder<T>([Decoder<T>? d1]) => BDecoder(d1);
}

class BDecoder<T> with DecoderMixin<B<T>>, SubDecoderMixin<B<T>> {
  BDecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  final String discriminatorValue = 'B';

  @override
  B<T> decode(Decoding decoding) {
    return B();
  }
}

class C<T extends num> extends A<T> {
  static Decoder<C<T>> decoder<T extends num>() => CDecoder<T>();
}

class CDecoder<T extends num> with DecoderMixin<C<T>>, SubDecoderMixin<C<T>> {
  CDecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  final String discriminatorValue = 'C';

  @override
  C<T> decode(Decoding decoding) {
    return C();
  }
}

class D<T, V> extends A<V> {
  static Decoder<D<T, V>> decoder<T, V>([Decoder<T>? d1, Decoder<V>? d2]) =>
      DDecoder<T, V>(d1, d2);
}

class DDecoder<T, V> extends DecoderBase2<D<T, V>, T, V>
    with
        DecoderMixin<D<T, V>>,
        SubDecoderMixin<D<T, V>>,
        SuperDecoderMixin<D<T, V>> {
  const DDecoder([super.d1, super.d2]);

  @override
  final String discriminatorKey = 'type';

  @override
  final String discriminatorValue = 'D';

  @override
  List<SubDecoderMixin> getSubDecoders() {
    return [
      if (isBounded<V, List>())
        if (decoderB case DecoderBase1 d)
          d.extract(<E>(dA) => EDecoder<E, T>(dA, decoderA))
        else
          V.args.first.provideTo(<E>() {
            return EDecoder<E, T>(null, decoderA);
          }),
      if (isBounded<T, V>() && isBounded<V, num>())
        boundedDecoder2<T, V>(<V extends U, U extends num>() {
          return JDecoder<C<V>, V, U>();
        }),
    ];
  }

  @override
  D<T, V> decode(Decoding decoding) {
    return D();
  }
}

class E<T, V> extends D<V, List<T>> {
  static Decoder<E<T, V>> decoder<T, V>([Decoder<T>? d1, Decoder<V>? d2]) =>
      EDecoder<T, V>(d1, d2);
}

class EDecoder<T, V>
    with
        DecoderMixin<E<T, V>>,
        SubDecoderMixin<E<T, V>>,
        SuperDecoderMixin<E<T, V>> {
  EDecoder([this.d1, this.d2]);

  final Decoder<T>? d1;
  final Decoder<V>? d2;

  @override
  final String discriminatorKey = 'type';

  @override
  final String discriminatorValue = 'E';

  @override
  List<SubDecoderMixin> getSubDecoders() => [
        FDecoder(),
      ];

  @override
  E<T, V> decode(Decoding decoding) {
    return E();
  }
}

class F extends E<int, String> {
  static Decoder<F> decoder() => FDecoder();
}

class FDecoder with DecoderMixin<F>, SubDecoderMixin<F> {
  FDecoder();

  @override
  final String discriminatorValue = 'F';

  @override
  F decode(Decoding decoding) {
    return F();
  }
}

class G<T, V extends A<T>> extends A<T> {
  static Decoder<G<T, V>> decoder<T, V extends A<T>>(
          [Decoder<T>? d1, Decoder<V>? d2]) =>
      GDecoder<T, V>(d1, d2);
}

class GDecoder<T, V extends A<T>>
    with DecoderMixin<G<T, V>>, SubDecoderMixin<G<T, V>> {
  GDecoder([this.d1, this.d2]);

  final Decoder<T>? d1;
  final Decoder<V>? d2;

  @override
  final String discriminatorValue = 'G';

  @override
  G<T, V> decode(Decoding decoding) {
    return G();
  }
}

class H<T extends C> extends A {
  static Decoder<H<T>> decoder<T extends C>([Decoder<T>? d1]) =>
      HDecoder<T>(d1);
}

class HDecoder<T extends C> with DecoderMixin<H<T>>, SubDecoderMixin<H<T>> {
  HDecoder([this.d1]);

  final Decoder<T>? d1;

  @override
  final String discriminatorValue = 'H';

  @override
  H<T> decode(Decoding decoding) {
    return H();
  }
}

class I<T extends C<V>, V extends num> extends A<V> {
  static Decoder<I<T, V>> decoder<T extends C<V>, V extends num>(
          [Decoder<T>? d1, Decoder<V>? d2]) =>
      IDecoder(d1, d2);
}

class IDecoder<T extends C<V>, V extends num>
    with DecoderMixin<I<T, V>>, SubDecoderMixin<I<T, V>> {
  IDecoder([this.d1, this.d2]);

  final Decoder<T>? d1;
  final Decoder<V>? d2;

  @override
  final String discriminatorValue = 'I';

  @override
  I<T, V> decode(Decoding decoding) {
    return I();
  }
}

class J<T extends C<V>, V extends U, U extends num> extends D<V, U> {
  static Decoder<J<T, V, U>>
      decoder<T extends C<V>, V extends U, U extends num>(
              [Decoder<T>? d1, Decoder<V>? d2, Decoder<U>? d3]) =>
          JDecoder(d1, d2, d3);
}

class JDecoder<T extends C<V>, V extends U, U extends num>
    with DecoderMixin<J<T, V, U>>, SubDecoderMixin<J<T, V, U>> {
  JDecoder([this.d1, this.d2, this.d3]);

  final Decoder<T>? d1;
  final Decoder<V>? d2;
  final Decoder<U>? d3;

  @override
  final String discriminatorValue = 'J';

  @override
  J<T, V, U> decode(Decoding decoding) {
    return J();
  }
}
