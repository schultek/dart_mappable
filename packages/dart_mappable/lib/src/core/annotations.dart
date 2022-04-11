import 'case_style.dart';

/// Used to annotate a class
/// in order to generate mapping code
class MappableClass {
  const MappableClass({
    this.caseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.discriminatorValue,
    this.hooks,
    this.generateMethods,
  });

  /// The case style for the map keys
  final CaseStyle? caseStyle;

  /// If true removes all map keys with null values
  final bool? ignoreNull;

  /// Property key used for type discriminators
  final String? discriminatorKey;

  /// Custom value for the discriminator property
  final dynamic discriminatorValue;

  /// Define custom hooks used only for this class
  final MappingHooks? hooks;

  /// Specify which methods to generate for this class
  final int? generateMethods;

  static const useAsDefault = MappingFlags.useAsDefault;
}

/// Collection of flags used for annotations
enum MappingFlags { useAsDefault }

/// Collection of constants to indicate which methods and extensions to generate for a specific class
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
/// or [ValuesMode.indexed] to map each enum value to its index as [int]
enum ValuesMode { named, indexed }

/// Used to annotate an enum
/// in order to generate mapping code
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

  /// The default value when decoding a string.
  /// Must be a value of the annotated enum
  final Object? defaultValue;
}

/// Used to annotate an enum value
/// in order to define a custom encoded value
class MappableValue {
  const MappableValue(this.value);

  /// The target value this enum value should be encoded to
  final dynamic value;
}

/// Used to annotate a constructor
/// to be chosen as the decoding function
class MappableConstructor {
  const MappableConstructor();
}

/// Used to annotate a parameter or field
/// to overwrite the mapped key
class MappableField {
  const MappableField({this.key, this.hooks});

  /// Use this key instead of the field name
  final String? key;

  /// Define custom hooks used only for this field
  final MappingHooks? hooks;
}

/// Used to annotate a library
/// to define default values and include / exclude classes
class MappableLib {
  const MappableLib({
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
    this.include,
    this.exclude,
  }) : assert(include == null || exclude == null);

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

  /// Specify which classes to include
  final List<Type>? include;

  /// Specify which classes to exclude
  final List<Type>? exclude;
}

/// Extend this class to define custom [MappingHooks] for a class or field
abstract class MappingHooks {
  const MappingHooks();

  dynamic beforeDecode(dynamic value) => value;
  dynamic afterDecode(dynamic value) => value;

  dynamic beforeEncode(dynamic value) => value;
  dynamic afterEncode(dynamic value) => value;
}

/// Used to annotate a class used as a custom mapper.
/// The target class must implement [Mapper], e.g. by extending [SimpleMapper] or [BaseMapper]
class CustomMapper {
  const CustomMapper();
}
