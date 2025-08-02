import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'fic_mappers.dart';
import 'ilist_copy_with.dart';

part 'main.mapper.dart';

@MappableClass()
class A with AMappable {
  IList<B> list;

  A(this.list);
}

@MappableClass()
class B with BMappable {
  String str;

  B(this.str);
}

/// This makes chained copyWith work on [A.list] using the custom
/// [ImmutableListCopyWith] implementation.
extension DataList<$R, $Out extends A> on ACopyWith<$R, A, $Out> {
  ImmutableListCopyWith<$R, B, BCopyWith<$R, B, B>> get list =>
      (this as CopyWithBase<$R, A, $Out>).as(
        (v, t, t2) => ImmutableListCopyWith(
          v.list,
          (vv, tt) => vv.copyWith.$chain(tt),
          (l) => call(list: l),
        ),
      );
}

void main() {
  initializeFICMappers();

  var a = AMapper.fromMap({
    'list': [
      {'str': 'hello'},
      {'str': 'world'},
    ],
  });

  assert(a == A(IList([B('hello'), B('world')])));
  assert(a.toJson() == '{"list":[{"str":"hello"},{"str":"world"}]}');

  var a2 = a.copyWith.list.add(B('test'));
  var a3 = a.copyWith.list[1](str: 'tom');

  assert(a2.list.length == 3 && a2.list[2].str == 'test');
  assert(a3.list.length == 2 && a3.list[1].str == 'tom');

  var m = IMap({"value": 1000});
  assert(MapperContainer.globals.toJson(m) == '{"value":1000}');
}
