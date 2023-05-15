import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

@MappableRecord()
void main() {
  group('records', () {
    late RecordMapper r1Mapper;

    setUpAll(() {
      r1Mapper = RecordMapper<(dynamic, {dynamic b})>(
        <A, B>(RecordData<(dynamic, {dynamic b})> d) => (
          d<A>('1', (r) => r.$1),
          b: d<B>('b', (r) => r.b),
        ),
        <A, B>(f) => f<(A, {B b})>(),
      );
      MapperContainer.globals.use(r1Mapper);
    });

    test('to map succeeds', () {
      expect((1,).toMap(), equals({'1': 1}));
      expect((1, 2.0).toMap(), equals({'1': 1, '2': 2.0}));
      expect((1, 2.0, true).toMap(), equals({'1': 1, '2': 2.0, '3': true}));
      expect(
        (1, 2.0, true, 'hi').toMap(),
        equals({'1': 1, '2': 2.0, '3': true, '4': 'hi'}),
      );
      expect(
        (1, 2.0, true, 'hi', (1,)).toMap(),
        equals({
          '1': 1,
          '2': 2.0,
          '3': true,
          '4': 'hi',
          '5': {'1': 1}
        }),
      );
    });

    test('to map with schema succeeds', () {
      expect(
        (1, 2).toMap(schema: ('lat', 'lng')),
        equals({'lat': 1, 'lng': 2}),
      );
      expect(
        ('a', b: 20).toMap(schema: ('name', b: 'age')),
        equals({'name': 'a', 'age': 20}),
      );
    });

    test('from map succeeds', () {
      expect(
        JsonRecord.fromMap<(int,)>({'1': 1}),
        equals((1,)),
      );
      expect(
        JsonRecord.fromMap<(int, double)>({
          '1': 1,
          '2': 2.0,
          '3': true,
          '4': 'hi',
          '5': {'1': 1}
        }),
        equals((1, 2.0)),
      );
      expect(
        JsonRecord.fromMap<(int, double, bool)>({
          '1': 1,
          '2': 2.0,
          '3': true,
        }),
        equals((1, 2.0, true)),
      );
      expect(
        JsonRecord.fromMap<(int, double, bool, String)>(
            {'1': 1, '2': 2.0, '3': true, '4': 'hi'}),
        equals((1, 2.0, true, 'hi')),
      );
      expect(
        JsonRecord.fromMap<(int, double, bool, String, (int,))>({
          '1': 1,
          '2': 2.0,
          '3': true,
          '4': 'hi',
          '5': {'1': 1}
        }),
        equals((1, 2.0, true, 'hi', (1,))),
      );
    });

    test('from map with schema succeeds', () {
      expect(
        JsonRecord.fromMap<(double, double)>({'lat': 1, 'lng': 2},
            schema: ('lat', 'lng')),
        equals((1, 2)),
      );
      expect(
        JsonRecord.fromMap<(String, {int b})>({'name': 'a', 'age': 20},
            schema: ('name', b: 'age')),
        equals(('a', b: 20)),
      );
    });
  });
}
