import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../core/annotations.dart';
import '../core/case_style.dart';
import 'utils.dart';

/// The builder options for a specific library
class MappableOptions {
  final TypeOptions types;
  final CaseStyle? caseStyle;
  final CaseStyle? enumCaseStyle;
  final bool? ignoreNull;
  final String? discriminatorKey;
  final int? generateMethods;

  MappableOptions({
    required this.types,
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
  });

  MappableOptions.parse(Map options)
      : types = AnyTypeOptions(),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?,
        generateMethods =
            GenerateMethods.parse(toList(options['generateMethods']));

  bool shouldGenerateFor(ClassElement element) {
    return types.shouldGenerateFor(element);
  }

  MappableOptions apply(MappableOptions? options, {bool forceJoin = true}) {
    if (options == null) return this;
    return MappableOptions(
      types: types.joinWith(options.types, forceJoin),
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
    );
  }

  MappableOptions join(MappableOptions options) {
    return MappableOptions(
      types: types.unionWith(options.types),
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
    );
  }

  factory MappableOptions.from(DartObject object) {
    return MappableOptions(
      types: TypeOptions.from(object),
      caseStyle: caseStyleFromAnnotation(object.getField('caseStyle')),
      enumCaseStyle: caseStyleFromAnnotation(object.getField('enumCaseStyle')),
      ignoreNull: object.getField('ignoreNull')?.toBoolValue(),
      discriminatorKey: object.getField('discriminatorKey')?.toStringValue(),
      generateMethods: object.getField('generateMethods')?.toIntValue(),
    );
  }
}

extension TypeList on DartObject {
  List<DartType>? toTypeList() =>
      toListValue()?.map((o) => o.toTypeValue()).whereType<DartType>().toList();
}

abstract class TypeOptions {
  TypeOptions();

  factory TypeOptions.from(DartObject options) {
    var include = options.getField('include')?.toTypeList();
    var exclude = options.getField('exclude')?.toTypeList();
    return include != null
        ? IncludeTypeOptions(include)
        : exclude != null
            ? ExcludeTypeOptions(exclude)
            : AnyTypeOptions();
  }

  TypeOptions joinWith(TypeOptions types, bool forceJoin);
  TypeOptions unionWith(TypeOptions types);

  bool shouldGenerateFor(ClassElement element);

  List<T> sub<T>(List<T> a, List<T> b) {
    return a.where((x) => !b.contains(x)).toList();
  }

  List<T> join<T>(List<T> a, List<T> b) {
    return a.where((x) => b.contains(x)).toList();
  }

  List<T> union<T>(List<T> a, List<T> b) {
    return {...a, ...b}.toList();
  }
}

class AnyTypeOptions extends TypeOptions {
  @override
  TypeOptions joinWith(TypeOptions types, bool forceJoin) => types;

  @override
  TypeOptions unionWith(TypeOptions types) => types;

  @override
  bool shouldGenerateFor(ClassElement element) => false;
}

class IncludeTypeOptions extends TypeOptions {
  final List<DartType> include;
  IncludeTypeOptions(this.include);

  @override
  TypeOptions joinWith(TypeOptions types, bool forceJoin) {
    if (!forceJoin) {
      return unionWith(types);
    } else if (types is IncludeTypeOptions) {
      return IncludeTypeOptions(join(include, types.include));
    } else if (types is ExcludeTypeOptions) {
      return IncludeTypeOptions(sub(include, types.exclude));
    } else {
      return this;
    }
  }

  @override
  TypeOptions unionWith(TypeOptions types) {
    if (types is IncludeTypeOptions) {
      return IncludeTypeOptions(union(include, types.include));
    } else if (types is ExcludeTypeOptions) {
      return ExcludeTypeOptions(sub(types.exclude, include));
    } else {
      return this;
    }
  }

  @override
  bool shouldGenerateFor(ClassElement element) {
    return include.any((t) => t.element == element);
  }
}

class ExcludeTypeOptions extends TypeOptions {
  final List<DartType> exclude;
  ExcludeTypeOptions(this.exclude);

  @override
  TypeOptions joinWith(TypeOptions types, bool forceJoin) {
    if (types is IncludeTypeOptions) {
      return IncludeTypeOptions(sub(types.include, exclude));
    } else if (types is ExcludeTypeOptions) {
      return ExcludeTypeOptions(union(exclude, types.exclude));
    } else {
      return this;
    }
  }

  @override
  TypeOptions unionWith(TypeOptions types) {
    if (types is IncludeTypeOptions) {
      return ExcludeTypeOptions(sub(exclude, types.include));
    } else if (types is ExcludeTypeOptions) {
      return ExcludeTypeOptions(join(exclude, types.exclude));
    } else {
      return this;
    }
  }

  @override
  bool shouldGenerateFor(ClassElement element) {
    return !exclude.contains(element.thisType) && !element.isDartCoreObject;
  }
}
