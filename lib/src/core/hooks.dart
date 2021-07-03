import 'dart:collection';

import 'annotations.dart';

/// Ready-to-use [MappingHooks] to get all unmapped properties in a [Map].
class UnmappedPropertiesHooks extends MappingHooks {
  /// The key of the target property of your class.
  /// Needs to be specified in the correct case-style
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
