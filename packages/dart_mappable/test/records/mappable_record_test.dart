import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mappable_record_test.mapper.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'a') double x, double y});

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
    test('can decode and encode record', () {
      var decode = MapperContainer.globals.fromMap;
      var encode = MapperContainer.globals.toMap;

      PointMapper.ensureInitialized();

      var p = decode<Point>({'a': 1, 'y': 2});
      expect(p, equals((x: 1, y: 2)));
      expect(encode(p), equals({'a': 1, 'y': 2}));
    });

    test('can decode and encode generic record', () {
      var decode = MapperContainer.globals.fromMap;
      var encode = MapperContainer.globals.toMap;

      OffsetMapper.ensureInitialized();

      var o = decode<Offset<bool>>({'x': 1, 'y': false});
      expect(o, equals((x: 1, y: false)));
      expect(encode(o), equals({'x': 1, 'y': false}));
    });

    test('can choose correct record mapper', () {
      var decode = MapperContainer.globals.fromMap;
      var encode = MapperContainer.globals.toMap;

      PointMapper.ensureInitialized();
      OffsetMapper.ensureInitialized();

      var o = decode<Offset<bool>>({'x': 1, 'y': false});
      expect(o, equals((x: 1, y: false)));
      expect(encode(o), equals({'x': 1, 'y': false}));

      var p = decode<Point>({'a': 1, 'y': 2});
      expect(p, equals((x: 1, y: 2)));
      expect(encode(p), equals({'a': 1, 'y': 2}));
    });
  });
}
