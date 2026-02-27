import 'package:test/test.dart';

import 'utils/test_mappable.dart';

void main() {
  group('simple enum test', () {
    test('generates enum names and values', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';

            part 'model.mapper.dart';

            @MappableEnum(mode: ValuesMode.indexed)
            enum State {
              pending,
              @MappableValue(200)
              @MappableName('ok')
              success,
            }
          ''',
        },
        outputs: {
          'model':
              '// coverage:ignore-file\n'
              '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
              '// dart format off\n'
              '// ignore_for_file: type=lint\n'
              '// ignore_for_file: invalid_use_of_protected_member\n'
              '// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member\n'
              '// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter\n'
              '\n'
              'part of \'model.dart\';\n'
              '\n'
              'class StateMapper extends EnumMapper<State> {\n'
              '  StateMapper._();\n'
              '\n'
              '  static StateMapper? _instance;\n'
              '  static StateMapper ensureInitialized() {\n'
              '    if (_instance == null) {\n'
              '      MapperContainer.globals.use(_instance = StateMapper._());\n'
              '    }\n'
              '    return _instance!;\n'
              '  }\n'
              '\n'
              '  static State fromValue(dynamic value) {\n'
              '    ensureInitialized();\n'
              '    return MapperContainer.globals.fromValue(value);\n'
              '  }\n'
              '\n'
              '  @override\n'
              '  State decode(dynamic value) => switch (value) {\n'
              '    0 => State.pending,\n'
              '    200 => State.success,\n'
              '    _ => throw MapperException.unknownEnumValue(value),\n'
              '  };\n'
              '\n'
              '  @override\n'
              '  dynamic encode(State self) => switch (self) {\n'
              '    State.pending => 0,\n'
              '    State.success => 200,\n'
              '  };\n'
              '}\n'
              '\n'
              'extension StateMapperExtension on State {\n'
              '  dynamic toValue() {\n'
              '    StateMapper.ensureInitialized();\n'
              '    return MapperContainer.globals.toValue<State>(this);\n'
              '  }\n'
              '\n'
              '  String toName() => switch (this) {\n'
              '    State.pending => r\'pending\',\n'
              '    State.success => \'ok\',\n'
              '  };\n'
              '}\n'
              '\n'
              '',
        },
      );
    });
  });
}
