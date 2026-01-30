import 'dart:io';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';
import 'package:test/test.dart';

void main() {
  group('Inconsistency Test', () {
    test(
      'Check inconsistent output for unmapped properties',
      () async {
        // 1. Dateien von Disk lesen
        final fileA =
            File('test/inconsistencytest/other_base_a.dart').readAsStringSync();
        final fileB =
            File('test/inconsistencytest/other_base_b.dart').readAsStringSync();

        // 2. Den Reader manuell erstellen, damit wir Zugriff darauf haben
        final reader = TestReaderWriter(rootPackage: 'models');
        await reader.testing.loadIsolateSources();

        // 3. Deine testMappable Logik "inline" ausführen, aber mit UNSEREM reader
        final inputs = {
          'models|lib/other_base_a.dart': fileA,
          'models|lib/other_base_b.dart': fileB,
        };

        await testBuilder(
          MappableBuilder(BuilderOptions({})),
          inputs,
          readerWriter: reader, // Hier übergeben wir den reader
        );

        // 4. Die Ergebnis-IDs durchlaufen und über den Reader auslesen
        String? resultA;
        String? resultB;

        for (final assetId in reader.testing.assets) {
          if (assetId.path.endsWith('other_base_a.mapper.dart')) {
            resultA = await reader.readAsString(assetId);
          } else if (assetId.path.endsWith('other_base_b.mapper.dart')) {
            resultB = await reader.readAsString(assetId);
          }
        }

        expect(resultA, isNotNull);
        expect(resultB, isNotNull);

        expect(
          findAbstractClassOtherBaseCopyWith(resultA!),
          equals(findAbstractClassOtherBaseCopyWith(resultB!)),
        );
      }, // This test can be used to help creating the expected output files, dont run it normally!
    );
  });
}

String findAbstractClassOtherBaseCopyWith(String s) {
  int start = s.indexOf('abstract class OtherBaseCopyWith');
  int end = s.indexOf('}\n', start) + 1;
  return s.substring(start, end);
}
