import '../core/annotations.dart';
import '../core/mappers.dart';

void clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(clearType);
  map.values
      .whereType<List>()
      .forEach((l) => l.whereType<Map<String, dynamic>>().forEach(clearType));
}

T checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException(
        'Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

extension HooksMapping on MappingHooks? {
  T decode<T>(dynamic value, T Function(dynamic value) fn) {
    if (this == null) return fn(value);
    var v = this!.beforeDecode(value);
    if (v is! T) v = fn(v);
    return this!.afterDecode(v) as T;
  }

  dynamic encode<T>(T value, dynamic Function(T value) fn) {
    if (this == null) return fn(value);
    var v = this!.beforeEncode(value);
    if (v is T) v = fn(v);
    return this!.afterEncode(v);
  }
}

extension NullIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class _None {
  const _None();
}

const $none = _None();

T $identity<T>(T value) => value;
typedef Then<$T, $R> = $R Function($T);

class BaseCopyWith<$T, $R> {
  BaseCopyWith(this.$value, this.$then);

  final $T $value;
  final Then<$T, $R> $then;

  T or<T>(Object? _v, T v) => _v == $none ? v : _v as T;
}

class ListCopyWith<$R, $T, $C> extends BaseCopyWith<List<$T>, $R> {
  ListCopyWith(List<$T> value, this.itemCopyWith, Then<List<$T>, $R> then)
      : super(value, then);
  $C Function($T a, Then<$T, $R> b) itemCopyWith;

  $C at(int index) => itemCopyWith($value[index], (v) => replace(index, v));

  $R add($T v) => addAll([v]);

  $R addAll(Iterable<$T> v) => $then([...$value, ...v]);

  $R replace(int index, $T v) => splice(index, 1, [v]);

  $R insert(int index, $T v) => insertAll(index, [v]);

  $R insertAll(int index, Iterable<$T> v) => splice(index, 0, v);

  $R removeAt(int index) => splice(index, 1);

  $R splice(int index, int removeCount, [Iterable<$T>? toInsert]) => $then([
        ...$value.take(index),
        if (toInsert != null) ...toInsert,
        ...$value.skip(index + removeCount),
      ]);

  $R take(int count) => $then($value.take(count).toList());

  $R skip(int count) => $then($value.skip(count).toList());

  $R where(bool Function($T) test) => $then($value.where(test).toList());

  $R sublist(int start, [int? end]) => $then($value.sublist(start, end));
}
