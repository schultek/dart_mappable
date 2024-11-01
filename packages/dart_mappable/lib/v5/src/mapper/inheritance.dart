import '../protocol/common.dart';
import 'container.dart';

List<SubDecoderMixin<T>> findSubDecodersFor<T>() {
  var mappers = MapperContainer.current.findAll<T>();
  return mappers
      .map((m) => getDecoderOf<T>(m))
      .whereType<SubDecoderMixin<T>>()
      .toList();
}

bool isBounded<Type, Bound>() => _Type<Type>() is _Type<Bound>;

class _Type<T> {}

abstract mixin class SuperDecoderMixin<T> implements Decoder<T> {
  String? get discriminatorKey => null;

  /// The fallback subclass mapper for this class.
  SubDecoderMixin? getDefaultSubDecoder() => null;

  /// The set of subclass mappers for this class.
  List<SubDecoderMixin> getSubDecoders();

  T? decodeSubtype(Decoding decoding) {
    final decoder = getSubDecoder(decoding);
    return decoder != null ? decoding.decodeObject(decoder) : null;
  }

  List<SubDecoderMixin> _collectDecodersOrCached() {
    final cached =
        MapperContainer.current.getCached<List<SubDecoderMixin>>(this);
    if (cached != null) {
      return cached;
    }

    final decoders = [
      ...getSubDecoders(),
      ...findSubDecodersFor<T>(),
    ];
    MapperContainer.current.setCached(this, decoders);
    return decoders;
  }

  Decoder<T>? getSubDecoder(Decoding decoding, [String? currentValue]) {
    final decoders = _collectDecodersOrCached();

    String? discriminatorValue = currentValue;
    if (discriminatorValue == null && discriminatorKey != null) {
      discriminatorValue = decoding
          .clone()
          .decodeKeyed<String>()
          .decodeStringOrNull(discriminatorKey!);
    }

    for (var d in decoders) {
      if (d is SubDecoderMixin<T> &&
          d.canDecode(decoding, discriminatorKey, discriminatorValue)) {
        return d;
      }
    }

    var defaultDecoder = getDefaultSubDecoder();
    if (defaultDecoder != null && defaultDecoder is SubDecoderMixin<T>) {
      return defaultDecoder;
    }
    return null;
  }

  SubDecoderMixin boundedDecoder1<A>(Function callback) {
    return callback<A>() as SubDecoderMixin;
  }

  SubDecoderMixin boundedDecoder2<A, B>(Function callback) {
    return callback<A, B>() as SubDecoderMixin;
  }
}

abstract mixin class SubDecoderMixin<T> implements Decoder<T> {
  dynamic get discriminatorValue;

  bool canDecode(Decoding decoding, String? currentKey, String? currentValue) {
    var discriminator = discriminatorValue;
    if (identical(discriminator, 'use_as_default')) {
      return true;
    }

    if (discriminator is Function) {
      if (discriminator is bool Function(Decoding)) {
        return discriminator(decoding.clone());
      } else {
        throw AssertionError(
            'Discriminator function must be of type "bool Function(Map<String, dynamic>)".');
      }
    }

    if (currentValue == discriminator) {
      return true;
    }

    if (this case SuperDecoderMixin<T> d
        when d.discriminatorKey == currentKey) {
      return d.getSubDecoder(decoding, currentValue) != null;
    }

    return false;
  }
}
