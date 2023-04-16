import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:collection/collection.dart';

import '../../mapper_element.dart';
import '../class_mapper_element.dart';

mixin TypeParamsMixin on MapperElement<ClassElement> {
  ClassMapperElement? get superElement;

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}')
      .toList();

  late List<String> superTypeArgs = () {
    if (superElement == null) return <String>[];
    return element.supertype?.typeArguments
            .map((a) => parent.prefixedType(a))
            .toList() ??
        [];
  }();

  late List<String>? inheritedTypeArgs = () {
    bool hasModifiedArgs = false;
    var args = <String?>[];

    for (var p in element.typeParameters) {
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

  String? _findInheritedTypeArg(TypeParameterElement p) {
    var params = element.typeParameters;
    var args = element.supertype!.typeArguments;

    for (var a in args) {
      if (a is TypeParameterType && a.element == p) {
        if (args.indexOf(a) == params.indexOf(p)) {
          return null;
        } else {
          return 'context.arg(${args.indexOf(a)})';
        }
      }
    }

    for (var a in args) {
      var indices = a.accept(TypeParamExtractor(p));
      if (indices.isNotEmpty) {
        return 'context.arg(${args.indexOf(a)}, [${indices.join(', ')}])';
      }
    }

    return p.bound != null ? parent.prefixedType(p.bound!) : 'dynamic';
  }

  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  late String superTypeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => element.supertype!.typeArguments.any((t) => t is TypeParameterType && t.element == p) ? p.name : 'dynamic').join(', ')}>'
      : '';

  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';
}

class TypeParamExtractor extends UnifyingTypeVisitor<List<int>> {
  TypeParamExtractor(this.param);

  final TypeParameterElement param;

  @override
  List<int> visitDartType(DartType type) {
    return [];
  }

  @override
  List<int> visitRecordType(RecordType type) {
    return visitDartType(type);
  }

  @override
  List<int> visitInterfaceType(InterfaceType type) {
    for (var arg in type.typeArguments) {
      if (arg is TypeParameterType && arg.element == param) {
        return [type.typeArguments.indexOf(arg)];
      }
      var indices = arg.accept(this);
      if (indices.isNotEmpty) {
        return [type.typeArguments.indexOf(arg), ...indices];
      }
    }
    return super.visitInterfaceType(type);
  }
}
