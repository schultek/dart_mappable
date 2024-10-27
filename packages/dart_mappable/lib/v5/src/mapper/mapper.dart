import 'package:type_plus/type_plus.dart';

import '../protocol/common.dart';

abstract class Mapper<T> {
  const Mapper();

  /// A unique id for this type, defaults to the name of the type.
  ///
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  /// A getter for the type of this mapper.
  Type get type => T;

  bool isFor(dynamic v) => v is T;
  bool isForType(Type type) => type.base == T;
}

abstract interface class DecoderOf<T> implements Mapper<T> {
  Decoder<T> decoder();
}

abstract interface class DecoderOf1<T> implements Mapper<T> {
  Decoder<T> decoder<A>([Decoder<A>? d1]);
}

abstract interface class DecoderOf2<T> implements Mapper<T> {
  Decoder<T> decoder<A, B>([Decoder<A>? d1, Decoder<B>? d2]);
}

abstract interface class EncoderOf<T> implements Mapper<T> {
  Encoder<T> encoder();
}

abstract interface class EncoderOf1<T> implements Mapper<T> {
  Encoder<T> encoder<A>([Encoder<A>? e1]);
}

abstract interface class EncoderOf2<T> implements Mapper<T> {
  Encoder<T> encoder<A, B>([Encoder<A>? e1, Encoder<B>? e2]);
}
