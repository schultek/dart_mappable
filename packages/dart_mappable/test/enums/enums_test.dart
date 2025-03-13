// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'enums_test.mapper.dart';

@MappableEnum(defaultValue: State.off)
enum State { On, off, itsCOMPLICATED }

@MappableEnum(caseStyle: CaseStyle.paramCase)
enum Color { Green, BLUE, bloodRED }

@MappableEnum(mode: ValuesMode.indexed)
enum Items { first, second, third }

@MappableEnum(mode: ValuesMode.indexed)
enum Status {
  zero,
  @MappableValue(200)
  success,
  @MappableValue(State.off)
  warning,
  @MappableValue(r'error$val')
  error
}

void main() {
  group('enum mapping', () {
    group('encodes', () {
      test('enum', () {
        expect(State.On.toValue(), equals('On'));
        expect(State.off.toValue(), equals('off'));
        expect(State.itsCOMPLICATED.toValue(), equals('itsCOMPLICATED'));
      });

      test('enum with case style', () {
        expect(Color.Green.toValue(), equals('green'));
        expect(Color.BLUE.toValue(), equals('blue'));
        expect(Color.bloodRED.toValue(), equals('blood-red'));
      });

      test('enum with index mode', () {
        expect(Items.first.toValue(), equals(0));
        expect(Items.second.toValue(), equals(1));
        expect(Items.third.toValue(), equals(2));
      });

      test('enum with custom values', () {
        expect(Status.zero.toValue(), equals(0));
        expect(Status.success.toValue(), equals(200));
        expect(Status.warning.toValue(), equals(State.off));
        expect(Status.error.toValue(), equals('error\$val'));
      });
    });

    group('decodes', () {
      test('enum', () {
        expect(ColorMapper.fromValue('green'), equals(Color.Green));
        expect(ColorMapper.fromValue('blood-red'), equals(Color.bloodRED));
        expect(
          () => ColorMapper.fromValue('pink'),
          throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Color)',
            MapperException.unknownEnumValue('pink'),
          )),
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
          throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Items)',
            MapperException.unknownEnumValue(3),
          )),
        );
      });

      test('enum with custom values', () {
        expect(StatusMapper.fromValue(0), equals(Status.zero));
        expect(StatusMapper.fromValue(200), equals(Status.success));
        expect(StatusMapper.fromValue(State.off), equals(Status.warning));
        expect(StatusMapper.fromValue('error\$val'), equals(Status.error));

        expect(
          () => ItemsMapper.fromValue(false),
          throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Items)',
            MapperException.unknownEnumValue(false),
          )),
        );
      });
    });
  });
}
