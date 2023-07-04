import '../mapper_container.dart';
import '../mappers/mapping_context.dart';
import '../mappers/record_mapper.dart';
import 'copywith_base.dart';
import 'copywith_data.dart';

abstract class RecordCopyWith<Result, In extends Record, Out>
    implements ObjectCopyWith<Result, In, Out> {
  Result $merge(In value);
  Result $delta(Map<String, dynamic> delta);
}

abstract class RecordCopyWithBase<Result, In extends Record, Out>
    extends CopyWithBase<Result, In, Out>
    implements RecordCopyWith<Result, In, Out> {
  RecordCopyWithBase(super.$value, super.$then1, super.$then2);

  RecordMapperBase get $mapper;

  @override
  Result $merge(In value) => $apply(RecordMergeCopyWithData($mapper, value));

  @override
  Result $delta(Map<String, dynamic> delta) =>
      $apply(RecordDeltaCopyWithData($mapper, delta));

  Result $apply(CopyWithData data) => $then($make(data));

  In $make(CopyWithData data);
}

class RecordMergeCopyWithData extends CopyWithData {
  RecordMergeCopyWithData(this.mapper, this.value);

  final RecordMapperBase mapper;
  final Record value;

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    var v = mapper.fields[name]!.get(value);
    if (v != null || or == $none) {
      return v as V;
    } else {
      return or as V;
    }
  }
}

class RecordDeltaCopyWithData extends CopyWithData {
  RecordDeltaCopyWithData(this.mapper, this.value)
      : context = DecodingContext(container: MapperContainer.globals);

  final RecordMapperBase mapper;
  final Map<String, dynamic> value;
  final DecodingContext context;

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    if (value.containsKey(mapper.fields[name]!.key) || or == $none) {
      return mapper.fields[name]!.decode(value, context);
    } else {
      return or as V;
    }
  }
}
