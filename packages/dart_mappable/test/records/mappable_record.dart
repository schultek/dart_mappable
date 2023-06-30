import 'package:dart_mappable/dart_mappable.dart';

part 'mappable_record.mapper.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'xx') double x, double y});

typedef Offset = ({double x, double y});

@MappableClass()
class Location with LocationMappable {
  final Point point;
  final Offset offset;

  Location(this.point, this.offset);
}

void main() {}
