import 'dart:async';

import 'package:build/build.dart';
import 'package:path/path.dart' as path;

import 'builder_options.dart';
import 'mapper_resource.dart';

/// The main builder used for code generation
class MappableBuilder implements Builder {
  /// The global options defined in the 'build.yaml' file
  late MappableOptions options;

  MappableBuilder(BuilderOptions options)
      : options = MappableOptions.parse(options.config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.mapper.dart');

    try {
      var generatedSource = await generate(buildStep);
      if (generatedSource != null) {
        await buildStep.writeAsString(outputId, generatedSource);
      }
    } catch (e, st) {
      print('An unexpected error occurred.\n'
          'This is probably a bug in dart_mappable.\n'
          'Please report this here: '
          'https://github.com/schultek/dart_mappable/issues\n\n'
          'The error was:\n$e\n\n$st');
      rethrow;
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.mapper.dart']
      };

  /// Main generation handler
  /// Searches for mappable classes and enums recursively
  Future<String?> generate(BuildStep buildStep) async {

    if (!await buildStep.resolver.isLibrary(buildStep.inputId)) {
      return null;
    }

    var data = await buildStep.fetchResource(mapperResource);
    data.globalOptions = options;

    var entryLib = await buildStep.inputLibrary;

    data.packageName = entryLib.source.uri.pathSegments.first;

    var group = data.getGroupForLibrary(entryLib);

    if (group.targets.isEmpty) {
      return null;
    }

    var generators = await Future.wait(
        group.targets.values.map((t) => t.finalize.then((_) => t.generator)));
    var output = await Future.wait(generators.map((g) => g.generate()));

    return ''
        '// coverage:ignore-file\n'
        '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
        '// ignore_for_file: type=lint\n'
        '// ignore_for_file: unused_element\n\n'
        'part of \'${path.basename(buildStep.inputId.uri.toString())}\';\n\n'
        '${output.join('\n\n')}\n';
  }
}
