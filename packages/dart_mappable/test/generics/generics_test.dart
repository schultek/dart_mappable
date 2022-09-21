import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'generics_test.mapper.g.dart';

@MappableClass()
class Box<T extends Content> {
  int size;
  List<T> contents;

  Box(this.size, {required this.contents});
}

@MappableClass()
class Confetti extends Content {
  String color;
  Confetti(this.color);
}

@MappableClass()
class Content {}

void main() {
  group('Generic classes', () {
    test('Should encode generic objects', () {
      Box<Confetti> box = Box(10, contents: [Confetti('Rainbow')]);
      String boxJson = box.toJson();
      expect(
        boxJson,
        equals(
            '{"size":10,"contents":[{"color":"Rainbow"}],"__type":"Box<Confetti>"}'),
      );

      dynamic whatAmI = Mapper.fromJson(boxJson);
      expect(whatAmI.runtimeType, equals(type<Box<Confetti>>()));
    });
  });
}
