import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'generics_test.dart' as b;
part 'duplicate_names_test.mapper.dart';

@MappableClass(uniqueId: 'Box2')
class Box<T extends Content> with BoxMappable<T> {
  int size;
  T contents;

  Box(this.size, {required this.contents});
}

@MappableClass()
class Content with ContentMappable {
  final String data;

  Content(this.data);
}

void main() {
  group('duplicate names', () {
    var container = MapperContainer(linked: {
      BoxMapper.container,
      b.BoxMapper.container,
      b.ConfettiMapper.container,
    });

    test('Should encode generic objects', () {
      var boxA = container.toJson<dynamic>(Box(10, contents: Content('test')));
      var boxB = container
          .toJson<dynamic>(b.Box<b.Confetti>(10, contents: [b.Confetti('Rainbow')]));

      expect(boxA, equals('{"size":10,"contents":{"data":"test"},"__type":"Box2<Content>"}'));
      expect(boxB, equals('{"size":10,"contents":[{"color":"Rainbow"}],"__type":"Box<Confetti>"}'));

      var decA = container.fromJson(boxA);
      var decB = container.fromJson(boxB);

      expect(decA, isA<Box>());
      expect(decB, isA<b.Box<b.Confetti>>());
    });
  });
}
