import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';

import '../../mapper_element.dart';
import '../class_mapper_element.dart';

mixin TypeParamsMixin on MapperElement<ClassElement> {
  ClassMapperElement? get extendsElement;

  late String selfTypeParam = '$prefixedClassName$typeParams';

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}')
      .toList();

  late List<String> superTypeArgs = () {
    if (extendsElement == null) return <String>[];
    return element.supertype?.typeArguments
            .map((a) => parent.prefixedType(a))
            .toList() ??
        [];
  }();

  bool hasModifiedArgs = false;

  late List<String>? inheritedTypeArgs = () {
    if (element.typeParameters.length !=
        element.supertype!.typeArguments.length) {
      hasModifiedArgs = true;
    }

    var args = <String>[];
    for (var p in element.typeParameters) {
      args.add(findInheritedTypeArg(p));
    }

    if (hasModifiedArgs) {
      return args.toList();
    }

    return null;
  }();

  String resolveInheritedType(DartType t) {
    if (t is TypeParameterType) {
      return findInheritedTypeArg(t.element);
    } else if (t is! InterfaceType) {
      return t.getDisplayString(withNullability: true);
    }

    String argParamFor(int index) =>
        r'$' + String.fromCharCode('A'.codeUnitAt(0) + index);
    var factoryArgs = <String>[];
    var inheritedArgs = <String>[];

    String factorizeType(DartType t) {
      if (t is TypeParameterType) {
        var index = inheritedArgs.length;
        inheritedArgs.add(findInheritedTypeArg(t.element));
        var arg = argParamFor(index);
        factoryArgs.add(arg);
        if (t.bound is! DynamicType) {
          var bound = factorizeType(t.bound);
          factoryArgs[index] = '$arg extends $bound';
        }
        return arg;
      } else if (t is! InterfaceType) {
        return t.getDisplayString(withNullability: true);
      } else {
        var typeArgs = '';
        if (t.typeArguments.isNotEmpty) {
          typeArgs = '<${t.typeArguments.map(factorizeType).join(', ')}>';
        }

        var type = '${t.element.name}$typeArgs';
        if (t.nullabilitySuffix == NullabilitySuffix.question) {
          type += '?';
        }

        return '${parent.prefixOfElement(t.element)}$type';
      }
    }

    var factorizedType = factorizeType(t);

    if (factoryArgs.isEmpty) {
      return factorizedType;
    }

    return 'context.type(<${factoryArgs.join(', ')}>() => $factorizedType, [${inheritedArgs.join(', ')}])';
  }

  String findInheritedTypeArg(TypeParameterElement p) {
    var params = element.typeParameters;
    var index = params.indexOf(p);
    var args = element.supertype!.typeArguments;

    for (var a in args) {
      if (a is TypeParameterType && a.element == p) {
        if (args.indexOf(a) == index) {
          return 'context.arg($index)';
        } else {
          hasModifiedArgs = true;
          return 'context.arg(${args.indexOf(a)})';
        }
      }
    }

    for (var a in args) {
      var indices = a.accept(TypeParamExtractor(p));
      if (indices.isNotEmpty) {
        hasModifiedArgs = true;
        return 'context.arg(${args.indexOf(a)}, [${indices.join(', ')}])';
      }
    }

    hasModifiedArgs = true;

    if (p.bound != null) {
      return resolveInheritedType(p.bound!);
    }

    return 'dynamic';
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
