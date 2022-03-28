// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'enums_test.mapper.g.dart';

@MappableEnum(defaultValue: State.off)
enum State { On, off, itsCOMPLICATED }

@MappableEnum(caseStyle: CaseStyle.paramCase)
enum Color { Green, BLUE, bloodRED }

void main() {
  group('Enum Mappers', () {
    test('Should encode enums', () {
      expect(Mapper.toValue(State.On), equals('on'));
      expect(State.itsCOMPLICATED.toStringValue(), equals('itsComplicated'));
      expect(Mapper.toValue(Color.BLUE), equals('blue'));
      expect(Color.bloodRED.toStringValue(), equals('blood-red'));
    });

    test('Should decode enums', () {
      expect(Mapper.fromValue<State>('on'), equals(State.On));
      expect(Mapper.fromValue<State>('off'), equals(State.off));
      expect(Mapper.fromValue<State>('none'), equals(State.off));
      expect(
        () => Mapper.fromValue<State>(1),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(State)',
          MapperException.unexpectedType(int, State, 'String'),
        )),
      );

      expect(Mapper.fromValue<Color>('green'), equals(Color.Green));
      expect(Mapper.fromValue<Color>('blood-red'), equals(Color.bloodRED));
      expect(
        () => Mapper.fromValue<Color>('pink'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Color)',
          MapperException.unknownEnumValue('pink'),
        )),
      );
    });
  });
}
