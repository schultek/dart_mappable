import '../mapper_exception.dart';
import 'interface_mapper.dart';
import 'mapper_mixins.dart';
import 'mapping_context.dart';

abstract class RecordMapperVariant<T extends Record> {
  Map<Symbol, Field<T, dynamic>> get fields;

  T instantiate(DecodingData<Record> data);

  Map<String, dynamic> encode(T value, EncodingContext context) {
    return InterfaceMapperBase.encodeFields(
        value, fields.values, false, context);
  }
}

class RecordMapper extends InterfaceMapperBase<Record>
    with PrimitiveMethodsMixin<Record> {
  static final _instance = RecordMapper._();

  RecordMapper._();
  factory RecordMapper() => _instance;

  @override
  final Map<Symbol, Field<Record, dynamic>> fields = {};

  static final Map<Type, RecordMapperVariant> variants = {};
  static final Map<Type, Type> variantByType = {};

  static Record _instantiate<A>(DecodingData<Record> data) {
    var id = data.context.options?.data;
    id ??= variantByType[data.context.options?.type];
    var variant = variants[id];

    if (variant != null) {
      return variant.instantiate(data);
    }
    throw MapperException.missingSubclass(
      'Record',
      id.toString(),
      data.context.options?.type?.toString() ?? '',
    );
  }

  @override
  Record decode(Object? value, DecodingContext context) {
    var d = DecodingData<Record>(value as Map<String, dynamic>, context);
    return instantiate(d) as Record;
  }

  @override
  Object? encode(Record value, EncodingContext context) {
    if (context.options?.data case Symbol id) {
      var variant = variants[id];
      if (variant != null) {
        return variant.encode(value, context);
      }
    }
    return super.encode(value, context);
  }

  @override
  final Function instantiate = _instantiate;
}
