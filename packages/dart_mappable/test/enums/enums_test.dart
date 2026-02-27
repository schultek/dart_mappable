// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'enums_test.mapper.dart';

///
///
@MappableEnum(defaultValue: State.off)
enum State { On, off, itsCOMPLICATED }

///
///
@MappableEnum(caseStyle: CaseStyle.paramCase)
enum Color { Green, BLUE, bloodRED }

///
///
@MappableEnum(mode: ValuesMode.indexed)
enum Items { first, second, third }

///
///
@MappableEnum(mode: ValuesMode.indexed)
enum Status {
  zero,
  @MappableValue(200)
  success,
  @MappableValue(State.off)
  warning,
  @MappableValue(r'error$val')
  @MappableName('exception')
  error,
}

///
///
void main() {
  group('enum mapping', () {
    group('encodes', () {
      test('enum', () {
        expect(State.On.value, equals('On'));
        expect(State.off.value, equals('off'));
        expect(State.itsCOMPLICATED.value, equals('itsCOMPLICATED'));
      });

      test('enum with case style', () {
        expect(Color.Green.value, equals('green'));
        expect(Color.BLUE.value, equals('blue'));
        expect(Color.bloodRED.value, equals('blood-red'));
      });

      test('enum with index mode', () {
        expect(Items.first.value, equals(0));
        expect(Items.second.value, equals(1));
        expect(Items.third.value, equals(2));
      });

      test('enum with custom values', () {
        expect(Status.zero.value, equals(0));
        expect(Status.success.toValue(), equals(200));
        expect(Status.warning.value, equals(State.off));
        expect(Status.error.value, equals('error\$val'));
      });

      test('enum names', () {
        expect(State.On.name, equals('On'));
        expect(Color.bloodRED.name, equals('bloodRED'));

        expect(State.On.name, equals('On'));
        expect(Color.bloodRED.name, equals('bloodRED'));

        expect(Status.zero.name, equals('zero'));
        expect(Status.success.name, equals('success'));
        expect(
          Status.error.name,
          equals('exception'),
          reason: '"error" has custom name via @MappableName("exception")',
        );

        expect(Status.error.value, equals('error\$val'));
        expect(Status.error.value, equals('error\$val'));
        expect(Status.error.name, equals('exception'));
      });
    });

    group('decodes', () {
      test('enum', () {
        expect(ColorMapper.fromValue('green'), equals(Color.Green));
        expect(ColorMapper.fromValue('blood-red'), equals(Color.bloodRED));
        expect(
          () => ColorMapper.fromValue('pink'),
          throwsMapperException(
            MapperException.chain(
              MapperMethod.decode,
              '(Color)',
              MapperException.unknownEnumValue('pink'),
            ),
          ),
        );
      });

      test('enum with case style', () {
        expect(StateMapper.fromValue('On'), equals(State.On));
        expect(StateMapper.fromValue('off'), equals(State.off));
        expect(StateMapper.fromValue('none'), equals(State.off));
      });

      test('enum with index mode', () {
        expect(ItemsMapper.fromValue(0), equals(Items.first));
        expect(ItemsMapper.fromValue(1), equals(Items.second));
        expect(ItemsMapper.fromValue(2), equals(Items.third));

        expect(
          () => ItemsMapper.fromValue(3),
          throwsMapperException(
            MapperException.chain(
              MapperMethod.decode,
              '(Items)',
              MapperException.unknownEnumValue(3),
            ),
          ),
        );
      });

      test('enum with custom values', () {
        expect(StatusMapper.fromValue(0), equals(Status.zero));
        expect(StatusMapper.fromValue(200), equals(Status.success));
        expect(StatusMapper.fromValue(State.off), equals(Status.warning));
        expect(StatusMapper.fromValue('error\$val'), equals(Status.error));

        expect(
          () => ItemsMapper.fromValue(false),
          throwsMapperException(
            MapperException.chain(
              MapperMethod.decode,
              '(Items)',
              MapperException.unknownEnumValue(false),
            ),
          ),
        );
      });

      test('enum with custom names still decodes by value', () {
        expect(StatusMapper.fromValue('error\$val'), equals(Status.error));

        expect(
          () => StatusMapper.fromValue('exception'),
          throwsMapperException(
            MapperException.chain(
              MapperMethod.decode,
              '(Status)',
              MapperException.unknownEnumValue('exception'),
            ),
          ),
        );
      });
    });
  });
}
