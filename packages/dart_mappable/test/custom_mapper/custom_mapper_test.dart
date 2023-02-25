// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'custom_mapper_test.mapper.dart';

class MyPrivateClass {
  dynamic value;

  MyPrivateClass(this.value);
}

class PrivateClassMapper extends SimpleMapper<MyPrivateClass> {
  @override
  MyPrivateClass decode(dynamic value) {
    return MyPrivateClass(value);
  }

  @override
  dynamic encode(MyPrivateClass self) {
    return self.value;
  }

  @override
  bool equals(MappingContext<Object> self, MyPrivateClass other) {
    return self.checked<MyPrivateClass>().value.value == other.value;
  }
}

class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

// only use the base type here
class GenericBoxMapper extends SimpleMapper1<GenericBox> {
  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();

  @override
  GenericBox decode<A>(Object value) {
    return GenericBox<A>(container.fromValue<A>(value));
  }

  @override
  Object? encode<A>(GenericBox<A> self) {
    return container.toValue(self.content);
  }
}

class UriMapper extends SimpleMapper<Uri> {
  @override
  Uri decode(dynamic value) {
    return Uri.parse(value as String);
  }

  @override
  dynamic encode(Uri self) {
    return self.toString();
  }
}

@MappableClass(
    hook: UnmappedPropertiesHook('unmappedProps'),
    includeCustomMappers: [BigIntMapper()])
class TestObj with TestObjMappable {
  BigInt? x;

  // Unmapped values
  Map<String, dynamic> unmappedProps = const {};

  @MappableConstructor()
  TestObj.explicit(this.x, this.unmappedProps);
}

class BigIntMapper extends PrimitiveMapper<BigInt> {
  const BigIntMapper();
}

class EmptyMapper extends MapperBase<Uint8List> {}

void main() {
  group('Custom Mappers', () {
    test('Simple Custom Mapper', () {
      var container = MapperContainer(mappers: {PrivateClassMapper()});

      MyPrivateClass c = container.fromValue('test');
      expect(c.value, equals('test'));

      var s = container.toValue(c);
      expect(s, equals('test'));

      expect(container.isEqual(c, MyPrivateClass('test')), isTrue);
    });

    test('Generic custom Mapper', () {
      var container = MapperContainer(mappers: {GenericBoxMapper()});

      GenericBox<int> box = container.fromValue('2');
      expect(box.content, equals(2));

      var json = container.toJson(box);
      expect(json, equals('2'));
    });

    test('Custom Uri Mapper', () {
      var container = MapperContainer(mappers: {UriMapper()});

      var uri = Uri(
          scheme: 'https',
          host: 'example.com',
          path: 'some/path',
          query: 'key=value');

      var encoded = container.toValue(uri);
      expect(encoded, equals('https://example.com/some/path?key=value'));

      var decoded = container.fromValue<Uri>(encoded);
      expect(decoded, equals(uri));
    });

    test('Empty mapper', () {
      var container = MapperContainer(mappers: {EmptyMapper()});

      expect(
        () => container.fromValue<Uint8List>([]),
        throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Uint8List)',
            MapperException.unsupportedMethod(MapperMethod.decode, Uint8List))),
      );

      expect(
        () => container.toValue<Uint8List>(Uint8List(0)),
        throwsMapperException(MapperException.chain(
            MapperMethod.encode,
            '(Uint8List)',
            MapperException.unsupportedMethod(MapperMethod.encode, Uint8List))),
      );

      expect(
        () => container.asString(Uint8List(0)),
        throwsMapperException(MapperException.chain(
            MapperMethod.stringify,
            "(Instance of 'Uint8List')",
            MapperException.unsupportedMethod(
                MapperMethod.stringify, Uint8List))),
      );

      expect(
        () => container.isEqual(Uint8List(0), Uint8List(0)),
        throwsMapperException(MapperException.chain(MapperMethod.equals, '[[]]',
            MapperException.unsupportedMethod(MapperMethod.equals, Uint8List))),
      );

      expect(
        () => container.hash(Uint8List(0)),
        throwsMapperException(MapperException.chain(MapperMethod.hash, '[[]]',
            MapperException.unsupportedMethod(MapperMethod.hash, Uint8List))),
      );
    });
  });

  group('bigint', () {
    test('decode', () {
      var testMap = {'x': BigInt.from(12345), 'y': 1234};
      var testObj = TestObjMapper.fromMap(testMap);

      expect(
        testObj,
        equals(TestObj.explicit(BigInt.from(12345), {'y': 1234})),
      );

      expect(
        testObj.toString(),
        equals('TestObj(x: 12345, unmappedProps: {y: 1234})'),
      );

      expect(
        testObj.toMap(),
        equals(testMap),
      );
    });
  });
}
