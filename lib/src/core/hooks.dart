import '../utils.dart';
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
