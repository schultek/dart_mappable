import 'list_copy_with.dart' show ItemCopyWith;
import 'mapper_utils.dart';

/// Interface used for [Map]s in chained copyWith methods
/// All methods return a new modified map and do not modify the original map
abstract class MapCopyWith<$R, $K, $V, $C> {
  factory MapCopyWith(Map<$K, $V> value, ItemCopyWith<$C, $V, $R> item,
      Then<Map<$K, $V>, $R> then) = _MapCopyWith;

  /// Access the copyWith interface for the value of [key]
  $C? get($K key);

  /// Returns a new map with [value] inserted at [key]
  $R put($K key, $V v);

  /// Returns a new map with all entries inserted to the map
  $R putAll(Map<$K, $V> v);

  /// Returns a new map with the value at [key] replaced with a new value
  $R replace($K key, $V v);

  /// Returns a new map without the value at [key]
  $R removeAt($K key);

  /// Applies any transformer function on the value
  $R apply(Map<$K, $V> Function(Map<$K, $V>) transform);
}

class _MapCopyWith<$R, $K, $V, $C> extends BaseCopyWith<$R, Map<$K, $V>, Map<$K, $V>>
    implements MapCopyWith<$R, $K, $V, $C> {
  _MapCopyWith(Map<$K, $V> value, this._item, Then<Map<$K, $V>, $R> then)
      : super(value, then, $identity);
  final ItemCopyWith<$C, $V, $R> _item;

  @override
  $C? get($K key) => $value[key] is $V
      ? _item($value[key] as $V, (v) => replace(key, v))
      : null;

  @override
  $R put($K key, $V v) => putAll({key: v});

  @override
  $R putAll(Map<$K, $V> v) => $then({...$value, ...v});

  @override
  $R replace($K key, $V v) => $then({...$value, key: v});

  @override
  $R removeAt($K key) => $then({...$value}..remove(key));
}
