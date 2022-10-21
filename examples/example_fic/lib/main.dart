import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'ilist_copy_with.dart';
import 'main.mapper.g.dart';

@CustomMapper()
class IMapMapper extends SerializableMapper<IMap> {
  IMapMapper()
      : super.arg2(
          decode: IMap.fromJson,
          encode: (map) => map.toJson,
          type: <Key, Val>(f) => f<IMap<Key, Val>>(),
        );
}

@CustomMapper()
final iListMapper = SerializableMapper<IList>.arg1(
  decode: IList.fromJson,
  encode: (list) => list.toJson,
  type: <E>(f) => f<IList<E>>(),
);

extension DataList<$R> on ACopyWith<$R> {
  ImmutableListCopyWith<$R, B> get list => chain((v, then) =>
      ImmutableListCopyWith(v.list, (l) => then(v.copyWith(list: l))));
}

@MappableClass()
class A with Mappable {
  IList<B> list;

  A(this.list);
}

@MappableClass()
class B with Mappable {
  String str;

  B(this.str);
}

void main() {
  var a = A(IList([B('hello'), B('world')]));

  var a2 = a.copyWith.list.add(B('test'));
  var a3 = a.copyWith.list.at(1).b(str: 'tom');

  print(a);
  print(a2);
  print(a3);
}
