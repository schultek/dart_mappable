import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'with_getters_test.mapper.dart';

@MappableClass()
class ClassWithGetters with ClassWithGettersMappable {
  final String name;
  final int count;

  ClassWithGetters(this.name, this.count);

  String get message => 'Hello, $name!';
  bool get hasItems => count > 0;
}

void main() {
  group('basic class with getters', () {
    test('encodes only fields', () {
      var obj = ClassWithGetters('Kilian', 3);
      expect(obj.toMap(), {'name': 'Kilian', 'count': 3});
    });
  });
}
