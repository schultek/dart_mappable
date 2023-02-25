import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

void main() {
  group('config', () {
    test('parse generate methods', () {
      expect(
        GenerateMethods.parse(['stringify']),
        equals(GenerateMethods.stringify),
      );

      expect(
        GenerateMethods.parse(['decode', 'encode']),
        equals(GenerateMethods.decode | GenerateMethods.encode),
      );

      expect(
        GenerateMethods.parse(['equals', 'copy']),
        equals(GenerateMethods.equals | GenerateMethods.copy),
      );

      expect(
        GenerateMethods.parse(['all']),
        equals(GenerateMethods.all),
      );
    });
  });
}
