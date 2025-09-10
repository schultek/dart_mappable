import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mappable_record_test.mapper.dart';

@MappableRecord()
typedef Point =
    ({@MappableField(key: 'a', hook: RoundingHook()) double x, double y});

@MappableRecord()
typedef Offset<T> = ({double x, T y});

@MappableRecord()
typedef Rect = ({Point topLeft, Point bottomRight});

class RoundingHook extends MappingHook {
  const RoundingHook();

  @override
  Object? beforeDecode(Object? value) {
    return (value as num).round();
  }
}

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

      var p = decode<Point>({'a': 1.3, 'y': 2});
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

    test('can decode and encode nested record', () {
      var decode = MapperContainer.globals.fromMap;
      var encode = MapperContainer.globals.toMap;

      RectMapper.ensureInitialized();

      var r = decode<Rect>({
        'topLeft': {'a': 1.3, 'y': 2},
        'bottomRight': {'a': 3.7, 'y': 4},
      });
      expect(r, equals((topLeft: (x: 1, y: 2), bottomRight: (x: 4, y: 4))));
      expect(
        encode(r),
        equals({
          'topLeft': {'a': 1, 'y': 2},
          'bottomRight': {'a': 4, 'y': 4},
        }),
      );
    });
  });
}
