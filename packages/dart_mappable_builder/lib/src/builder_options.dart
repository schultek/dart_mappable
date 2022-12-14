import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:source_gen/source_gen.dart';

import 'utils.dart';

/// The builder options for a specific library
class MappableOptions {
  final CaseStyle? caseStyle;
  final CaseStyle? enumCaseStyle;
  final bool? ignoreNull;
  final String? discriminatorKey;
  final int? generateMethods;
  final List<DartType>? include;

  MappableOptions({
    required this.caseStyle,
    required this.enumCaseStyle,
    required this.ignoreNull,
    required this.discriminatorKey,
    required this.generateMethods,
    required this.include,
  });

  MappableOptions.parse(Map options)
      :
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?,
        generateMethods =
            GenerateMethods.parse(toList(options['generateMethods'])),
  include = null;

  bool shouldGenerateFor(InterfaceElement element) {
    return include?.any((t) => t.element == element) ?? true;
  }

  MappableOptions apply(MappableOptions? options, {bool forceJoin = true}) {
    if (options == null) return this;

    var include = this.include;
    if (include == null) {
      include = options.include;
    } else if (options.include != null){
      include = forceJoin ? _join(include, options.include!) : _union(include, options.include!);
    }

    return MappableOptions(
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
      include: include,
    );
  }

  factory MappableOptions.from(DartObject object) {
    return MappableOptions(
      caseStyle: caseStyleFromAnnotation(object.getField('caseStyle')),
      enumCaseStyle: caseStyleFromAnnotation(object.getField('enumCaseStyle')),
      ignoreNull: object.getField('ignoreNull')?.toBoolValue(),
      discriminatorKey: object.getField('discriminatorKey')?.toStringValue(),
      generateMethods: object.getField('generateMethods')?.toIntValue(),
      include: object.getField('include')?.toTypeList(),
    );
  }

  List<T> _join<T>(List<T> a, List<T> b) {
    return a.where((x) => b.contains(x)).toList();
  }

  List<T> _union<T>(List<T> a, List<T> b) {
    return {...a, ...b}.toList();
  }
}

extension TypeList on DartObject {
  List<DartType>? toTypeList() =>
      toListValue()?.map((o) => o.toTypeValue()).whereType<DartType>().toList();
}