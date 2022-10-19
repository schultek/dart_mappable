import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'main.mapper.g.dart';

@CustomMapper()
final iMapMapper = SerializableMapper<IMap>.arg2(
  decode: IMap.fromJson,
  encode: (map) => map.toJson,
  type: <Key, Val>(f) => f<IMap<Key, Val>>(),
  mapper: Mapper.i,
);


@CustomMapper()
final iListMapper = SerializableMapper<IList>.arg1(
  decode: IList.fromJson,
  encode: (map) => map.toJson,
  type: <E>(f) => f<IList<E>>(),
  mapper: Mapper.i,
);

void main() {
}
