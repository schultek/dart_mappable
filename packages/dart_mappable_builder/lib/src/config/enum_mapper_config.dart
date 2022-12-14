import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';

class EnumMapperConfig {
  final EnumElement element;

  final ValuesMode mode;
  final CaseStyle? caseStyle;
  final int? defaultValue;

  final int nameIndex;
  final Namespace namespace;

  EnumMapperConfig({
    required this.element,
    required this.mode,
    required this.caseStyle,
    required this.defaultValue,
    required this.nameIndex,
    required this.namespace,
  });

  String get className => element.name;
  String get prefixedClassName => className;
  String get mapperName => '$className${nameIndex != 0 ? '$nameIndex' : ''}Mapper';
  String get paramName => className[0].toLowerCase();
}
