import 'package:analyzer/dart/element/element.dart';

class CustomMapperConfig {
  final ClassElement element;

  final String? prefix;

  CustomMapperConfig({
    required this.element,
    required this.prefix,
  });

  get prefixedMapperName =>
      '${prefix != null ? '$prefix.' : ''}${element.name}';
}
