
import 'package:type_plus/type_plus.dart';

import '../annotations.dart';
import '../mapper_container.dart';

/// A [MappingHook] that allows to specify custom type checks for serialization
/// polymorph subclasses of a class.
///
/// This overrides the default discriminator key/value system to allow for a
/// more custom implementation.
///
/// To use this hook, specify a type predicate for each of your subtypes in the
/// form of a static or top-level function of type `bool Function(dynamic value)`.
/// This function should return true if the encoded value should be decoded to
/// the respective subtype.
/// Then use this hook on the superclass and provide a map with the subtypes as
/// keys and the predicate functions as values.
///
/// Example for superclass A and subclasses B and C (extends A):
///
/// ```
/// @MappableClass(
///   hooks: CheckTypesHook({
///     B: B.checkType,
///     C: C.checkType,
///   }),
/// )
/// abstract class A with AMappable {
///   A();
/// }
///
/// @MappableClass()
/// class B extends A with BMappable {
///   B();
///
///   /// checks if [value] should be decoded to [B]
///   static bool checkType(value) {
///     return value is Map && value['isB'] == true;
///   }
/// }
///
/// @MappableClass()
/// class C extends A with CMappable {
///   C();
///
///   /// checks if [value] should be decoded to [C]
///   static bool checkType(value) {
///     return value is Map && value['isWhat'] == 'C';
///   }
/// }
/// ```
///
/// {@category Polymorphism}
/// {@category Mapping Hooks}
class CheckTypesHook extends MappingHook {
  const CheckTypesHook(this.checks);

  final Map<Type, bool Function(dynamic)> checks;

  static final _locked = Expando<bool>();
  bool get isLocked => _locked[this] == true;
  set isLocked(bool locked) => _locked[this] = locked;

  @override
  T wrapDecode<T>(value, T Function(dynamic value) fn, MapperContainer container) {
    if (!isLocked) {
      for (var e in checks.entries) {
        var isT = e.key.provideTo(<T>() => value is T);
        if (isT) {
          break;
        } else if (e.value(value)) {
          try {
            isLocked = true;
            return e.key.provideTo<dynamic>(<T>() =>
                container.fromValue<T>(value)) as T;
          } finally {
            isLocked = false;
          }
        }
      }
    }
    return fn(value);
  }
}
