// ignore_for_file: prefer_function_declarations_over_variables

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'custom_mapper_test.mapper.g.dart';

class MyPrivateClass {
  dynamic value;

  MyPrivateClass(this.value);
}

@CustomMapper()
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
  bool equals(MyPrivateClass self, MyPrivateClass other) =>
      self.value == other.value;
}

class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

@CustomMapper()
class CustomGenericMapper extends BaseMapper<GenericBox> {
  // only use the base type here

  @override
  Function decoder = <T>(dynamic value) {
    return GenericBox<T>(Mapper.fromValue<T>(value));
  };

  @override
  Function encoder = (GenericBox self) {
    return Mapper.toValue(self.content);
  };

  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

@CustomMapper()
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

void main() {
  group('Custom Mappers', () {
    test('Simple Custom Mapper', () {
      MyPrivateClass c = Mapper.fromValue('test');
      expect(c.value, equals('test'));

      var s = Mapper.toValue(c);
      expect(s, equals('test'));

      expect(Mapper.isEqual(c, MyPrivateClass('test')), equals(true));
    });

    test('Generic custom Mapper', () {
      GenericBox<int> box = Mapper.fromValue('2');
      expect(box.content, equals(2));

      var json = Mapper.toJson(box);
      expect(json, equals('2'));
    });

    test('Custom Uri Mapper', () {
      var uri = Uri(
          scheme: 'http',
          host: 'example.com',
          path: 'some/path',
          query: 'key=value');

      var encoded = Mapper.toValue(uri);
      expect(encoded, equals('http://example.com/some/path?key=value'));

      var decoded = Mapper.fromValue<Uri>(encoded);
      expect(decoded, equals(uri));
    });
  });
}
