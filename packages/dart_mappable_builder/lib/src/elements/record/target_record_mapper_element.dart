import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../class/mixins/type_params_mixin.dart';
import 'alias_record_mapper_element.dart';

class TargetRecordMapperElement extends AliasRecordMapperElement {
  TargetRecordMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
  );

  static Future<TargetRecordMapperElement> from(
    MapperElementGroup parent,
    TypeAliasElement2 element,
    MappableOptions options,
  ) async {
    var annotation = await RecordMapperAnnotation.from(element);
    return TargetRecordMapperElement(parent, element, options, annotation);
  }

  @override
  late List<String>? inheritedTypeArgs = () {
    bool hasModifiedArgs = false;

    var fields = type.positionalFields.length + type.namedFields.length;
    if (element.typeParameters2.length != fields) {
      hasModifiedArgs = true;
    }

    var args = <String?>[];

    for (var p in element.typeParameters2) {
      var arg = _findInheritedTypeArg(p);
      args.add(arg);
      if (arg != null) {
        hasModifiedArgs = true;
      }
    }

    if (hasModifiedArgs) {
      return args
          .mapIndexed((index, arg) => arg ?? 'context.arg($index)')
          .toList();
    }

    return null;
  }();

  String? _findInheritedTypeArg(TypeParameterElement2 p) {
    var params = element.typeParameters2;
    var types = [...type.positionalFields, ...type.namedFields];

    for (var (i, a) in types.indexed) {
      if (a.type is TypeParameterType && a.type.element3 == p) {
        if (i == params.indexOf(p)) {
          return null;
        } else {
          return 'context.arg($i)';
        }
      }
    }

    for (var (i, a) in types.indexed) {
      var indices = a.type.accept(TypeParamExtractor(p));
      if (indices.isNotEmpty) {
        return 'context.arg($i, [${indices.join(', ')}])';
      }
    }

    return p.bound != null ? parent.prefixedType(p.bound!) : 'dynamic';
  }
}
