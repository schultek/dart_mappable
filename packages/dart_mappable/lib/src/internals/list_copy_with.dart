import 'mapper_utils.dart';

typedef ItemCopyWith<$C, $E, $R> = $C Function($E a, Then<$E, $R> b);

/// Interface used for [List]s in chained copyWith methods
/// All methods return a new modified list and do not modify the original list
abstract class ListCopyWith<$R, $E, $C> {
  factory ListCopyWith(
    List<$E> value,
    ItemCopyWith<$C, $E, $R> item,
    Then<List<$E>, $R> then,
  ) = _ListCopyWith;

  /// Access the copyWith interface for the item at [index]
  $C at(int index);

  /// Returns a new list with the item added to the end of the list
  $R add($E v);

  /// Returns a new list with the items added to the end of the list
  $R addAll(Iterable<$E> v);

  /// Returns a new list with the item at [index] replaced with a new value
  $R replace(int index, $E v);

  /// Returns a new list with the item inserted at [index]
  $R insert(int index, $E v);

  /// Returns a new list with the items inserted at [index]
  $R insertAll(int index, Iterable<$E> v);

  /// Returns a new list without the item at [index]
  $R removeAt(int index);

  /// Returns a new spliced list with [removeCount] items removed and [toInsert] inserted at [index]
  $R splice(int index, int removeCount, [Iterable<$E>? toInsert]);

  /// Returns a new list with only the first [count] items
  $R take(int count);

  /// Returns a new list without the first [count] items
  $R skip(int count);

  /// Returns a filtered list with only the items the pass [test]
  $R where(bool Function($E) test);

  /// Returns a new list with items at index [start] inclusive to [end] exclusive.
  $R sublist(int start, [int? end]);

  /// Applies any transformer function on the value
  $R apply(List<$E> Function(List<$E>) transform);
}

class _ListCopyWith<$R, $E, $C> extends BaseCopyWith<$R, List<$E>, List<$E>>
    implements ListCopyWith<$R, $E, $C> {
  _ListCopyWith(List<$E> value, this._item, Then<List<$E>, $R> then)
      : super(value, then, $identity);
  final ItemCopyWith<$C, $E, $R> _item;

  @override
  $C at(int index) => _item($value[index], (v) => replace(index, v));

  @override
  $R add($E v) => addAll([v]);

  @override
  $R addAll(Iterable<$E> v) => $then([...$value, ...v]);

  @override
  $R replace(int index, $E v) => splice(index, 1, [v]);

  @override
  $R insert(int index, $E v) => insertAll(index, [v]);

  @override
  $R insertAll(int index, Iterable<$E> v) => splice(index, 0, v);

  @override
  $R removeAt(int index) => splice(index, 1);

  @override
  $R splice(int index, int removeCount, [Iterable<$E>? toInsert]) => $then([
        ...$value.take(index),
        if (toInsert != null) ...toInsert,
        ...$value.skip(index + removeCount),
      ]);

  @override
  $R take(int count) => $then($value.take(count).toList());

  @override
  $R skip(int count) => $then($value.skip(count).toList());

  @override
  $R where(bool Function($E) test) => $then($value.where(test).toList());

  @override
  $R sublist(int start, [int? end]) => $then($value.sublist(start, end));
}
