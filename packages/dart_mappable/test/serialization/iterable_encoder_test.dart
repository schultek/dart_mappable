import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'iterable_encoder_test.mapper.dart';

@MappableClass()
class Foobar with FoobarMappable {
  final int id;
  final String name;

  Foobar(this.id, this.name);
}

void main() {
  final m = MapperContainer.globals;
  FoobarMapper.ensureInitialized();

  group('iterable encoder', () {
    test('encodes ints', () {
      expect(m.toValue<List<int>>([1, 2, 3]), equals([1, 2, 3]));
    });

    test('encodes nums', () {
      expect(m.toValue<List<num>>([1, 2.5, 3]), equals([1, 2.5, 3]));
    });

    test('encodes strings and bools', () {
      expect(m.toValue<List<String>>(['one', 'two']), equals(['one', 'two']));
      expect(m.toValue<List<bool>>([true, false]), equals([true, false]));
    });

    test('encodes doubles', () {
      expect(m.toValue<List<double>>([1.0, 2.5, 3.0]), equals([1.0, 2.5, 3.0]));
    });

    test('encodes dynamic and object values', () {
      final date = DateTime.utc(2000);
      final foobar = Foobar(4, 'four');
      final values = [1, 'two', true, date, foobar];
      final encodedValues = [
        1,
        'two',
        true,
        '2000-01-01T00:00:00.000Z',
        {'id': 4, 'name': 'four', '__type': 'Foobar'},
      ];

      expect(m.toValue<List<dynamic>>(values), equals(encodedValues));
      expect(m.toValue<List<Object>>(values), equals(encodedValues));
    });

    test('encodes mappable classes', () {
      expect(
        m.toValue<List<Foobar>>([Foobar(1, 'one'), Foobar(2, 'two')]),
        equals([
          {'id': 1, 'name': 'one'},
          {'id': 2, 'name': 'two'},
        ]),
      );
    });
  });
}
