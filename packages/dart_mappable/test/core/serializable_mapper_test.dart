import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

class MyClass {
  MyClass();
  MyClass.fromJson(Map<String, dynamic> map);
  Map<String, dynamic> toJson() => {};
}

class MyClass1<A> {
  MyClass1();
  MyClass1.fromJson(Map<String, dynamic> map, A Function(Object?) a);
  Map<String, dynamic> toJson(Object? Function(dynamic) a) => {};
}

class MyClass2<A, B> {
  MyClass2();
  MyClass2.fromJson(
      Map<String, dynamic> map, A Function(Object?) a, B Function(Object?) b);
  Map<String, dynamic> toJson(
          Object? Function(dynamic) a, Object? Function(dynamic) b) =>
      {};
}

var myClassMapper = SerializableMapper<MyClass, Map<String, dynamic>>(
  decode: MyClass.fromJson,
  encode: (myClass) => myClass.toJson,
);
var myClass1Mapper = SerializableMapper<MyClass1, Map<String, dynamic>>.arg1(
  decode: MyClass1.fromJson,
  encode: (myClass) => myClass.toJson,
  type: <A>(f) => f<MyClass1<A>>(),
);

var myClass2Mapper = SerializableMapper<MyClass2, Map<String, dynamic>>.arg2(
  decode: MyClass2.fromJson,
  encode: (myClass) => myClass.toJson,
  type: <A, B>(f) => f<MyClass2<A, B>>(),
);

void main() {
  group('serializable mapper', () {
    MapperContainer.globals.use(myClassMapper);
    MapperContainer.globals.use(myClass1Mapper);
    MapperContainer.globals.use(myClass2Mapper);

    test('basic class', () {
      expect(
        MapperContainer.globals.fromJson<MyClass>('{}'),
        isA<MyClass>(),
      );
      expect(
        MapperContainer.globals.toJson(MyClass()),
        equals('{}'),
      );
    });

    test('generic 1 class', () {
      expect(
        MapperContainer.globals.fromJson<MyClass1<int>>('{}'),
        isA<MyClass1<int>>(),
      );
      expect(
        MapperContainer.globals.toJson(MyClass1<int>()),
        equals('{}'),
      );
    });

    test('generic 2 class', () {
      expect(
        MapperContainer.globals.fromJson<MyClass2<int, bool>>('{}'),
        isA<MyClass2<int, bool>>(),
      );
      expect(
        MapperContainer.globals.toJson(MyClass2<int, bool>()),
        equals('{}'),
      );
    });
  });
}
