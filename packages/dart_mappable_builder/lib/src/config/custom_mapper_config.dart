
class CustomMapperConfig {
  final String name;
  final bool isClass;
  final int? prefix;

  CustomMapperConfig({
    required this.name,
    required this.isClass,
    required this.prefix,
  });

  get prefixedMapperName =>
      '${prefix != null ? 'p$prefix.' : ''}$name';
}
