import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ImmutableListCopyWith<Result, Elem>
    extends BaseCopyWith<Result, IList<Elem>, IList<Elem>> {
  ImmutableListCopyWith(super.value, super.then1, super.then2);

  ObjectCopyWith<Result, Elem, Elem> at(int index) => ObjectCopyWith(
      $value[index], $identity, (v) => $then($value.replace(index, v)));

  Result add(Elem v) => $then($value.add(v));

  Result removeAt(int i) => $then($value.removeAt(i));

  Result insert(int i, Elem v) => $then($value.insert(i, v));
}
