import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import 'mapper_param_element.dart';

class RecordMapperParamElement extends MapperParamElement {
  RecordMapperParamElement(this.name, this.type, this.param, [this.typeArg]);

  @override
  final String name;
  @override
  final DartType type;
  final RecordTypeAnnotationField? param;
  final String? typeArg;

  bool get isNamed => !name.startsWith(r'$');

  bool get isGeneric => typeArg != null;

  @override
  Future<String?> getHook() async {
    var node = getAnnotationProperty(param, MappableField, 'hook');
    return node?.toSource();
  }

  @override
  DartObject? get annotation {
    if (param == null) return null;
    for (var e in param!.metadata) {
      var o = e.elementAnnotation?.computeConstantValue();
      if (o != null &&
          o.type != null &&
          fieldChecker.isAssignableFromType(o.type!)) {
        return o;
      }
    }
    return null;
  }
}
