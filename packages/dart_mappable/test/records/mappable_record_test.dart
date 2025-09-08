import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mappable_record_test.mapper.dart';

@MappableRecord()
typedef Point =
    ({@MappableField(key: 'a', hook: RoundingHook()) double x, double y});

@MappableRecord()
typedef Offset<T> = ({double x, T y});

class RoundingHook extends MappingHook {
  const RoundingHook();

  @override
  Object? beforeDecode(Object? value) {
    return (value as num).round();
  }
}

class HypotenuseHook extends MappingHook {
  const HypotenuseHook();

  @override
  Object? beforeDecode(Object? value) {
    final map = (value as Map).cast<String, dynamic>();
    final leg1 = map['x'] as num;
    final leg2 = map['y'] as num;
    map['hypotenuse'] = sqrt(leg1 * leg1 + leg2 * leg2);
    return map;
  }
}

@MappableRecord(hook: HypotenuseHook())
typedef Hypotenuse = ({double x, double y, double hypotenuse});

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

    test('can decode and encode record hook on record', () {
      var decode = MapperContainer.globals.fromMap;
      var encode = MapperContainer.globals.toMap;

      HypotenuseMapper.ensureInitialized();

      var h = decode<Hypotenuse>({'x': 3, 'y': 4});
      expect(h, equals((x: 3, y: 4, hypotenuse: sqrt(3 * 3 + 4 * 4))));
      expect(
        encode(h),
        equals({'x': 3, 'y': 4, 'hypotenuse': sqrt(3 * 3 + 4 * 4)}),
      );
    });
  });
}
