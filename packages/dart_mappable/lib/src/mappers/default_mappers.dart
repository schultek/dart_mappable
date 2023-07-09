import '../mapper_exception.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';
import 'mapping_context.dart';
import 'simple_mapper.dart';

/// The mapper implementation used for all primitive types.
class PrimitiveMapper<T extends Object> extends MapperBase<T>
    with PrimitiveMethodsMixin<T> {
  const PrimitiveMapper([T Function(Object value)? decoder, this.exactType])
      : _decoder = decoder ?? _cast<T>;

  final T Function(Object value) _decoder;
  final Type? exactType;

  @override
  Type get type => exactType ?? super.type;
  @override
  bool isFor(dynamic v) {
    return exactType != null ? v.runtimeType == exactType : super.isFor(v);
  }

  static T _cast<T>(v) => v as T;

  @override
  T decoder(Object value, DecodingContext context) {
    return _decoder(value);
  }

  @override
  Object encoder(T value, EncodingContext context) {
    return value;
  }
}

/// The mapper interface used for all concrete enum mappers.
///
/// {@category Custom Mappers}
abstract class EnumMapper<T extends Enum> extends SimpleMapper<T> {
  const EnumMapper();
}

/// A mapper that encodes a [DateTime] object into a formatted iso string and
/// vice versa.
///
/// It can also decode numbers in unix milliseconds time.
class DateTimeMapper extends SimpleMapper<DateTime> {
  const DateTimeMapper();

  @override
  DateTime decode(dynamic value) {
    if (value is String) {
      return DateTime.parse(value);
    } else if (value is num) {
      return DateTime.fromMillisecondsSinceEpoch(value.round());
    } else {
      throw MapperException.unexpectedType(value.runtimeType, 'String or num');
    }
  }

  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

/// The decoding function of a serializable class (`fromJson`) with one generic type parameter.
typedef SerializableDecoder1<T, V> = T Function<A>(V, A Function(Object?));

/// The encoding function of a serializable class (`toJson`) with one generic type parameter.
typedef SerializableEncoder1<T> = Object Function(Object? Function(dynamic))
    Function(T);

/// The type factory definition for a generic type with one type argument.
typedef TypeFactory1 = Object? Function<A>(Object? Function<V>() f);

/// The decoding function of a serializable class (`fromJson`) with two generic type parameters.
typedef SerializableDecoder2<T, V> = T Function<A, B>(
    V, A Function(Object?), B Function(Object?));

/// The encoding function of a serializable class (`toJson`) with two generic type parameters.
typedef SerializableEncoder2<T> = Object Function(
        Object? Function(dynamic), Object? Function(dynamic))
    Function(T);

/// The type factory definition for a generic type with two type arguments.
typedef TypeFactory2 = Object? Function<A, B>(Object? Function<V>() f);

/// A mapper for handling classes that comply with the json_serializable format.
///
/// This mapper expects a `fromJson` and `toJson` method on a given class.
///
/// {@category Migration and Compatibility}
class SerializableMapper<T extends Object, V extends Object>
    extends MapperBase<T> with PrimitiveMethodsMixin<T> {
  late T Function(V value, DecodingContext context) _decoder;
  late Object Function(T value, EncodingContext context) _encoder;

  @override
  late Function typeFactory;

  @override
  bool includeTypeId<W>(v) => MapperBase.checkStaticType<W>(v);

  SerializableMapper({
    required T Function(V) decode,
    required Object Function() Function(T) encode,
  })  : _decoder = ((v, c) => decode(v)),
        _encoder = ((v, c) => encode(v)()),
        typeFactory = ((f) => f<T>());

  SerializableMapper.arg1({
    required SerializableDecoder1<T, V> decode,
    required SerializableEncoder1<T> encode,
    required TypeFactory1 type,
  }) {
    _decoder = ((v, c) =>
        c.callWith1(<A>(_) => decode<A>(v, c.container.fromValue<A>)));
    _encoder = ((v, c) => c.callWith1(
        <A>(_) => encode(v)((o) => c.container.toValue<A>(o as A)))!);
    typeFactory = type;
  }

  SerializableMapper.arg2({
    required SerializableDecoder2<T, V> decode,
    required SerializableEncoder2<T> encode,
    required TypeFactory2 type,
  }) {
    _decoder = ((v, c) => c.callWith2(<A, B>(_) =>
        decode<A, B>(v, c.container.fromValue<A>, c.container.fromValue<B>)));
    _encoder = ((v, c) => c.callWith2(<A, B>(_) => encode(v)(
        (o) => c.container.toValue<A>(o as A),
        (o) => c.container.toValue<B>(o as B))));
    typeFactory = type;
  }

  @override
  T decoder(Object value, DecodingContext context) {
    return _decoder(value.checked<V>(), context);
  }

  @override
  Object encoder(T value, EncodingContext context) {
    return _encoder(value, context);
  }
}
