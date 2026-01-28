import 'package:dart_mappable/dart_mappable.dart';

part 'other_base_b.mapper.dart';

@MappableClass(
  discriminatorKey: 'type',
  ignoreNull: true,
  hook: UnmappedPropertiesHook('unmappedProps'),
)
class OtherBase with OtherBaseMappable {
  /// The document ID.
  @MappableField(key: '_id')
  final String? id;

  /// The document revision.
  @MappableField(key: '_rev')
  final String? rev;

  Map<String, dynamic> unmappedProps;

  OtherBase({this.id, this.rev, this.unmappedProps = const {}});

  static final fromMap = OtherBaseMapper.fromMap;
  static final fromJson = OtherBaseMapper.fromJson;
}

@MappableClass(discriminatorValue: 'C')
class C extends OtherBase with CMappable {
  @MappableField()
  final String valueC;

  C({required this.valueC, super.id});

  static final fromMap = CMapper.fromMap;
  static final fromJson = CMapper.fromJson;
}

@MappableClass(discriminatorValue: 'D')
class D extends C with DMappable {
  @MappableField()
  final int valueD;

  D({required this.valueD, required super.valueC, super.id});

  static final fromMap = DMapper.fromMap;
  static final fromJson = DMapper.fromJson;
}
