import 'package:type_plus/type_plus.dart';

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
  List<Type> apply(MappingContext context) => context.args;

  @override
  T decode(Object? value, DecodingContext context) {
    return super.decode(value, context.change(args: () => apply(context)));
  }

  @override
  Object? encode(T value, EncodingContext context) {
    return InterfaceMapperBase.encodeFields(
      value,
      fields.values,
      ignoreNull,
      context.change(args: () => apply(context)),
      context.options?.shallow ?? false,
    );
  }

  @override
  bool isForType(Type type) {
    try {
      var newArgs = apply(DecodingContext(args: () => type.args));
      var instantiatedType = typeFactory
          .callWith(parameters: [<T>() => T], typeArguments: newArgs);
      return type == instantiatedType;
    } catch (_) {
      return false;
    }
  }
}
