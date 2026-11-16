import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'record_ignore_null_test.mapper.dart';

@MappableRecord(ignoreNull: true)
typedef PartialPoint = ({double x, double? y});

void main() {
  group('record ignore null', () {
    test('does not encode null fields', () {
      var point = PartialPointMapper.fromMap({'x': 1.5});
      expect(point, equals((x: 1.5, y: null)));

      var encoded = point.toMap();
      expect(encoded['x'], equals(1.5));
      expect(encoded.keys, isNot(contains('y')));
    });
  });
}
