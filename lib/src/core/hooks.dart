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

class MappedMap<K, V> {
  Map<String, K> keys;
  Map<K, V> map;

  MappedMap(this.keys, this.map);
}

class RefMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;

  List<MappedMap> mapped = [];

  RefMap.of(this.wrapped);

  @override
  Map<K2, V2> map<K2, V2>(
      MapEntry<K2, V2> transform(String key, dynamic value)) {
    var result = <K2, V2>{};
    var keys = <String, K2>{};

    for (var key in this.keys) {
      var entry = transform(key, this[key]);
      keys[key] = entry.key;
      result[entry.key] = entry.value;
    }

    mapped.add(MappedMap(keys, result));

    return result;
  }

  @override
  operator [](Object? key) {
    return wrapped[key];
  }

  @override
  void operator []=(String key, value) {
    wrapped[key] = value;
  }

  @override
  void clear() {
    wrapped.clear();
    for (var map in mapped) {
      map.map.clear();
    }
  }

  @override
  Iterable<String> get keys => wrapped.keys;

  @override
  remove(Object? key) {
    wrapped.remove(key);
    for (var map in mapped) {
      map.map.remove(map.keys[key]);
    }
  }
}

class UnusedPropertiesMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;
  Map<String, dynamic> unused;

  String key;

  UnusedPropertiesMap.of(this.wrapped, {required this.key})
      : unused = RefMap.of({...wrapped});

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
