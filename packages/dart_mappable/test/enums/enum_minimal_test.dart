import 'package:dart_mappable/dart_mappable.dart';

part 'enum_minimal_test.mapper.dart';

@MappableEnum(mode: ValuesMode.indexed)
enum State {
  pending,
  @MappableValue(200)
  @MappableName('ok')
  success,
}
