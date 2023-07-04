import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mappable_record_test.mapper.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'xx') double x, double y});

@MappableRecord()
typedef Offset<T> = ({double x, T y});

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
      print(container.toMap<Point>(r));
    });
  });
}
