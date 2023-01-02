import '../annotations.dart';

/// A [MappingHook] that will unescape all escaped newline characters in a string.
///
/// {@category Mapping Hooks}
class UnescapeNewlinesHook extends MappingHook {
  const UnescapeNewlinesHook();
  @override
  dynamic afterDecode(dynamic value) {
    return value is String ? value.replaceAll('\\n', '\n') : value;
  }
}

/// A [MappingHook] that will change an empty string to null.
///
/// {@category Mapping Hooks}
class EmptyToNullHook extends MappingHook {
  const EmptyToNullHook();
  @override
  dynamic afterDecode(dynamic value) {
    return value is String && value.isEmpty ? null : value;
  }
}
