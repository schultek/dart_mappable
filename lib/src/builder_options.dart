import 'package:analyzer/dart/element/element.dart';

import 'case_style.dart';

/// The builder options for a specific class
class ClassOptions {
  String? constructor;
  CaseStyle? caseStyle;
  bool? ignoreNull;
  Map<String, String> fields;

  ClassOptions(
      {this.constructor,
      this.caseStyle,
      this.ignoreNull,
      this.fields = const {}});

  ClassOptions.parse(Map options)
      : constructor = options['constructor'] as String?,
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        fields = (options['fields'] as Map?)?.cast<String, String>() ?? {};
}

/// The builder options for a specific enum
class EnumOptions {
  CaseStyle? caseStyle;
  EnumOptions({this.caseStyle});

  EnumOptions.parse(Map options)
      : caseStyle = CaseStyle.fromString(options['caseStyle'] as String?);
}

/// The builder options for a specific library
class LibraryOptions {
  List<String>? include;
  List<String>? exclude;

  CaseStyle? caseStyle;
  CaseStyle? enumCaseStyle;
  bool? ignoreNull;

  Map<String, ClassOptions> classes;
  Map<String, EnumOptions> enums;

  LibraryOptions(
      {this.include,
      this.exclude,
      this.classes = const {},
      this.enums = const {},
      this.caseStyle,
      this.enumCaseStyle,
      this.ignoreNull});

  LibraryOptions.parse(Map options)
      : include = options['include'] as List<String>?,
        exclude = options['exclude'] as List<String>?,
        classes = toMap(options['classes'], (v) => ClassOptions.parse(v)),
        enums = toMap(options['enums'], (v) => EnumOptions.parse(v)),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?;

  bool shouldGenerateFor(ClassElement element) {
    if (classes.containsKey(element.name)) {
      return true;
    } else if (include != null) {
      return include!.contains(element.name);
    } else if (exclude != null) {
      return !exclude!.contains(element.name) && !element.isDartCoreObject;
    } else {
      return !element.isDartCoreObject;
    }
  }

  EnumOptions forEnum(ClassElement element) {
    var options = enums[element.name];

    if (options == null) {
      return EnumOptions(
        caseStyle: enumCaseStyle,
      );
    } else {
      return EnumOptions(
        caseStyle: options.caseStyle ?? enumCaseStyle,
      );
    }
  }

  ClassOptions forClass(ClassElement element) {
    var options = classes[element.name];

    if (options == null) {
      return ClassOptions(
        caseStyle: caseStyle,
        ignoreNull: ignoreNull,
      );
    } else {
      return ClassOptions(
          constructor: options.constructor,
          caseStyle: options.caseStyle ?? caseStyle,
          ignoreNull: options.ignoreNull ?? ignoreNull,
          fields: options.fields);
    }
  }
}

/// The global builder options from the build.yaml file
class GlobalOptions {
  List<String>? include;
  List<String>? exclude;

  CaseStyle? caseStyle;
  CaseStyle? enumCaseStyle;
  bool? ignoreNull;

  Map<String, LibraryOptions> libraries;

  GlobalOptions(
      {this.include,
      this.exclude,
      this.libraries = const {},
      this.caseStyle,
      this.enumCaseStyle,
      this.ignoreNull});

  GlobalOptions.parse(Map<String, dynamic> options)
      : include = options['include'] as List<String>?,
        exclude = options['exclude'] as List<String>?,
        libraries = toMap(options['libraries'], (v) => LibraryOptions.parse(v)),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?;

  LibraryOptions forLibrary(LibraryElement library) {
    var libFilePath =
        'lib${library.identifier.substring(library.identifier.indexOf('/'))}';
    var options = libraries[library.name] ?? libraries[libFilePath];

    if (options == null) {
      return LibraryOptions(
        include: include,
        exclude: exclude,
        caseStyle: caseStyle,
        enumCaseStyle: enumCaseStyle,
        ignoreNull: ignoreNull,
      );
    } else {
      return LibraryOptions(
        include: (options.include ?? include) != null
            ? [...options.include ?? [], ...include ?? []]
            : null,
        exclude: (options.exclude ?? exclude) != null
            ? [...options.exclude ?? [], ...exclude ?? []]
            : null,
        classes: options.classes,
        enums: options.enums,
        caseStyle: options.caseStyle ?? caseStyle,
        enumCaseStyle: options.enumCaseStyle ?? enumCaseStyle,
        ignoreNull: options.ignoreNull ?? ignoreNull,
      );
    }
  }
}

Map<String, T> toMap<T>(dynamic value, T Function(Map m) fn) {
  return (value as Map?)
          ?.map((k, dynamic v) => MapEntry(k as String, fn(v as Map))) ??
      {};
}
