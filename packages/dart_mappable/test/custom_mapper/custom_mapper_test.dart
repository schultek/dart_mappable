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
  const PrivateClassMapper();

  @override
  MyPrivateClass decode(dynamic value) {
    return MyPrivateClass(value);
  }

  @override
  dynamic encode(MyPrivateClass self) {
    return self.value;
  }

  @override
  bool equals(
      MyPrivateClass self, MyPrivateClass other, MappingContext context) {
    return self.value == other.value;
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

const privateMappers = [PrivateClassMapper()];

@MappableClass(
  hook: UnmappedPropertiesHook('unmappedProps'),
  includeCustomMappers: [BigIntMapper(), ...privateMappers],
)
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
      MapperContainer.globals.use(PrivateClassMapper());

      MyPrivateClass c = MapperContainer.globals.fromValue('test');
      expect(c.value, equals('test'));

      var s = MapperContainer.globals.toValue(c);
      expect(s, equals('test'));

      expect(
          MapperContainer.globals.isEqual(c, MyPrivateClass('test')), isTrue);
    });

    test('Generic custom Mapper', () {
      MapperContainer.globals.use(GenericBoxMapper());

      GenericBox<int> box = MapperContainer.globals.fromValue('2');
      expect(box.content, equals(2));

      var json = MapperContainer.globals.toJson(box);
      expect(json, equals('2'));
    });

    test('Custom Uri Mapper', () {
      MapperContainer.globals.use(UriMapper());

      var uri = Uri(
          scheme: 'https',
          host: 'example.com',
          path: 'some/path',
          query: 'key=value');

      var encoded = MapperContainer.globals.toValue(uri);
      expect(encoded, equals('https://example.com/some/path?key=value'));

      var decoded = MapperContainer.globals.fromValue<Uri>(encoded);
      expect(decoded, equals(uri));
    });

    test('Empty mapper', () {
      MapperContainer.globals.use(EmptyMapper());

      expect(
        () => MapperContainer.globals.fromValue<Uint8List>([]),
        throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Uint8List)',
            MapperException.unsupportedMethod(MapperMethod.decode, Uint8List))),
      );

      expect(
        () => MapperContainer.globals.toValue<Uint8List>(Uint8List(0)),
        throwsMapperException(MapperException.chain(
            MapperMethod.encode,
            '(Uint8List)',
            MapperException.unsupportedMethod(MapperMethod.encode, Uint8List))),
      );

      expect(
        () => MapperContainer.globals.asString(Uint8List(0)),
        throwsMapperException(MapperException.chain(
            MapperMethod.stringify,
            "(Instance of 'Uint8List')",
            MapperException.unsupportedMethod(
                MapperMethod.stringify, Uint8List))),
      );

      expect(
        () => MapperContainer.globals.isEqual(Uint8List(0), Uint8List(0)),
        throwsMapperException(MapperException.chain(MapperMethod.equals, '[[]]',
            MapperException.unsupportedMethod(MapperMethod.equals, Uint8List))),
      );

      expect(
        () => MapperContainer.globals.hash(Uint8List(0)),
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
