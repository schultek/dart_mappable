import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import 'case_style.dart';

/// The builder options for a specific class
class ClassOptions {
  String? constructor;
  CaseStyle? caseStyle;
  bool? ignoreNull;
  String? discriminatorKey;
  String? discriminatorValue;
  Map<String, String> fields;

  ClassOptions(
      {this.constructor,
      this.caseStyle,
      this.ignoreNull,
      this.discriminatorKey,
      this.discriminatorValue,
      this.fields = const {}});

  ClassOptions.parse(Map options)
      : constructor = options['constructor'] as String?,
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?,
        discriminatorValue = options['discriminatorValue'] as String?,
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
  String? discriminatorKey;

  Map<String, ClassOptions> classes;
  Map<String, EnumOptions> enums;

  LibraryOptions(
      {this.include,
      this.exclude,
      this.classes = const {},
      this.enums = const {},
      this.caseStyle,
      this.enumCaseStyle,
      this.ignoreNull,
      this.discriminatorKey});

  LibraryOptions.parse(Map options)
      : include = toList(options['include']),
        exclude = toList(options['exclude']),
        classes = toMap(options['classes'], (v) => ClassOptions.parse(v)),
        enums = toMap(options['enums'], (v) => EnumOptions.parse(v)),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?;

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

  EnumOptions forEnum(ClassElement element, [DartObject? annotation]) {
    var options = enums[element.name];

    return EnumOptions(
      caseStyle: annotation?.getField('caseStyle')!.toStringValue() != null
          ? CaseStyle.fromString(
              annotation!.getField('caseStyle')!.toStringValue())
          : options?.caseStyle ?? enumCaseStyle,
    );
  }

  ClassOptions forClass(ClassElement element, [DartObject? annotation]) {
    var options = classes[element.name];

    return ClassOptions(
      constructor: options?.constructor,
      caseStyle: annotation?.getField('caseStyle')!.toStringValue() != null
          ? CaseStyle.fromString(
              annotation!.getField('caseStyle')!.toStringValue())
          : options?.caseStyle ?? caseStyle,
      ignoreNull: annotation?.getField('ignoreNull')!.toBoolValue() ??
          options?.ignoreNull ??
          ignoreNull,
      discriminatorKey:
          annotation?.getField('discriminatorKey')!.toStringValue() ??
              options?.discriminatorKey ??
              discriminatorKey,
      discriminatorValue: options?.discriminatorValue,
      fields: options?.fields ?? {},
    );
  }
}

/// The global builder options from the build.yaml file
class GlobalOptions {
  List<String>? include;
  List<String>? exclude;

  CaseStyle? caseStyle;
  CaseStyle? enumCaseStyle;
  bool? ignoreNull;
  String? discriminatorKey;

  Map<String, LibraryOptions> libraries;

  GlobalOptions(
      {this.include,
      this.exclude,
      this.libraries = const {},
      this.caseStyle,
      this.enumCaseStyle,
      this.ignoreNull,
      this.discriminatorKey});

  GlobalOptions.parse(Map<String, dynamic> options)
      : include = toList(options['include']),
        exclude = toList(options['exclude']),
        libraries = toMap(options['libraries'], (v) => LibraryOptions.parse(v)),
        caseStyle = CaseStyle.fromString(options['caseStyle'] as String?),
        enumCaseStyle =
            CaseStyle.fromString(options['enumCaseStyle'] as String?),
        ignoreNull = options['ignoreNull'] as bool?,
        discriminatorKey = options['discriminatorKey'] as String?;

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
    var options = libraries[library.name] ??
        libraries[library.identifier] ??
        libraries[libFilePath];

    if (options == null) {
      return LibraryOptions(
        include: include,
        exclude: exclude,
        caseStyle: caseStyle,
        enumCaseStyle: enumCaseStyle,
        ignoreNull: ignoreNull,
        discriminatorKey: discriminatorKey,
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
        discriminatorKey: options.discriminatorKey ?? discriminatorKey,
      );
    }
  }
}

Map<String, T> toMap<T>(dynamic value, T Function(Map m) fn) {
  return (value as Map?)
          ?.map((k, dynamic v) => MapEntry(k as String, fn(v as Map))) ??
      {};
}

List<T>? toList<T>(dynamic value) {
  return (value as List?)?.map((dynamic v) => v as T).toList();
}
