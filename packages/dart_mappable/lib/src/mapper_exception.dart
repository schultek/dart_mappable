/// General exception class used throughout the package
///
/// {@category Mapper Container}
class MapperException implements Exception {
  final String message;
  const MapperException._(this.message);

  @override
  String toString() => 'MapperException: $message';

  /// Exception when trying to get a mapper for an unregistered type
  factory MapperException.unknownType(Type t) {
    return MapperException._('Unknown type $t. Did you forgot to annotate the '
        'class or register a custom mapper?');
  }

  /// Exception when a required parameter is missing while serialization
  factory MapperException.missingParameter(String key) {
    return MapperException._('Parameter $key is missing.');
  }

  /// Exception for tracking the deep origin of another exception
  factory MapperException.chain(
      MapperMethod method, String hint, Object error) {
    return _ChainedMapperException(method, hint, error);
  }

  /// Exception when passing an unexpected type to a decoder
  factory MapperException.unexpectedType(Type actual, String expected) {
    return MapperException._(
        'Expected a value of type $expected, but got type $actual.');
  }

  /// Exception when getting an unexpected type from an encoder
  factory MapperException.incorrectEncoding(
      Type source, String expected, Type actual) {
    return MapperException._('Failed to encode value of type $source to '
        '$expected. Instead encoded to type $actual.');
  }

  /// Exception when a discriminator for an abstract class has no match
  factory MapperException.missingSubclass(
      String className, String discriminatorKey, String discriminatorValue) {
    return MapperException._('Cannot instantiate class $className, did you '
        'forgot to specify a subclass for [ $discriminatorKey: '
        "'$discriminatorValue' ] or a default subclass?");
  }

  /// Exception when a class has no valid constructor for serialization
  factory MapperException.missingConstructor(String className) {
    return MapperException._('Cannot instantiate class $className, no valid '
        'constructor found.');
  }

  /// Exception when an encoded enum value has no match
  factory MapperException.unknownEnumValue(dynamic value) {
    return MapperException.chain(
        MapperMethod.decode,
        '[$value]',
        MapperException._("No enum value matches '$value', did you use the "
            'correct mode or case-style or forgot to specify a default value?'));
  }

  /// Exception when a method is called that was not specified for generation
  factory MapperException.unsupportedMethod(MapperMethod method, Type type) {
    return MapperException._('Unsupported operation "${method.name}" on type '
        '$type: You can specify the supported operations for a type on its '
        'annotation by using the GenerateMethods flag.');
  }

  factory MapperException.unresolvedType(String type) {
    return MapperException._('Cannot resolve type from property "$type". '
        'Invalid or unregistered type.');
  }

  /// Checks if this is an unsupported operation exception
  bool isUnsupportedOrUnallowed() =>
      message.startsWith('Unsupported operation') ||
      message.startsWith('The Mappable mixin');
}

/// Method indicator used for exceptions
enum MapperMethod { decode, encode, stringify, equals, hash, copy }

class _ChainedMapperException implements MapperException {
  _ChainedMapperException(this.method, this.hint, this.error);

  final MapperMethod method;
  final String hint;
  final Object error;

  @override
  bool isUnsupportedOrUnallowed() => error is MapperException
      ? (error as MapperException).isUnsupportedOrUnallowed()
      : false;

  String get chainedMessage {
    var e = error;
    return hint +
        (e is _ChainedMapperException
            ? e.chainedMessage
            : ': ${e is MapperException ? e.message : '$e'}');
  }

  @override
  String get message {
    return 'Failed to ${method == MapperMethod.equals ? 'compare' : method.name} $chainedMessage';
  }

  @override
  String toString() {
    return 'MapperException: $message';
  }
}
