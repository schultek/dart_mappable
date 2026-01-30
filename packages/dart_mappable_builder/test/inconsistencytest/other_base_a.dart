import 'package:dart_mappable/dart_mappable.dart';

part 'other_base_a.mapper.dart';

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
  //@MappableField(key: '_rev')
  //final String? rev;

  Map<String, dynamic> unmappedProps;

  OtherBase({this.id, this.unmappedProps = const {}});

  static final fromMap = OtherBaseMapper.fromMap;
  static final fromJson = OtherBaseMapper.fromJson;
}
