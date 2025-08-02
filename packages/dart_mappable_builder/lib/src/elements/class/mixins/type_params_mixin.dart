import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';

import '../../mapper_element.dart';
import '../class_mapper_element.dart';

mixin TypeParamsMixin on MapperElement<ClassElement2> {
  ClassMapperElement? get extendsElement;

  late String selfTypeParam = '$prefixedClassName$typeParams';

  late List<String> typeParamsList =
      element.typeParameters2
          .map(
            (p) =>
                '${p.name3}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}',
          )
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
    if (element.typeParameters2.length !=
        element.supertype!.typeArguments.length) {
      hasModifiedArgs = true;
    }

    var args = <String>[];
    for (var p in element.typeParameters2) {
      args.add(findInheritedTypeArg(p));
    }

    if (hasModifiedArgs) {
      return args.toList();
    }

    return null;
  }();

  String resolveInheritedType(DartType t) {
    if (t is TypeParameterType) {
      return findInheritedTypeArg(t.element3);
    } else if (t is! InterfaceType) {
      return t.getDisplayString();
    }

    String argParamFor(int index) =>
        r'$' + String.fromCharCode('A'.codeUnitAt(0) + index);
    var factoryArgs = <String>[];
    var inheritedArgs = <String>[];

    String factorizeType(DartType t) {
      if (t is TypeParameterType) {
        var index = inheritedArgs.length;
        inheritedArgs.add(findInheritedTypeArg(t.element3));
        var arg = argParamFor(index);
        factoryArgs.add(arg);
        if (t.bound is! DynamicType) {
          var bound = factorizeType(t.bound);
          factoryArgs[index] = '$arg extends $bound';
        }
        return arg;
      } else if (t is! InterfaceType) {
        return t.getDisplayString();
      } else {
        var typeArgs = '';
        if (t.typeArguments.isNotEmpty) {
          typeArgs = '<${t.typeArguments.map(factorizeType).join(', ')}>';
        }

        var type = '${t.element3.name3}$typeArgs';
        if (t.nullabilitySuffix == NullabilitySuffix.question) {
          type += '?';
        }

        return '${parent.prefixOfElement(t.element3)}$type';
      }
    }

    var factorizedType = factorizeType(t);

    if (factoryArgs.isEmpty) {
      return factorizedType;
    }

    return 'context.type(<${factoryArgs.join(', ')}>() => $factorizedType, [${inheritedArgs.join(', ')}])';
  }

  String findInheritedTypeArg(TypeParameterElement2 p) {
    var params = element.typeParameters2;
    var index = params.indexOf(p);
    var args = element.supertype!.typeArguments;

    for (var a in args) {
      if (a is TypeParameterType && a.element3 == p) {
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

  late String typeParams =
      element.typeParameters2.isNotEmpty
          ? '<${element.typeParameters2.map((p) => p.name3 ?? '').join(', ')}>'
          : '';

  late String superTypeParams =
      element.typeParameters2.isNotEmpty
          ? '<${element.typeParameters2.map((p) => element.supertype!.typeArguments.any((t) => t is TypeParameterType && t.element3 == p) ? p.name3 ?? '' : 'dynamic').join(', ')}>'
          : '';

  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';

  late bool hasRecursiveTypeParams = element.typeParameters2.any((p) {
    return p.bound != null && _isRecursiveType(p.bound!, {});
  });

  bool _isRecursiveType(DartType t, Set<TypeParameterType> visited) {
    if (t is TypeParameterType) {
      if (visited.contains(t)) return true;
      return _isRecursiveType(t.bound, {...visited, t});
    } else if (t is InterfaceType) {
      return t.typeArguments.any((arg) => _isRecursiveType(arg, visited));
    }
    return false;
  }
}

class TypeParamExtractor extends UnifyingTypeVisitor<List<int>> {
  TypeParamExtractor(this.param);

  final TypeParameterElement2 param;

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
      if (arg is TypeParameterType && arg.element3 == param) {
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
