import 'case_style.dart';
import 'mapper_container.dart';
import 'mappers/mapper_base.dart';

/// Used to annotate a class
/// in order to generate mapping code
///
/// {@category Introduction}
/// {@category Models}
/// {@category Configuration}
/// {@category Polymorphism}
/// {@category Mapping Hooks}
/// {@category Custom Mappers}
class MappableClass {
  const MappableClass({
    this.caseStyle,
    this.ignoreNull,
    this.uniqueId,
    this.discriminatorKey,
    this.discriminatorValue,
    this.hook,
    this.generateMethods,
    this.includeSubClasses,
    this.includeCustomMappers,
  });

  /// The case style for the map keys
  final CaseStyle? caseStyle;

  /// If true removes all map keys with null values
  final bool? ignoreNull;

  /// A unique id representing this class
  ///
  /// This only needs to be set when you have two classes with the same name
  /// and want to use generic serialization.
  final String? uniqueId;

  /// Property key used for type discriminators
  final String? discriminatorKey;

  /// Custom value for the discriminator property
  final dynamic discriminatorValue;

  /// Define custom hooks used only for this class
  final MappingHook? hook;

  /// Specify which methods to generate for this class
  final int? generateMethods;

  /// Specify additional subclasses of this class for polymorphism.
  final Iterable<Type>? includeSubClasses;

  final Iterable<Type>? includeCustomMappers;

  static const useAsDefault = MappingFlags.useAsDefault;
}

/// Collection of flags used for annotations
enum MappingFlags { useAsDefault }

/// Collection of constants to indicate which methods and extensions to generate for a specific class.
///
/// {@category Configuration}
class GenerateMethods {
  /// Indicates to generate the fromMap / fromJson methods
  static const decode = 0x1;

  /// Indicates to generate the toMap / toJson methods
  static const encode = 0x2;

  /// Indicates to generate the toString method
  static const stringify = 0x04;

  /// Indicates to generate the == and hashCode methods
  static const equals = 0x08;

  /// Indicates to generate the copyWith method
  static const copy = 0x10;

  /// Indicates to generate all available methods
  static const all = 0x1F;

  /// Parses a list of flags to the correct method combination
  static int? parse(List<String>? flags) {
    if (flags == null) return null;
    int joinedFlag = 0;
    for (var flag in flags) {
      switch (flag) {
        case 'decode':
          joinedFlag |= GenerateMethods.decode;
          break;
        case 'encode':
          joinedFlag |= GenerateMethods.encode;
          break;
        case 'stringify':
          joinedFlag |= GenerateMethods.stringify;
          break;
        case 'equals':
          joinedFlag |= GenerateMethods.equals;
          break;
        case 'copy':
          joinedFlag |= GenerateMethods.copy;
          break;
        case 'all':
          joinedFlag |= GenerateMethods.all;
          break;
      }
    }
    return joinedFlag;
  }
}

/// The mode used for encoding the enum values.
/// Can be [ValuesMode.named] to map each enum value to its name as [String]
/// or [ValuesMode.indexed] to map each enum value to its index as [int].
///
/// {@category Enums}
enum ValuesMode { named, indexed }

/// Used to annotate an enum
/// in order to generate mapping code
///
/// {@category Enums}
class MappableEnum {
  const MappableEnum({
    this.mode = ValuesMode.named,
    this.caseStyle,
    this.defaultValue,
  });

  /// The mode used for encoding the enum values.
  /// Can be [ValuesMode.named] to map each enum value to its name as [String]
  /// or [ValuesMode.indexed] to map each enum value to its index as [int]
  final ValuesMode mode;

  /// The case style for the stringified enum values
  final CaseStyle? caseStyle;

  /// The default value when serialization a string.
  /// Must be a value of the annotated enum
  final Object? defaultValue;
}

/// Used to annotate an enum value
/// in order to define a custom encoded value.
///
/// {@category Enums}
class MappableValue {
  const MappableValue(this.value);

  /// The target value this enum value should be encoded to
  final dynamic value;
}

/// Used to annotate a constructor
/// to be chosen as the serialization function.
///
/// {@category Models}
/// {@category Configuration}
class MappableConstructor {
  const MappableConstructor();
}

/// Used to annotate a parameter or field
/// to overwrite the mapped key.
///
/// {@category Models}
/// {@category Configuration}
/// {@category Mapping Hooks}
class MappableField {
  const MappableField({this.key, this.hook});

  /// Use this key instead of the field name
  final String? key;

  /// Define custom hooks used only for this field
  final MappingHook? hook;
}

/// Used to annotate a library to define default values.
///
/// {@category Configuration}
/// {@category Generics}
/// {@category Polymorphism}
class MappableLib {
  const MappableLib({
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
    this.createCombinedContainer,
    this.discoveryMode,
  });

  /// The case style for the map keys
  final CaseStyle? caseStyle;

  /// The case style for the stringified enum values
  final CaseStyle? enumCaseStyle;

  /// If true removes all map keys with null values
  final bool? ignoreNull;

  /// Property key used for type discriminators
  final String? discriminatorKey;

  /// Specify which methods to generate for classes
  final int? generateMethods;

  /// Whether to create a new <filename>.container.dart file with a container that
  /// combines a set of discovered mappers.
  final bool? createCombinedContainer;

  /// How to discover mappers when [createLinkedContainer] is true.
  final DiscoveryMode? discoveryMode;
}

/// How to discover mappers when [MappableLib.createLinkedContainer] is true.
///
/// {@category Generics}
enum DiscoveryMode {
  /// Discover all models in the current library (default).
  library,

  /// Discover all models in the current or any subdirectory.
  directory,

  /// Discover all models in the current package.
  package,
}

/// Extend this class to define a custom [MappingHook] for a class or field.
///
/// {@category Mapping Hooks}
abstract class MappingHook {
  const MappingHook();

  Object? beforeDecode(Object? value) => value;
  Object? afterDecode(Object? value) => value;

  Object? beforeEncode(Object? value) => value;
  Object? afterEncode(Object? value) => value;

  T wrapDecode<T>(
      dynamic value, T Function(dynamic value) fn, MapperContainer container) {
    var v = beforeDecode(value as Object);
    if (v is! T) v = fn(v) as Object;
    return afterDecode(v) as T;
  }

  T wrapDecoder<M extends MapperBase<T>, T extends Object>(DecodingContext<Object?, M, T> context, Decoder<Object?, M, T> decoder) {
    context = context.change<Object?>(beforeDecode(context.value));
    var out = context.change<T>(context.value is! T ? decoder(context) : context.value as T);
    return afterDecode(out.value) as T;
  }

  Object? wrapEncoder<M extends MapperBase<T>, T extends Object>(EncodingContext<Object?, M, T> context, Encoder<Object?, T, M, T> encoder) {
    context = context.change<Object?>(beforeEncode(context.value));
    if (context.value is T) {
      if (context is! EncodingContext<T, M, T>) {
        context = context.change<T>(context.value as T);
      }
      context = context.change<Object?>(encoder(context));
    }
    return afterDecode(context.value);
  }

  dynamic wrapEncode<T>(
      T value, dynamic Function(T value) fn, MapperContainer container) {
    var v = beforeEncode(value as Object);
    if (v is T) v = fn(v) as Object;
    return afterEncode(v);
  }
}
