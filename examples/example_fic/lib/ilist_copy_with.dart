
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ImmutableListCopyWith<$R, $E> extends BaseCopyWith<IList<$E>, $R> {
  ImmutableListCopyWith(super.value, super.then);

  ObjectCopyWith<$R, $E> at(int index) =>
      ObjectCopyWith($value[index], (v) => $then($value.replace(index, v)));

  $R add($E v) => $then($value.add(v));

  $R removeAt(int i) => $then($value.removeAt(i));

  $R insert(int i, $E v) => $then($value.insert(i, v));
}
