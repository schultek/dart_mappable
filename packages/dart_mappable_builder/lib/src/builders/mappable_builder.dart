import 'dart:async';

import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

import '../builder_options.dart';
import '../elements/class/target_class_mapper_element.dart';
import '../elements/enum/target_enum_mapper_element.dart';
import '../elements/record/target_record_mapper_element.dart';
import '../generators/class_mapper_generator.dart';
import '../generators/enum_mapper_generator.dart';
import '../generators/generator.dart';
import '../generators/record_mapper_generator.dart';
import '../mapper_group.dart';
import '../utils.dart';

/// The main builder used for code generation
class MappableBuilder implements Builder {
  /// The global options defined in the 'build.yaml' file
  late MappableOptions options;

  MappableBuilder(BuilderOptions options)
      : options = MappableOptions.parse(options.config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    if (!await buildStep.resolver.isLibrary(buildStep.inputId)) {
      return;
    }

    nodeResolver = buildStep.resolver;

    try {
      var group = await createMapperGroup(buildStep);

      await Future.wait([
        generateMapperFile(buildStep, group),
        generateInitFile(buildStep, group),
      ]);
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
  Map<String, List<String>> get buildExtensions => options.buildExtensions;

  Future<MapperElementGroup> createMapperGroup(BuildStep buildStep) async {
    var entryLib = await buildStep.inputLibrary;

    var options = this.options;

    if (libChecker.hasAnnotationOf(entryLib)) {
      var libOptions =
          MappableOptions.from(libChecker.firstAnnotationOf(entryLib)!);

      options = options.apply(libOptions);
    }

    var group = MapperElementGroup(entryLib, options);

    return group;
  }

  Future<void> generateMapperFile(
      BuildStep buildStep, MapperElementGroup group) async {
    await group.analyze();

    var mappers = group.targets.values;

    if (mappers.isEmpty) {
      return;
    }

    var generators = <MapperGenerator>[
      for (var m in mappers)
        if (m is TargetClassMapperElement)
          ClassMapperGenerator(m)
        else if (m is TargetEnumMapperElement)
          EnumMapperGenerator(m)
        else if (m is TargetRecordMapperElement)
          RecordMapperGenerator(m),
      for (var r in group.records.sortedRecords) //
        RecordMapperGenerator(r),
    ];

    var output = await Future.wait(generators.map((g) => g.generate()));

    final outputId = buildStep.allowedOutputs.first;

    var libraryPath =
        p.relative(buildStep.inputId.path, from: p.dirname(outputId.path));
    var source = DartFormatter(pageWidth: options.lineLength ?? 80).format(
        '// coverage:ignore-file\n'
        '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
        '// ignore_for_file: type=lint\n'
        '// ignore_for_file: unused_element, unnecessary_cast\n'
        '// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter\n\n'
        'part of \'$libraryPath\';\n\n'
        '${output.join('\n\n')}\n' //,
        );

    await buildStep.writeAsString(outputId, source);
  }

  Future<void> generateInitFile(
      BuildStep buildStep, MapperElementGroup group) async {
    if (group.options.initializerScope == null) {
      return;
    }

    var output = StringBuffer();

    var discovered = await group.discover(buildStep);
    if (discovered.isEmpty) {
      return;
    }

    discovered.sortBy((e) => e.key.source.uri.toString());

    final outputId = buildStep.allowedOutputs.last;

    output.write(writeImports(
      buildStep.inputId,
      discovered.map((e) => e.key.source.uri).toList(),
      p.dirname(outputId.uri.path),
    ));

    output.write('void initializeMappers() {\n');

    for (var i = 0; i < discovered.length; i++) {
      for (var e in discovered[i].value) {
        output.write('  p$i.${e.name}Mapper.ensureInitialized();\n');
      }
    }

    output.write('}');

    var source = DartFormatter(pageWidth: options.lineLength ?? 80).format(
      '// coverage:ignore-file\n'
      '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
      '// ignore_for_file: type=lint\n'
      '// ignore_for_file: unused_element\n\n'
      '${output.toString()}\n',
    );

    await buildStep.writeAsString(outputId, source);
  }
}

String writeImports(AssetId input, List<Uri> imports, String outputDirectory) {
  List<String> package = [], relative = [];
  var prefixes = <String, int?>{};

  var path = p.posix;

  for (var i = 0; i < imports.length; i++) {
    var import = imports[i];
    if (import.isScheme('asset')) {
      var relativePath = path.relative(import.path, from: outputDirectory);

      relative.add(relativePath);
      prefixes[relativePath] = i;
    } else if (import.isScheme('package') &&
        import.pathSegments.first == input.package &&
        input.pathSegments.first == 'lib') {
      var relativePath = path.relative(import.path, from: outputDirectory);

      relative.add(relativePath);
      prefixes[relativePath] = i;
    } else if (import.scheme == 'package') {
      package.add(import.toString());
      prefixes[import.toString()] = i;
    } else {
      relative.add(import.toString()); // TODO: is this correct?
      prefixes[import.toString()] = i;
    }
  }

  package.sort();
  relative.sort();

  String joined(List<String> s) => s.isNotEmpty
      ? '${s.map((s) => "import '$s'${prefixes[s] != null ? ' as p${prefixes[s]}' : ''};").join('\n')}\n\n'
      : '';

  return joined(package) + joined(relative);
}
