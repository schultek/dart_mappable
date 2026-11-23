import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

void main() {
  group('case style', () {
    test('from string', () {
      expect(CaseStyle.fromString('camelCase'), equals(CaseStyle.camelCase));
      expect(CaseStyle.fromString('pascalCase'), equals(CaseStyle.pascalCase));
      expect(CaseStyle.fromString('snakeCase'), equals(CaseStyle.snakeCase));
      expect(CaseStyle.fromString('paramCase'), equals(CaseStyle.paramCase));
      expect(CaseStyle.fromString('lowerCase'), equals(CaseStyle.lowerCase));
      expect(CaseStyle.fromString('upperCase'), equals(CaseStyle.upperCase));

      expect(CaseStyle.fromString('unmodified'), equals(null));
    });

    test('custom from string', () {
      expect(
        CaseStyle.fromString('custom(u,_)'),
        predicate<CaseStyle>(
          (c) => c.tail == TextTransform.upperCase && c.separator == '_',
        ),
      );
      expect(
        CaseStyle.fromString('custom(lc,+)'),
        predicate<CaseStyle>(
          (c) =>
              c.head == TextTransform.lowerCase &&
              c.tail == TextTransform.capitalCase &&
              c.separator == '+',
        ),
      );
    });

    test('transform', () {
      expect(CaseStyle.fromString(null).transform('AaBb'), equals('AaBb'));

      expect(CaseStyle.camelCase.transform('AaBb'), equals('aaBb'));
      expect(CaseStyle.snakeCase.transform('AaBb'), equals('aa_bb'));
    });

    test('transform with digits', () {
      expect(
        CaseStyle.snakeCase.transform('immediateSpo2Threshold'),
        equals('immediate_spo2_threshold'),
      );
      expect(
        CaseStyle.camelCase.transform('immediateSpo2Threshold'),
        equals('immediateSpo2Threshold'),
      );
      expect(
        CaseStyle.paramCase.transform('value2Count'),
        equals('value2-count'),
      );

      // Digits that are not followed by an uppercase letter stay within a word.
      expect(CaseStyle.snakeCase.transform('spo2'), equals('spo2'));
      expect(CaseStyle.snakeCase.transform('myValue2'), equals('my_value2'));
    });
  });
}
