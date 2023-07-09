import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'record_model_test.mapper.dart';

@MappableClass()
class A<T> with AMappable<T> {
  final String a;
  final (int, {T b, C c, ({double lat, double lng}) d}) r;

  A(this.a, this.r);
}

@MappableClass()
class C with CMappable {
  final String c;
  final ({String lat, int lng}) d;

  C(this.c, this.d);
}

void main() {
  group('records model', () {
    test('serialize succeeds', () {
      var a = A<({String lat, bool lng})>('hi', (
        2,
        b: (lat: 'hi', lng: false),
        c: C('ho', (lat: 'a', lng: 3)),
        d: (lat: 0.5, lng: 100),
      ));

      var m = a.toMap();
      expect(
          m,
          equals({
            'a': 'hi',
            'r': {
              r'$1': 2,
              'b': {'lat': 'hi', 'lng': false},
              'c': {
                'c': 'ho',
                'd': {'lat': 'a', 'lng': 3}
              },
              'd': {'lat': 0.5, 'lng': 100.0}
            }
          }));

      var a2 = AMapper.fromMap<({String lat, bool lng})>(m);
      expect(a2, equals(a));
    });
  });
}
