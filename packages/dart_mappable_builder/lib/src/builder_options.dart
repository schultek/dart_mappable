import 'package:analyzer/dart/constant/value.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'utils.dart';

/// The builder options for a specific library
class MappableOptions {
  final CaseStyle? caseStyle;
  final CaseStyle? enumCaseStyle;
  final bool? ignoreNull;
  final String? discriminatorKey;
  final int? generateMethods;
  final InitializerScope? initializerScope;
  final int? lineLength;

  MappableOptions({
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
    this.initializerScope,
    this.lineLength,
  });

  MappableOptions.parse(Map options)
      : caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?,
        generateMethods =
            parseGenerateMethods(toList(options['generateMethods'])),
        initializerScope = null,
        lineLength =
            options['lineLength'] as int? ?? options['line_length'] as int?;

  MappableOptions apply(MappableOptions? options, {bool forceJoin = true}) {
    if (options == null) return this;

    return MappableOptions(
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
      initializerScope: options.initializerScope ?? initializerScope,
    );
  }

  factory MappableOptions.from(DartObject object) {
    var initScope = object.getField('generateInitializerForScope');
    return MappableOptions(
      caseStyle: caseStyleFromAnnotation(object.getField('caseStyle')),
      enumCaseStyle: caseStyleFromAnnotation(object.getField('enumCaseStyle')),
      ignoreNull: object.getField('ignoreNull')?.toBoolValue(),
      discriminatorKey: object.getField('discriminatorKey')?.toStringValue(),
      generateMethods: object.getField('generateMethods')?.toIntValue(),
      initializerScope: initScope?.isNull ?? true
          ? null
          : InitializerScope
              .values[initScope?.getField('index')?.toIntValue() ?? 0],
    );
  }
}

int? parseGenerateMethods(List<String>? flags) {
  if (flags == null) return null;
  int joinedFlag = 0;
  for (var flag in flags) {
    switch (flag) {
      case 'decode':
        joinedFlag |= GenerateMethods.decode;
        break;
      case 'encode':
        joinedFlag |= GenerateMethods.encode;
        break;
      case 'stringify':
        joinedFlag |= GenerateMethods.stringify;
        break;
      case 'equals':
        joinedFlag |= GenerateMethods.equals;
        break;
      case 'copy':
        joinedFlag |= GenerateMethods.copy;
        break;
      case 'all':
        joinedFlag |= GenerateMethods.all;
        break;
    }
  }
  return joinedFlag;
}
