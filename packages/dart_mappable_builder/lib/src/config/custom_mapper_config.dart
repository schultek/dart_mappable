import 'package:analyzer/dart/element/element.dart';

class CustomMapperConfig {
  final ClassElement element;

  final int? prefix;

  CustomMapperConfig({
    required this.element,
    required this.prefix,
  });

  get prefixedMapperName =>
      '${prefix != null ? 'p$prefix.' : ''}${element.name}';
}
