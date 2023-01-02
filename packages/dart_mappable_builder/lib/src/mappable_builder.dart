import 'dart:async';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as path;

import 'builder_options.dart';
import 'elements/enum_mapper_element.dart';
import 'elements/target_class_mapper_element.dart';
import 'generators/class_mapper_generator.dart';
import 'generators/enum_mapper_generator.dart';
import 'mapper_group.dart';
import 'utils.dart';

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

    nodeResolver = buildStep.resolver;

    var entryLib = await buildStep.inputLibrary;
    var group = MapperElementGroup(entryLib, options);
    group.packageName = entryLib.source.uri.pathSegments.first;
    await group.analyze();

    var mappers = group.targets.values;

    if (mappers.isEmpty) {
      return null;
    }

    var generators = <MapperGenerator>[
      ...mappers
          .whereType<TargetClassMapperElement>()
          .map((e) => ClassMapperGenerator(e)),
      ...mappers
          .whereType<EnumMapperElement>()
          .map((e) => EnumMapperGenerator(e)),
    ];

    var output = await Future.wait(generators.map((g) => g.generate()));

    return DartFormatter(pageWidth: options.lineLength ?? 80).format(
      '// coverage:ignore-file\n'
      '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
      '// ignore_for_file: type=lint\n'
      '// ignore_for_file: unused_element\n\n'
      'part of \'${path.basename(buildStep.inputId.uri.toString())}\';\n\n'
      '${output.join('\n\n')}\n',
    );
  }
}
