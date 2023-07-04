import 'interface_mapper.dart';
import 'mapper_mixins.dart';
import 'mapping_context.dart';

// abstract class RecordMapperVariant<T extends Record> {
//   Map<Symbol, Field<T, dynamic>> get fields;
//
//   T instantiate(DecodingData<Record> data);
//
//   Map<String, dynamic> encode(T value, EncodingContext context) {
//     return InterfaceMapperBase.encodeFields(
//         value, fields.values, false, context);
//   }
// }

abstract class RecordMapperBase<T extends Record> extends InterfaceMapperBase<T>
    with PrimitiveMethodsMixin<T> {
  DecodingContext apply(DecodingContext context) => context;

  @override
  T decode(Object? value, DecodingContext context) {
    return super.decode(value, apply(context));
  }
}
