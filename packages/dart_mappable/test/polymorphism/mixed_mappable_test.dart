import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'mixed_mappable_test.mapper.dart';

abstract class AbstractIdBase {
  const AbstractIdBase({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}

@MappableClass()
abstract class Base extends AbstractIdBase with BaseMappable {
  const Base({
    required super.id,
    required super.name,
    required this.objects,
  });

  final Map<String, dynamic> objects;
}

@MappableClass()
class One extends Base with OneMappable {
  One({
    required super.id,
    required super.name,
    required super.objects,
  });
}

@MappableClass()
class Two extends AbstractIdBase with TwoMappable {
  Two({required super.id}) : super(name: 'two');
}

void main() {
  group('mixed mappable', () {
    test('does not generate for non-mappable superclass', () {
      BaseMapper.ensureInitialized();
      expect(MapperContainer.globals.get<Base>(), isNotNull);
      expect(MapperContainer.globals.get<AbstractIdBase>(), isNull);
    });
  });
}
