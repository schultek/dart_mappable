import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

void initializeFICMappers() {
  // This makes all mappers work with immutable collections
  MapperContainer.globals.useAll([
    // mapper for immutable lists
    SerializableMapper<IList, Object>.arg1(
      decode: IList.fromJson,
      encode: (list) => list.toJson,
      type: <E>(f) => f<IList<E>>(),
    ),
    // mapper for immutable maps
    SerializableMapper<IMap, Map<String, dynamic>>.arg2(
      decode: IMap.fromJson,
      encode: (map) => map.toJson,
      type: <Key, Val>(f) => f<IMap<Key, Val>>(),
    ),
    // mapper for immutable sets
    SerializableMapper<ISet, Object>.arg1(
      decode: ISet.fromJson,
      encode: (set) => set.toJson,
      type: <E>(f) => f<ISet<E>>(),
    ),
  ]);
}
