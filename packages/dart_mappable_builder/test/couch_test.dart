import 'dart:io';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';
import 'package:test/test.dart';

import 'utils/test_mappable.dart';

void main() {
  group('Couch Test from Disk', () {
    test(
      'Reproduce and Save to Disk using helper',
      () async {
        // 1. Dateien von Disk lesen
        final baseContent =
            File('test/couchtest/couch_document_base.dart').readAsStringSync();
        final dataTypesContent =
            File('test/couchtest/datatypes.dart').readAsStringSync();

        // 2. Den Reader manuell erstellen, damit wir Zugriff darauf haben
        final reader = TestReaderWriter(rootPackage: 'models');
        await reader.testing.loadIsolateSources();

        // 3. Deine testMappable Logik "inline" ausführen, aber mit UNSEREM reader
        final inputs = {
          'models|lib/couch_document_base.dart': baseContent,
          'models|lib/datatypes.dart': dataTypesContent,
        };

        await testBuilder(
          MappableBuilder(BuilderOptions({})),
          inputs,
          readerWriter: reader, // Hier übergeben wir den reader
        );

        // 4. Die Ergebnis-Map abgreifen und schreiben
        // 4. Die Ergebnis-IDs durchlaufen und über den Reader auslesen
        for (final assetId in reader.testing.assets) {
          // Wir filtern nur die Mapper-Dateien heraus
          if (assetId.path.endsWith('.mapper.dart')) {
            // Den Inhalt direkt über den reader lesen
            final content = await reader.readAsString(assetId);

            // Dateiname extrahieren (z.B. datatypes.mapper.dart)
            final fileName = assetId.path.split('/').last;

            File('test/couchtest/$fileName').writeAsStringSync(content);
            print('✅ Datei geschrieben: test/couchtest/$fileName');
          }
        }
      },
      skip:
          true, // This test can be used to help creating the expected output files, dont run it normally!
    );

    test('Test inconsistent output for unmapped properties', () async {
      // 1. Inputs von Disk
      final baseContent =
          File('test/couchtest/couch_document_base.dart').readAsStringSync();
      final dataTypesContent =
          File('test/couchtest/datatypes.dart').readAsStringSync();

      // 2. Deine zuvor generierten Mapper-Files als "Expected Output"
      // Hinweis: Wenn der Bug noch drin ist, enthalten diese Files den fehlerhaften Code.
      // Das ist gut! So hast du einen "Ist-Zustand" Test.
      final baseMapperExpected =
          File(
            'test/couchtest/couch_document_base.mapper.dart',
          ).readAsStringSync();
      final dataTypesMapperExpected =
          File('test/couchtest/datatypes.mapper.dart').readAsStringSync();

      await testMappable(
        {'couch_document_base': baseContent, 'datatypes': dataTypesContent},
        outputs: {
          'couch_document_base': baseMapperExpected,
          'datatypes': dataTypesMapperExpected,
        },
      );
    });
  });
}
