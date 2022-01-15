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
      if (props is Map) {
        value.addAll(props.cast());
      }
    }
    return value;
  }
}

class UnusedPropertiesMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;
  Map<String, dynamic> unused;

  String key;

  UnusedPropertiesMap.of(this.wrapped, {required this.key})
      : unused = ReferenceMap.of({...wrapped});

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
    return wrapped.remove(key);
  }
}

class TransformedMap<K, V> {
  Map<String, K> keys;
  Map<K, V> map;

  TransformedMap(this.keys, this.map);
}

class ReferenceMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;

  List<TransformedMap> transformedMaps = [];

  ReferenceMap.of(this.wrapped);

  @override
  Map<K2, V2> map<K2, V2>(
    MapEntry<K2, V2> Function(String, dynamic) transform,
  ) {
    var result = <K2, V2>{};
    var keys = <String, K2>{};

    for (var key in this.keys) {
      var entry = transform(key, this[key]);
      keys[key] = entry.key;
      result[entry.key] = entry.value;
    }

    transformedMaps.add(TransformedMap(keys, result));

    return result;
  }

  @override
  dynamic operator [](Object? key) {
    return wrapped[key];
  }

  @override
  void operator []=(String key, dynamic value) {
    wrapped[key] = value;
  }

  @override
  void clear() {
    wrapped.clear();
    for (var transformedMap in transformedMaps) {
      transformedMap.map.clear();
    }
  }

  @override
  Iterable<String> get keys => wrapped.keys;

  @override
  dynamic remove(Object? key) {
    var value = wrapped.remove(key);
    for (var transformedMap in transformedMaps) {
      transformedMap.map.remove(transformedMap.keys[key]);
    }
    return value;
  }
}
