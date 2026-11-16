import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

class Inner {
  final int value;

  Inner(this.value);

  @override
  bool operator ==(Object other) => other is Inner && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class Outer {
  final Inner inner;
  final int other;

  Outer(this.inner, this.other);

  @override
  bool operator ==(Object other) =>
      other is Outer && other.inner == inner && other.other == this.other;

  @override
  int get hashCode => Object.hash(inner, other);
}

class InnerMapper extends SimpleMapper<Inner> {
  const InnerMapper();

  @override
  Inner decode(Object value) => Inner(container.fromValue<int>(value));

  @override
  Object? encode(Inner self) => container.toValue<int>(self.value);
}

class OuterMapper extends SimpleMapper<Outer> {
  const OuterMapper();

  @override
  Outer decode(Object value) {
    var inner = container.fromValue<Inner>(value);
    // The nested InnerMapper call must not clear the container.
    return Outer(inner, container.fromValue<int>(0));
  }

  @override
  Object? encode(Outer self) {
    var inner = container.toValue<Inner>(self.inner);
    // The nested InnerMapper call must not clear the container.
    return [inner, container.toValue<int>(self.other)];
  }
}

void main() {
  group('nested custom mappers', () {
    setUpAll(() {
      MapperContainer.globals.useAll([InnerMapper(), OuterMapper()]);
    });

    test('decode keeps the container after a nested mapper call', () {
      var outer = MapperContainer.globals.fromValue<Outer>(3);
      expect(outer, equals(Outer(Inner(3), 0)));
    });

    test('encode keeps the container after a nested mapper call', () {
      var encoded = MapperContainer.globals.toValue(Outer(Inner(3), 4));
      expect(encoded, equals([3, 4]));
    });

    test('container is not available outside decode and encode', () {
      expect(() => OuterMapper().container, throwsA(isA<AssertionError>()));
    });
  });
}
