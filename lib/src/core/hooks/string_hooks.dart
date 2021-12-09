import '../annotations.dart';

/// A [MappingHooks] that will unescape all escaped newline characters in a string.
class UnescapeNewlinesHooks extends MappingHooks {
  const UnescapeNewlinesHooks();
  @override
  dynamic afterDecode(dynamic value) {
    return value is String ? value.replaceAll('\\n', '\n') : value;
  }
}

/// A [MappingHooks] that will change an empty string to null.
class EmptyToNullHooks extends MappingHooks {
  const EmptyToNullHooks();
  @override
  dynamic afterDecode(dynamic value) {
    return value is String && value.isEmpty ? null : value;
  }
}
