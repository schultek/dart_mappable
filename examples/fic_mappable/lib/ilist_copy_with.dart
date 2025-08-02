import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ImmutableListCopyWith<Result, Elem, Copy>
    extends CopyWithBase<Result, IList<Elem>, IList<Elem>> {
  ImmutableListCopyWith(
    IList<Elem> value,
    this._item,
    Then<IList<Elem>, Result> then,
  ) : super(value, $identity, then);

  final ItemCopyWith<Copy, Elem, Result> _item;

  Copy operator [](int index) {
    return _item($value[index], (v) => $then($value.replace(index, v)));
  }

  Result add(Elem v) => $then($value.add(v));

  Result removeAt(int i) => $then($value.removeAt(i));

  Result insert(int i, Elem v) => $then($value.insert(i, v));
}
