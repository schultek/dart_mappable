import 'package:analyzer/dart/element/element.dart';

import '../core/case_style.dart';
import 'utils.dart';

/// The builder options for a specific library
class LibraryOptions {
  List<String>? include;
  List<String>? exclude;

  CaseStyle? caseStyle;
  CaseStyle? enumCaseStyle;
  bool? ignoreNull;
  String? discriminatorKey;
  List<String>? generateMethods;

  LibraryOptions(
      {this.include,
      this.exclude,
      this.caseStyle,
      this.enumCaseStyle,
      this.ignoreNull,
      this.discriminatorKey,
      this.generateMethods});

  LibraryOptions.parse(Map options)
      : include = toList(options['include']),
        exclude = toList(options['exclude']),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?,
        generateMethods = toList(options['generateMethods']);

  bool shouldGenerateFor(ClassElement element) {
    if (include != null) {
      return include!.contains(element.name);
    } else if (exclude != null) {
      return !exclude!.contains(element.name) && !element.isDartCoreObject;
    } else {
      return false;
    }
  }
}

/// The global builder options from the build.yaml file
class GlobalOptions extends LibraryOptions {
  Map<String, LibraryOptions> libraries;

  GlobalOptions.parse(Map<String, dynamic> options)
      : libraries = toMap(options['libraries'], (v) => LibraryOptions.parse(v)),
        super.parse(options);

  LibraryOptions forLibrary(LibraryElement library) {
    String? libFilePath;
    if (library.identifier.startsWith('package:')) {
      libFilePath =
          'lib${library.identifier.substring(library.identifier.indexOf('/'))}';
    } else if (library.identifier.startsWith('asset:')) {
      libFilePath =
          library.identifier.substring(library.identifier.indexOf('/') + 1);
    } else {
      // ignore: avoid_print
      print('Unknown identifier: ${library.identifier}');
    }

    LibraryOptions? options;
    for (var key in libraries.keys) {
      if (key == library.name ||
          key == library.identifier ||
          (libFilePath?.startsWith(key) ?? false)) {
        options = libraries[key];
        break;
      }
    }

    return LibraryOptions(
      include: (options?.include ?? include) != null
          ? [...options?.include ?? [], ...include ?? []]
          : null,
      exclude: (options?.exclude ?? exclude) != null
          ? [...options?.exclude ?? [], ...exclude ?? []]
          : null,
      caseStyle: options?.caseStyle ?? caseStyle,
      enumCaseStyle: options?.enumCaseStyle ?? enumCaseStyle,
      ignoreNull: options?.ignoreNull ?? ignoreNull,
      discriminatorKey: options?.discriminatorKey ?? discriminatorKey,
      generateMethods: options?.generateMethods ?? generateMethods,
    );
  }
}
