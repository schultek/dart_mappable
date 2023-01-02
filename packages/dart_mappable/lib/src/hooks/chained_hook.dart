import '../annotations.dart';

/// A [MappingHook] that will chain multiple other hooks.
///
/// {@category Mapping Hooks}
class ChainedHook extends MappingHook {
  /// The provided [MappingHook].
  /// These will be applied for both encoding and serialization in the following order:
  /// `first.beforeDecode -> second.beforeDecode -> ... -> decode -> ... -> second.afterDecode -> first.afterDecode`.
  final List<MappingHook> hooks;
  const ChainedHook(this.hooks);

  @override
  dynamic beforeDecode(dynamic value) {
    return hooks.fold(value, (v, h) => h.beforeDecode(v));
  }

  @override
  dynamic afterDecode(dynamic value) {
    return hooks.reversed.fold(value, (v, h) => h.afterDecode(v));
  }

  @override
  dynamic beforeEncode(dynamic value) {
    return hooks.fold(value, (v, h) => h.beforeEncode(v));
  }

  @override
  dynamic afterEncode(dynamic value) {
    return hooks.reversed.fold(value, (v, h) => h.afterEncode(v));
  }
}
