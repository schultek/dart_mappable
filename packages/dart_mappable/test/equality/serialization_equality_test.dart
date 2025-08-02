import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'class_equality_test.dart';

typedef G = Generic<String>;
typedef GN = Generic<String?>;
typedef W = Wrapper<String>;
typedef WN = Wrapper<String?>;
typedef WO = Wrapper<Object>;
typedef WD = Wrapper<dynamic>;

void main() {
  var m = MapperContainer.globals;
  group('serialization equality', () {
    test('of basic class', () {
      var a = A('abc', b: 2, c: 0.5, d: true, e: B.bB);

      expect(a, equals(AMapper.fromMap(a.toMap())));
      expect(a, equals(m.fromMap<A>(m.toMap<A>(a))));
      expect(a, equals(m.fromMap<dynamic>(m.toMap<dynamic>(a))));
    });

    test('of subclass', () {
      var base = Base('abc');
      var sub = Sub('abc');

      expect(base, equals(BaseMapper.fromMap(base.toMap())));
      expect(base, equals(m.fromMap<Base>(m.toMap<Base>(base))));
      expect(base, equals(m.fromMap<dynamic>(m.toMap<dynamic>(base))));

      expect(sub, equals(SubMapper.fromMap(sub.toMap())));
      expect(sub, equals(m.fromMap<Sub>(m.toMap<Sub>(sub))));
      expect(sub, equals(m.fromMap<dynamic>(m.toMap<dynamic>(sub))));

      expect(sub, equals(m.fromMap<Base>(m.toMap<Base>(sub))));
    });

    test('of discriminated subclass', () {
      var base = BaseType('BaseType');
      var sub = SubType('SubType');

      expect(base, equals(BaseTypeMapper.fromMap(base.toMap())));
      expect(base, equals(m.fromMap<BaseType>(m.toMap<BaseType>(base))));
      expect(base, equals(m.fromMap<dynamic>(m.toMap<dynamic>(base))));

      expect(sub, equals(SubTypeMapper.fromMap(sub.toMap())));
      expect(sub, equals(m.fromMap<SubType>(m.toMap<SubType>(sub))));
      expect(sub, equals(m.fromMap<dynamic>(m.toMap<dynamic>(sub))));

      expect(sub, equals(m.fromMap<BaseType>(m.toMap<BaseType>(sub))));
    });

    test('of generic class', () {
      var g = Generic<String>('abc');
      var gNull = Generic<String?>('abc');

      expect(g, equals(GenericMapper.fromMap(g.toMap())));
      expect(gNull, equals(GenericMapper.fromMap(gNull.toMap())));

      expect(g, equals(m.fromMap<G>(m.toMap<G>(g))));
      expect(gNull, equals(m.fromMap<GN>(m.toMap<GN>(g))));
      expect(g, equals(m.fromMap<dynamic>(m.toMap<dynamic>(g))));

      expect(gNull, equals(m.fromMap<GN>(m.toMap<GN>(gNull))));
      expect(gNull, equals(m.fromMap<dynamic>(m.toMap<dynamic>(gNull))));
    });

    test('of wrapper class', () {
      var w = Wrapper<String>(Generic<String>('abc'));
      var wNull = Wrapper<String?>(Generic<String?>('abc'));
      var wNullReal = Wrapper<String?>(Generic<String>('abc'));
      var wObj = Wrapper<Object>(Generic<String>('abc'));
      var wObj2 = Wrapper<Object>(Generic<Object>(Generic<String>('abc')));
      var wDyn = Wrapper<dynamic>(Generic<dynamic>(Generic<String>('abc')));

      expect(w, equals(WrapperMapper.fromMap<String>(w.toMap())));
      expect(wNull, equals(WrapperMapper.fromMap<String?>(wNull.toMap())));
      expect(
        wNullReal,
        equals(WrapperMapper.fromMap<String?>(wNullReal.toMap())),
      );

      expect(wObj, equals(WrapperMapper.fromMap<Object>(wObj.toMap())));
      expect(wObj2, equals(WrapperMapper.fromMap<Object>(wObj2.toMap())));
      expect(wDyn, equals(WrapperMapper.fromMap<dynamic>(wDyn.toMap())));

      expect(w, equals(m.fromMap<W>(m.toMap<W>(w))));
      expect(wNull, equals(m.fromMap<WN>(m.toMap<WN>(w))));
      expect(wNull, equals(m.fromMap<WN>(m.toMap<WN>(wNull))));
      expect(wNullReal, equals(m.fromMap<WN>(m.toMap<WN>(wNullReal))));
      expect(w, equals(m.fromMap<WN>(m.toMap<WN>(w))));

      expect(w, equals(m.fromMap<dynamic>(m.toMap<dynamic>(w))));
      expect(wNull, equals(m.fromMap<dynamic>(m.toMap<dynamic>(wNull))));
      expect(
        wNullReal,
        equals(m.fromMap<dynamic>(m.toMap<dynamic>(wNullReal))),
      );

      expect(wObj, equals(m.fromMap<WO>(m.toMap<WO>(wObj))));
      expect(wObj2, equals(m.fromMap<WO>(m.toMap<WO>(wObj2))));
      expect(wDyn, equals(m.fromMap<WD>(m.toMap<WD>(wDyn))));

      expect(wObj, equals(m.fromMap<dynamic>(m.toMap<dynamic>(wObj))));
      expect(wObj2, equals(m.fromMap<dynamic>(m.toMap<dynamic>(wObj2))));
      expect(wDyn, equals(m.fromMap<dynamic>(m.toMap<dynamic>(wDyn))));
    });
  });
}
