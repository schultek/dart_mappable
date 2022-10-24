import 'mapper_utils.dart';

typedef ItemCopyWith<Copy, Elem, Result> = Copy Function(Elem a, Then<Elem, Result> b);

/// Interface used for [List]s in chained copyWith methods
/// All methods return a new modified list and do not modify the original list
abstract class ListCopyWith<Result, Elem, Copy> {
  factory ListCopyWith(
    List<Elem> value,
    ItemCopyWith<Copy, Elem, Result> item,
    Then<List<Elem>, Result> then,
  ) = _ListCopyWith;

  /// Access the copyWith interface for the item at [index]
  Copy at(int index);

  /// Returns a new list with the item added to the end of the list
  Result add(Elem v);

  /// Returns a new list with the items added to the end of the list
  Result addAll(Iterable<Elem> v);

  /// Returns a new list with the item at [index] replaced with a new value
  Result replace(int index, Elem v);

  /// Returns a new list with the item inserted at [index]
  Result insert(int index, Elem v);

  /// Returns a new list with the items inserted at [index]
  Result insertAll(int index, Iterable<Elem> v);

  /// Returns a new list without the item at [index]
  Result removeAt(int index);

  /// Returns a new spliced list with [removeCount] items removed and [toInsert] inserted at [index]
  Result splice(int index, int removeCount, [Iterable<Elem>? toInsert]);

  /// Returns a new list with only the first [count] items
  Result take(int count);

  /// Returns a new list without the first [count] items
  Result skip(int count);

  /// Returns a filtered list with only the items the pass [test]
  Result where(bool Function(Elem) test);

  /// Returns a new list with items at index [start] inclusive to [end] exclusive.
  Result sublist(int start, [int? end]);

  /// Applies any transformer function on the value
  Result apply(List<Elem> Function(List<Elem>) transform);
}

class _ListCopyWith<Result, Elem, Copy> extends BaseCopyWith<Result, List<Elem>, List<Elem>>
    implements ListCopyWith<Result, Elem, Copy> {
  _ListCopyWith(List<Elem> value, this._item, Then<List<Elem>, Result> then)
      : super(value, $identity, then);
  final ItemCopyWith<Copy, Elem, Result> _item;

  @override
  Copy at(int index) => _item($value[index], (v) => replace(index, v));

  @override
  Result add(Elem v) => addAll([v]);

  @override
  Result addAll(Iterable<Elem> v) => $then([...$value, ...v]);

  @override
  Result replace(int index, Elem v) => splice(index, 1, [v]);

  @override
  Result insert(int index, Elem v) => insertAll(index, [v]);

  @override
  Result insertAll(int index, Iterable<Elem> v) => splice(index, 0, v);

  @override
  Result removeAt(int index) => splice(index, 1);

  @override
  Result splice(int index, int removeCount, [Iterable<Elem>? toInsert]) => $then([
        ...$value.take(index),
        if (toInsert != null) ...toInsert,
        ...$value.skip(index + removeCount),
      ]);

  @override
  Result take(int count) => $then($value.take(count).toList());

  @override
  Result skip(int count) => $then($value.skip(count).toList());

  @override
  Result where(bool Function(Elem) test) => $then($value.where(test).toList());

  @override
  Result sublist(int start, [int? end]) => $then($value.sublist(start, end));
}
