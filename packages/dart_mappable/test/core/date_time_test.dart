import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

void main() {
  group('date time', () {
    test('to iso string', () {
      DateTimeMapper.encodingMode = DateTimeEncoding.iso8601String;

      var iso = '2023-01-01T12:34:56.000+02';
      var dt = DateTime.parse(iso);

      expect(MapperContainer.globals.toValue(dt), equals(dt.toIso8601String()));
      expect(MapperContainer.globals.fromValue<DateTime>(iso), equals(dt));
    });

    test('to utc iso string', () {
      DateTimeMapper.encodingMode = DateTimeEncoding.utcIso8601String;

      var iso = '2023-01-01T12:34:56.000Z';
      var dt = DateTime.parse(iso);

      expect(MapperContainer.globals.toValue(dt), equals(iso));
      expect(MapperContainer.globals.fromValue<DateTime>(iso), equals(dt));
    });

    test('to unix int', () {
      DateTimeMapper.encodingMode = DateTimeEncoding.millisSinceEpoc;

      var unix = 12345678;
      var dt = DateTime.fromMillisecondsSinceEpoch(unix);

      expect(MapperContainer.globals.toValue(dt), equals(unix));
      expect(MapperContainer.globals.fromValue<DateTime>(unix), equals(dt));
    });
  });
}
