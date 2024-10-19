import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'custom_mapper_test.dart';

part 'annotation_test.mapper.dart';

const mappable = MappableClass(
  uniqueId: 'ABC',
  ignoreNull: true,
  includeCustomMappers: [PrivateClassMapper()],
);

@mappable
class PrivateContainer with PrivateContainerMappable {
  PrivateContainer(this.value);

  final MyPrivateClass value;
}

const mappable2 = mappable;

@mappable2
class PrivateContainer2 with PrivateContainer2Mappable {
  PrivateContainer2(this.value);

  final MyPrivateClass value;
}

void main() {
  group('Custom Annotation', () {
    tearDown(() {
      MapperContainer.globals.unuse<MyPrivateClass>();
    });

    test('from constant', () {
      expect(
        PrivateContainer(MyPrivateClass('abc')).toMap(),
        equals({'value': 'abc'}),
      );
    });

    test('from nested constant', () {
      expect(
        PrivateContainer2(MyPrivateClass('abc')).toMap(),
        equals({'value': 'abc'}),
      );
    });
  });
}
