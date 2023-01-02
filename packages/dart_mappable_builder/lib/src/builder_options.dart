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
  final int? lineLength;

  MappableOptions({
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
    this.lineLength,
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
        lineLength = options['lineLength'] as int? ?? options['line_length'] as int?;

  MappableOptions apply(MappableOptions? options, {bool forceJoin = true}) {
    if (options == null) return this;

    return MappableOptions(
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
    );
  }

  factory MappableOptions.from(DartObject object) {
    return MappableOptions(
      caseStyle: caseStyleFromAnnotation(object.getField('caseStyle')),
      enumCaseStyle: caseStyleFromAnnotation(object.getField('enumCaseStyle')),
      ignoreNull: object.getField('ignoreNull')?.toBoolValue(),
      discriminatorKey: object.getField('discriminatorKey')?.toStringValue(),
      generateMethods: object.getField('generateMethods')?.toIntValue(),
    );
  }
}
