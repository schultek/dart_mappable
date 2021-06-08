import 'dart:collection';

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
  final String? caseStyle;

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

enum MappingFlags { useAsDefault }

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
}

/// Used to annotate an enum
/// in order to generate mapping code
class MappableEnum {
  const MappableEnum({
    this.caseStyle,
    this.defaultValue,
  });

  /// The case style for the stringified enum values
  final String? caseStyle;

  /// The default value when decoding a string.
  /// Must be a value of the annotated enum
  final Object? defaultValue;
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

abstract class MappingHooks {
  const MappingHooks();

  dynamic beforeDecode(dynamic value) => value;
  dynamic afterDecode(dynamic value) => value;

  dynamic beforeEncode(dynamic value) => value;
  dynamic afterEncode(dynamic value) => value;
}

class UnmappedPropertiesHooks extends MappingHooks {
  final String key;
  const UnmappedPropertiesHooks(this.key);

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is Map<String, dynamic>) {
      return UnusedPropertiesMap.of(value, key: key);
    }
    return value;
  }

  @override
  dynamic afterEncode(dynamic value) {
    if (value is Map<String, dynamic>) {
      var props = value.remove(key);
      value.addAll(props is Map<String, dynamic> ? props : {});
    }
    return value;
  }
}

class UnusedPropertiesMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;
  Map<String, dynamic> unused;

  String key;

  UnusedPropertiesMap.of(this.wrapped, {required this.key})
      : unused = {...wrapped};

  @override
  dynamic operator [](Object? key) {
    if (key == this.key) {
      return unused;
    } else {
      unused.remove(key);
      return wrapped[key];
    }
  }

  @override
  void operator []=(String key, dynamic value) {
    unused[key] = value;
    wrapped[key] = value;
  }

  @override
  void clear() {
    unused.clear();
    wrapped.clear();
  }

  @override
  Iterable<String> get keys => wrapped.keys;

  @override
  dynamic remove(Object? key) {
    unused.remove(key);
    wrapped.remove(key);
  }
}
