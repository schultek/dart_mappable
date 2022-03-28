import '../annotations.dart';

/// A [MappingHooks] that will chain multiple other hooks.
class ChainedHooks extends MappingHooks {
  /// The provided [MappingHooks].
  /// These will be applied for both encoding and decoding in the following order:
  /// `first.beforeDecode -> second.beforeDecode -> ... -> decode -> ... -> second.afterDecode -> first.afterDecode`.
  final List<MappingHooks> hooks;
  const ChainedHooks(this.hooks);

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
