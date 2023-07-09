import '../mappers/class_mapper.dart';
import 'copywith_base.dart';
import 'copywith_data.dart';

abstract class ClassCopyWith<Result, In, Out>
    implements ObjectCopyWith<Result, In, Out> {
  Result $merge(In value);
  Result $delta(Map<String, dynamic> delta);
}

abstract class ClassCopyWithBase<Result, In extends Object, Out>
    extends CopyWithBase<Result, In, Out>
    implements ClassCopyWith<Result, In, Out> {
  ClassCopyWithBase(super.$value, super.$then1, super.$then2);

  ClassMapperBase get $mapper;

  @override
  Result $merge(In value) => $apply(MergeCopyWithData($mapper, value));

  @override
  Result $delta(Map<String, dynamic> delta) =>
      $apply(DeltaCopyWithData($mapper, delta));

  Result $apply(CopyWithData data) => $then($make(data));

  In $make(CopyWithData data);
}
