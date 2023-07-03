import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mappable_record_test.mapper.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'xx') double x, double y});

@MappableRecord()
typedef Offset = ({double x, double y});

@MappableClass()
class Location with LocationMappable {
  final Point point;
  final Offset offset;

  Location(this.point, this.offset);
}

void main() {
  group('mappable record', () {
    test('can decode and encode', () {
      var container = MapperContainer.globals;
      PointMapper.ensureInitialized();

      var r = container.fromMap<Point>({'a': 1, 'y': 2});
      print(r);
      print(r.toMap());
    });
  });
}
