part of 'common.dart';

abstract interface class Encodable<T> {
  Encoder<T> encoder();
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
}
