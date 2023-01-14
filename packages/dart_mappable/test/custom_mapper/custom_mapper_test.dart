// ignore_for_file: prefer_function_declarations_over_variables

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

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
  bool equals(MyPrivateClass self, MyPrivateClass other) {
    return self.value == other.value;
  }
}

class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

class GenericBoxMapper extends MapperBase<GenericBox> {
  // only use the base type here

  @override
  MapperElementBase<GenericBox> createElement(MapperContainer container) {
    return GenericBoxMapperElement(this, container);
  }

  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

class GenericBoxMapperElement extends MapperElementBase<GenericBox> {
  // only use the base type here

  GenericBoxMapperElement(super.mapper, super.container);

  @override
  late Function decoder = <T>(dynamic value) {
    return GenericBox<T>(container.fromValue<T>(value));
  };

  @override
  late Function encoder = <T>(GenericBox<T> self) {
    return container.toValue<T>(self.content);
  };
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
    includeCustomMappers: [BigIntMapper])
class TestObj with TestObjMappable {
  BigInt? x;

  // Unmapped values
  Map<String, dynamic> unmappedProps = const {};

  @MappableConstructor()
  TestObj.explicit(this.x, this.unmappedProps);
}

class BigIntMapper extends PrimitiveMapper<BigInt> {
  BigIntMapper() : super((v) => v as BigInt);

  @override
  bool isFor(value) => value is BigInt;
}

void main() {
  group('Custom Mappers', () {
    test('Simple Custom Mapper', () {
      var container = MapperContainer(mappers: {PrivateClassMapper()});

      MyPrivateClass c = container.fromValue('test');
      expect(c.value, equals('test'));

      var s = container.toValue(c);
      expect(s, equals('test'));

      expect(container.isEqual(c, MyPrivateClass('test')), equals(true));
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
          scheme: 'http',
          host: 'example.com',
          path: 'some/path',
          query: 'key=value');

      var encoded = container.toValue(uri);
      expect(encoded, equals('http://example.com/some/path?key=value'));

      var decoded = container.fromValue<Uri>(encoded);
      expect(decoded, equals(uri));
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
