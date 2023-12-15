import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'dart_compatible_test.mapper.dart';


@MappableClass(dartCompatible: true)
class A with AMappable {
  final String a;
  A(this.a);
}

@MappableClass(dartCompatible: false)
class B with BMappable {
  final String b;
  B(this.b);
}

void main() {
  group('Dart compatible', () {
    test('serializing with dart compatible method names', () {
      AMapper.ensureInitialized();
      var a = A('test');
      BMapper.ensureInitialized();
      var b = B('test');

      // should work
      expect(a.toJson(), equals({'a': 'test'}));
      expect(a.serialize(), equals('{"a":"test"}'));
      expect(b.toMap(), equals({'b': 'test'}));
      expect(b.toJson(), equals('{"b":"test"}'));

      // toJson() returns different types
      expect(a.toJson(), TypeMatcher<Map>());
      expect(b.toJson(), TypeMatcher<String>());

      expect(a.serialize(), TypeMatcher<String>());
      expect(b.toMap(), TypeMatcher<Map>());

    });

    test('deserializing with dart compatible method names', () {
      AMapper.ensureInitialized();
      String aString = '{"a":"test"}';
      Map<String, String> aMap = {'a': 'test'};
      A a = A('test');
      BMapper.ensureInitialized();
      String bString = '{"b":"test"}';
      Map<String, String> bMap = {'b': 'test'};
      B b = B('test');

      // should work
      expect(AMapper.fromJson(aMap), equals(a));
      expect(AMapper.deserialize(aString), equals(a));
      expect(BMapper.fromMap(bMap), equals(b));
      expect(BMapper.fromJson(bString), equals(b));

      // fromJson() accepts different types
      expect(AMapper.fromJson(aMap), TypeMatcher<A>());
      expect(BMapper.fromJson(bString), TypeMatcher<B>());

      expect(AMapper.deserialize(aString), TypeMatcher<A>());
      expect(BMapper.fromMap(bMap), TypeMatcher<B>());

    });
  });
}