import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';

import '../../constructor/constructor_mapper_element.dart';
import '../../mapper_element.dart';
import '../../param/class_mapper_param_element.dart';
import '../class_mapper_element.dart';

mixin ParamElementsMixin on MapperElement<ClassElement> {
  ConstructorMapperElement get constructor;
  ClassMapperElement? get extendsElement;
  List<ClassMapperElement> get interfaceElements;
  ClassMapperElement? get superElement;

  late List<ClassMapperParamElement> params = () {
    var params = <ClassMapperParamElement>[];
    if (constructor.element == null) {
      return params;
    }

    for (var param in constructor.element!.formalParameters) {
      params.add(getParameterConfig(param));
    }

    var unresolved = params.whereType<UnresolvedParamElement>();
    if (unresolved.isNotEmpty) {
      print(
        '\nClass $className defines constructor parameters that could not '
        'be resolved against any field or getter in the class.\nThis won\'t '
        'break your code, but may lead to unexpected behaviour when '
        'serializing this class. Also \'.copyWith()\' won\'t work on these '
        'parameters.\n\nThe following problematic parameters were detected:\n'
        '${unresolved.map((p) => '- ${p.parameter.name}: ${p.message}').join('\n')}\n\n'
        'Please make sure every constructor parameter can be resolved to a '
        'field or getter.\nIf you think this is a bug with dart_mappable '
        'and the listed parameters should be resolved correctly, please file '
        'an issue here: https://github.com/schultek/dart_mappable/issues\n',
      );
    }

    return params;
  }();

  ClassMapperParamElement getParameterConfig(FormalParameterElement param) {
    var dec = param.baseElement;

    if (dec is FieldFormalParameterElement) {
      return FieldParamElement(param, dec.field!, getSuperField(dec.field!));
    }

    if (dec is SuperFormalParameterElement && superElement != null) {
      if (dec.superConstructorParameter == null) {
        return UnresolvedParamElement(
          param,
          'Cannot resolve formal super parameter',
        );
      }
      var superConfig = superElement!.getParameterConfig(
        dec.superConstructorParameter!,
      );
      if (superConfig is UnresolvedParamElement) {
        return UnresolvedParamElement(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParamElement(param, superConfig);
      }
    }

    FormalParameterElement? superParameter = _findSuperParameter(param);
    if (superParameter != null) {
      var superConfig = superElement!.getParameterConfig(superParameter);
      if (superConfig is UnresolvedParamElement) {
        return UnresolvedParamElement(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParamElement(param, superConfig);
      }
    }

    var init = _analyzeInitializers(param);
    if (init != null) {
      return init;
    }

    var getter = element.thisType.lookUpGetter(
      param.name ?? '',
      parent.library,
    );
    if (getter != null) {
      var getterType = getter.type.returnType;

      var s = parent.library.typeSystem;
      if (s.isAssignableTo(getterType, dec.type)) {
        return FieldParamElement(
          param,
          getter.variable,
          getSuperField(getter.variable),
        );
      }

      return UnresolvedParamElement(
        param,
        'Found getter or field related to this parameter, but it has a '
        'non-matching type. Expected ${dec.type} but got ${getter.type.returnType}.',
      );
    }

    return UnresolvedParamElement(
      param,
      'Cannot find field or getter related to this parameter.',
    );
  }

  ClassMapperParamElement? _analyzeInitializers(FormalParameterElement param) {
    var node = constructor.node;
    if (node is! ConstructorDeclaration || node.initializers.isEmpty) {
      return null;
    }

    for (var initializer in node.initializers) {
      if (initializer is ConstructorFieldInitializer) {
        var p = initializer.expression.accept(InitializerExpressionVisitor());
        if (p == param) {
          var f = initializer.fieldName.element;
          if (f is PropertyInducingElement) {
            return FieldParamElement(param, f, getSuperField(f));
          }
        }
      }
    }

    return null;
  }

  FormalParameterElement? _findSuperParameter(FormalParameterElement param) {
    if (superElement == null) return null;

    var node = constructor.node;
    if (node is ConstructorDeclaration && node.initializers.isNotEmpty) {
      var last = node.initializers.last;
      if (last is SuperConstructorInvocation) {
        var superConstructorName = last.constructorName?.name ?? 'new';
        var superConstructor = superElement!.element.constructors.firstWhere(
          (c) => c.name == superConstructorName,
        );

        var args = last.argumentList.arguments;
        var i = 0;
        for (var arg in args) {
          if (arg is SimpleIdentifier) {
            if (arg.name == param.name) {
              return superConstructor.formalParameters[i];
            }
          } else if (arg is NamedExpression) {
            var exp = arg.expression;
            if (exp is SimpleIdentifier) {
              if (exp.name == param.name) {
                var superName = arg.name.label.name;
                return superConstructor.formalParameters.firstWhere(
                  (p) => p.isNamed && p.name == superName,
                );
              }
            }
          }
          i++;
        }
      }
    }
    return null;
  }

  PropertyInducingElement? getSuperField(PropertyInducingElement field) {
    return [if (extendsElement != null) extendsElement!, ...interfaceElements]
        .expand((e) => e.fields)
        .where((f) => f.field?.name == field.name)
        .map((f) => f.field)
        .firstOrNull;
  }
}

class InitializerExpressionVisitor extends SimpleAstVisitor<Element> {
  @override
  Element? visitSimpleIdentifier(SimpleIdentifier node) {
    return node.element;
  }

  @override
  Element? visitAssignedVariablePattern(AssignedVariablePattern node) {
    return node.element;
  }

  @override
  Element? visitParenthesizedExpression(ParenthesizedExpression node) {
    return node.expression.accept(this);
  }

  @override
  Element? visitNullAssertPattern(NullAssertPattern node) {
    return node.pattern.accept(this);
  }

  @override
  Element? visitNullCheckPattern(NullCheckPattern node) {
    return node.pattern.accept(this);
  }

  @override
  Element? visitBinaryExpression(BinaryExpression node) {
    if (node.operator.lexeme == '??') {
      var left = node.leftOperand.accept(this);
      var right = node.rightOperand.accept(this);
      if (left == null || right == null) {
        return left ?? right;
      }
    }

    return null;
  }
}
