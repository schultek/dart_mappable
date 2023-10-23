import 'package:analyzer/dart/constant/value.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'utils.dart';

const _defaultExtensions = {
  '.dart': ['.mapper.dart', '.init.dart']
};

/// The builder options for a specific library
class MappableOptions {
  final CaseStyle? caseStyle;
  final CaseStyle? enumCaseStyle;
  final bool? ignoreNull;
  final String? discriminatorKey;
  final int? generateMethods;
  final InitializerScope? initializerScope;
  final int? lineLength;
  final Map<String, String> renameMethods;
  final Map<String, List<String>> buildExtensions;

  MappableOptions({
    this.caseStyle,
    this.enumCaseStyle,
    this.ignoreNull,
    this.discriminatorKey,
    this.generateMethods,
    this.initializerScope,
    this.lineLength,
    this.renameMethods = const {},
    this.buildExtensions = _defaultExtensions,
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
            options['lineLength'] as int? ?? options['line_length'] as int?,
        renameMethods = toMap(options['renameMethods'] ?? {}),
        buildExtensions =
            validatedBuildExtensionsFrom(options, _defaultExtensions);

  MappableOptions apply(MappableOptions? options, {bool forceJoin = true}) {
    if (options == null) return this;

    return MappableOptions(
      caseStyle: options.caseStyle ?? caseStyle,
      enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options.ignoreNull ?? ignoreNull,
      discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      generateMethods: options.generateMethods ?? generateMethods,
      initializerScope: options.initializerScope ?? initializerScope,
      renameMethods: {...renameMethods, ...options.renameMethods},
    );
  }

  factory MappableOptions.from(DartObject object) {
    var initScope = object.read('generateInitializerForScope');
    return MappableOptions(
      caseStyle: caseStyleFromAnnotation(object.read('caseStyle')),
      enumCaseStyle: caseStyleFromAnnotation(object.read('enumCaseStyle')),
      ignoreNull: object.read('ignoreNull')?.toBoolValue(),
      discriminatorKey: object.read('discriminatorKey')?.toStringValue(),
      generateMethods: object.read('generateMethods')?.toIntValue(),
      initializerScope: initScope?.isNull ?? true
          ? null
          : InitializerScope
              .values[initScope?.read('index')?.toIntValue() ?? 0],
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
