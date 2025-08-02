import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'unmapped_props_hook_test.mapper.dart';

@MappableClass(hook: UnmappedPropertiesHook('unmappedProps'))
class A with AMappable {
  final String? a;
  Map<String, dynamic> unmappedProps;

  A(this.unmappedProps, this.a);
}

void main() {
  group('unmapped props hooks', () {
    test('collects unmapped props', () {
      var a = AMapper.fromJson('{"a": "a", "b": "b",  "c": "c"}');
      expect(a.a, equals('a'));
      expect(a.unmappedProps, equals({'b': 'b', 'c': 'c'}));
    });

    test('encodes unmapped props', () {
      var a = A({'b': 'b', 'c': 'c'}, 'a');
      expect(a.toJson(), '{"a":"a","b":"b","c":"c"}');
    });

    test('manual map', () {
      var map = UnmappedPropertiesHook('unmapped') //
      .beforeDecode({'a': 'a', 'b': 'b'});
      expect(map['a'], equals('a'));
      expect(map['b'], equals('b'));
      map['a'] = 'a2';
      var unmapped = map['unmapped'];
      expect(unmapped, equals({'a': 'a2'}));

      expect(map.remove('b'), equals('b'));
      map.clear();
      expect(unmapped, isEmpty);
    });
  });
}
