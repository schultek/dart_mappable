import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'class_equality_test.mapper.dart';

@MappableClass()
class A with AMappable {
  final String a;
  final int b;
  final double? c;
  final bool d;
  final B? e;

  A(this.a, {this.b = 0, this.c, required this.d, this.e});
}

@MappableEnum(defaultValue: B.a)
enum B { a, bB, ccCc }

@MappableClass()
class Base with BaseMappable {
  final String data;

  Base(this.data);
}

@MappableClass()
class Sub extends Base with SubMappable {
  Sub(super.data);
}

@MappableClass(discriminatorKey: 'type')
class BaseType with BaseTypeMappable {
  final String type;
  BaseType(this.type);
}

@MappableClass()
class SubType extends BaseType with SubTypeMappable {
  SubType(super.type);
}

@MappableClass()
class Generic<T> with GenericMappable<T> {
  final T data;

  Generic(this.data);
}

@MappableClass()
class Wrapper<T> with WrapperMappable<T> {
  final Generic<T> value;

  Wrapper(this.value);
}

void main() {
  var m = MapperContainer.globals;
  group('class equality', () {
    test('of basic class', () {
      var a = A('abc', b: 2, c: 0.5, d: true, e: B.bB);
      var a2 = A('abc', b: 2, c: 0.5, d: true, e: B.bB);

      expect(a, equals(a2));
      expect(m.isEqual(a, a2), isTrue);
    });

    test('of subclass', () {
      var base = Base('abc');
      var baseDupe = Base('abc');
      var base2 = Base('def');
      var sub = Sub('abc');
      var subDupe = Sub('abc');
      var sub2 = Sub('def');

      expect(base, equals(baseDupe));
      expect(base, isNot(equals(base2)));

      expect(sub, equals(subDupe));
      expect(sub, isNot(equals(sub2)));

      expect(base, isNot(equals(sub)));
      expect(sub, isNot(equals(base)));

      expect(m.isEqual(base, baseDupe), isTrue);
      expect(m.isEqual(base, base2), isFalse);
      expect(m.isEqual(sub, subDupe), isTrue);
      expect(m.isEqual(sub, sub2), isFalse);
      expect(m.isEqual(base, sub), isFalse);
      expect(m.isEqual(sub, base), isFalse);
    });

    test('of discriminated subclass', () {
      var base = BaseType('abc');
      var baseDupe = BaseType('abc');
      var base2 = BaseType('def');
      var sub = SubType('abc');
      var subDupe = SubType('abc');
      var sub2 = SubType('def');

      expect(base, equals(baseDupe));
      expect(base, isNot(equals(base2)));

      expect(sub, equals(subDupe));
      expect(sub, isNot(equals(sub2)));

      expect(base, isNot(equals(sub)));
      expect(sub, isNot(equals(base)));

      expect(m.isEqual(base, baseDupe), isTrue);
      expect(m.isEqual(base, base2), isFalse);
      expect(m.isEqual(sub, subDupe), isTrue);
      expect(m.isEqual(sub, sub2), isFalse);
      expect(m.isEqual(base, sub), isFalse);
      expect(m.isEqual(sub, base), isFalse);
    });

    test('of generic class', () {
      var g = Generic<String>('abc');
      var gDupe = Generic<String>('abc');
      var gNull = Generic<String?>('abc');
      var g2 = Generic<String>('def');

      expect(g, equals(gDupe));
      expect(g, equals(gNull));
      expect(gNull, equals(g));
      expect(g, isNot(equals(g2)));

      expect(m.isEqual(g, gDupe), isTrue);
      expect(m.isEqual(g, gNull), isTrue);
      expect(m.isEqual(gNull, g), isTrue);
      expect(m.isEqual(g, g2), isFalse);
    });

    test('of wrapper class', () {
      var w = Wrapper<String>(Generic<String>('abc'));
      var wDupe = Wrapper<String>(Generic<String>('abc'));
      var wNull = Wrapper<String?>(Generic<String?>('abc'));
      var wNullReal = Wrapper<String?>(Generic<String>('abc'));
      var w2 = Wrapper<String>(Generic<String>('def'));

      expect(w, equals(wDupe));
      expect(w, equals(wNull));
      expect(w, equals(wNullReal));
      expect(wNull, equals(w));
      expect(wNull, equals(wNullReal));
      expect(wNullReal, equals(w));
      expect(wNullReal, equals(wNull));

      expect(w, isNot(equals(w2)));
      expect(wNull, isNot(equals(w2)));
      expect(wNullReal, isNot(equals(w2)));
      expect(w2, isNot(equals(wNull)));
      expect(w2, isNot(equals(wNullReal)));
    });
  });
}
