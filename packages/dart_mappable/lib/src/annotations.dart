import 'case_style.dart';
import 'mappers/mapper_base.dart';

/// Used to annotate a class in order to generate mapping code.
///
/// {@category Introduction}
/// {@category Models}
/// {@category Configuration}
/// {@category Polymorphism}
/// {@category Mapping Hooks}
/// {@category Custom Mappers}
class MappableClass extends MappableInterface {
  const MappableClass({
    super.caseStyle,
    super.ignoreNull,
    super.uniqueId,
    this.discriminatorKey,
    this.discriminatorValue,
    super.hook,
    super.generateMethods,
    this.includeSubClasses,
    super.includeCustomMappers,
    this.shallowEncoding,
    this.includeTypeId,
  }) : super._();

  /// Property key used for type discriminators.
  ///
  /// For polymorphic classes this will be used for identifying the
  /// correct subtype when decoding an object.
  final String? discriminatorKey;

  /// Custom value for the discriminator property.
  ///
  /// If not set this defaults to the class name.
  /// If you want this class to be the default choice when no other discriminator
  /// value matches, use [MappableClass.useAsDefault].
  final dynamic discriminatorValue;

  /// Specify additional subclasses of this class for polymorphism.
  ///
  /// You only need to add subclasses here that are not in the same library
  /// as the superclass. All others are automatically included.
  final Iterable<Type>? includeSubClasses;

  /// Whether to encode nested objects or just one level deep.
  final bool? shallowEncoding;

  /// Whether to include the type id of the object during encoding.
  ///
  /// If true, this adds a '__type' property with the specific runtime type
  /// of the object.
  /// If null (default), the package automatically decides whether to include
  /// the type id based on the static and dynamic type of an object.
  /// If false, the type id is never included.
  ///
  /// The key can be changed from '__type' to something else by setting [MapperContainer.typeIdKey].
  final bool? includeTypeId;

  /// To be used with [discriminatorValue] to signal a default subclass.
  static const useAsDefault = MappingFlags.useAsDefault;
}

/// Collection of flags used for annotations.
enum MappingFlags { useAsDefault }

/// Collection of constants to indicate which methods and extensions to generate
/// for a specific class.
///
/// {@category Configuration}
class GenerateMethods {
  /// Indicates to generate the fromMap / fromJson methods.
  static const decode = 0x1;

  /// Indicates to generate the toMap / toJson methods.
  static const encode = 0x2;

  /// Indicates to generate the toString method.
  static const stringify = 0x04;

  /// Indicates to generate the == and hashCode methods.
  static const equals = 0x08;

  /// Indicates to generate the copyWith method.
  static const copy = 0x10;

  /// Indicates to generate all available methods.
  static const all = 0x1F;
}

/// The mode used for encoding the enum values.
/// Can be [ValuesMode.named] to map each enum value to its name as [String]
/// or [ValuesMode.indexed] to map each enum value to its index as [int].
///
/// {@category Enums}
enum ValuesMode { named, indexed }

/// Used to annotate an enum in order to generate mapping code.
///
/// {@category Enums}
class MappableEnum {
  const MappableEnum({
    this.mode = ValuesMode.named,
    this.caseStyle,
    this.defaultValue,
  });

  /// The mode used for encoding the enum values.
  ///
  /// Can be [ValuesMode.named] to map each enum value to its name as [String]
  /// or [ValuesMode.indexed] to map each enum value to its index as [int]
  final ValuesMode mode;

  /// The case style for the stringified enum values.
  final CaseStyle? caseStyle;

  /// The default value when serialization a string.
  ///
  /// Must be a value of the annotated enum.
  final Object? defaultValue;
}

/// Used to annotate an enum value in order to define a custom encoded value.
///
/// {@category Enums}
class MappableValue {
  const MappableValue(this.value);

  /// The target value this enum value should be encoded to.
  final dynamic value;
}

/// Used to annotate a constructor to be chosen as the serialization function.
///
/// {@category Models}
/// {@category Configuration}
class MappableConstructor {
  const MappableConstructor();
}

/// Used to annotate a parameter or field to overwrite the mapped key.
///
/// {@category Models}
/// {@category Records}
/// {@category Configuration}
/// {@category Mapping Hooks}
class MappableField {
  const MappableField({
    this.key,
    this.hook,
    this.includeFromJson,
    this.includeToJson,
    this.includeIfNull,
  });

  /// Use this key instead of the field name.
  final String? key;

  /// Define custom hooks used only for this field.
  final MappingHook? hook;

  /// Whether to include this field during deserialization (fromJson/fromMap).
  ///
  /// If false, this field will be ignored when decoding from JSON/Map.
  /// Defaults to true.
  final bool? includeFromJson;

  /// Whether to include this field during serialization (toJson/toMap).
  ///
  /// If false, this field will be ignored when encoding to JSON/Map.
  /// Defaults to true.
  final bool? includeToJson;

  /// Whether to include this field even if its value is null.
  ///
  /// This overrides the class-level [ignoreNull] setting for this specific field.
  /// If true, null values will be included in serialization.
  /// Defaults to false (respects class-level ignoreNull setting).
  final bool? includeIfNull;
}

/// Used to annotate a record in order to generate mapping code.
///
/// {@category Records}
class MappableRecord extends MappableInterface {
  const MappableRecord({
    super.caseStyle,
    super.ignoreNull,
    super.uniqueId,
    super.hook,
    super.includeCustomMappers,
  }) : super._();
}

/// Used to annotate an interface in order to generate mapping code.
///
/// {@category Models}
abstract class MappableInterface {
  const MappableInterface._({
    this.caseStyle,
    this.ignoreNull,
    this.uniqueId,
    this.hook,
    this.generateMethods,
    this.includeCustomMappers,
  });

  /// The case style for the map keys.
  final CaseStyle? caseStyle;

  /// If true removes all map keys with null values.
  final bool? ignoreNull;

  /// A unique id representing this class.
  ///
  /// This only needs to be set when you have two classes with the same name
  /// and want to use generic serialization.
  final String? uniqueId;

  /// Set a custom hook used only for this class.
  ///
  /// Hooks allow you to hook into the decoding and encoding process
  /// and insert custom logic.
  final MappingHook? hook;

  /// Specify which methods to generate for this class.
  ///
  /// Defaults to all methods.
  /// Use this with the [GenerateMethods] static properties, like
  /// [GenerateMethods.decode]. To set multiple methods, combine properties
  /// using the `|` operator.
  final int? generateMethods;

  /// Specify additional custom mappers that should be used for fields
  /// of this class.
  ///
  /// This does not scope the mappers to this class only. All mappers are always
  /// registered globally and available to all classes. This only makes sure
  /// that the needed mappers are registered before they are needed for this class.
  final Iterable<MapperBase>? includeCustomMappers;
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
    this.generateInitializerForScope,
  });

  /// The case style for the map keys.
  final CaseStyle? caseStyle;

  /// The case style for the stringified enum values.
  final CaseStyle? enumCaseStyle;

  /// If true removes all map keys with null values.
  final bool? ignoreNull;

  /// Property key used for type discriminators.
  final String? discriminatorKey;

  /// Specify which methods to generate for classes.
  final int? generateMethods;

  /// Will generated a new [<filename>.init.dart] file with an initializer
  /// method that automatically registers all mappers in the scope.
  final InitializerScope? generateInitializerForScope;
}

/// The scope of mappers that should automatically be registered when using
/// [MappableClass.generateInitializerInScope].
///
/// {@category Generics}
enum InitializerScope {
  /// Discover all mappers in the current library (default).
  library,

  /// Discover all mappers in the current or any subdirectory.
  directory,

  /// Discover all mappers in the current package.
  package,
}

/// Extend this class to define a custom [MappingHook] for a class or field.
///
/// {@category Mapping Hooks}
abstract class MappingHook {
  const MappingHook();

  /// Receives the ecoded value before decoding.
  Object? beforeDecode(Object? value) => value;

  /// Receives the decoded value after decoding.
  Object? afterDecode(Object? value) => value;

  /// Receives the decoded value before encoding.
  Object? beforeEncode(Object? value) => value;

  /// Receives the encoded value after encoding.
  Object? afterEncode(Object? value) => value;
}
