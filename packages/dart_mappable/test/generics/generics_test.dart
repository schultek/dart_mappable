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

@MappableClass()
class Data {
  final String data;
  Data(this.data);
}

@MappableClass()
class SingleSetting<T> with Mappable {
  final List<T>? properties;

  const SingleSetting({
    this.properties,
  });
}

@MappableClass(hooks: MapHooksAfter())
class Settings with Mappable {
  final Map<String, SingleSetting>? settings;

  const Settings({
    this.settings,
  });
}

class MapHooksAfter extends MappingHooks {
  const MapHooksAfter();

  @override
  dynamic afterEncode(dynamic value) {
    return _toMap(value);
  }

  dynamic _toMap(dynamic value) {
    if (value is Map) {
      return value.map((k, v) => MapEntry(k as String, _toMap(v)));
    } else if (value is List) {
      return value.map(_toMap).toList();
    } else {
      return value;
    }
  }
}

void main() {
  group('Generic classes', () {
    test('Should encode generic objects', () {
      Box box = Box<Confetti>(10, contents: [Confetti('Rainbow')]);
      String boxJson = box.toJson();
      expect(
        boxJson,
        equals(
            '{"size":10,"contents":[{"color":"Rainbow"}],"__type":"Box<Confetti>"}'),
      );

      dynamic whatAmI = Mapper.fromJson(boxJson);
      expect(whatAmI.runtimeType, equals(type<Box<Confetti>>()));
    });

    test('Should keep type information', () {
      var settings = Settings(settings: {
        'counts': SingleSetting<int>(properties: [2, 3, 4]),
        'names': SingleSetting<String>(properties: ['Tom', 'Anna']),
        'data': SingleSetting<Data>(properties: [Data('1234')]),
      });

      var json = settings.toJson();
      expect(json, equals('{"settings":{"counts":{"properties":[2,3,4],"__type":"SingleSetting<int>"},"names":{"properties":["Tom","Anna"],"__type":"SingleSetting<String>"},"data":{"properties":[{"data":"1234"}],"__type":"SingleSetting<Data>"}}}'));

      Settings copied = Mapper.fromJson(json);

      expect(copied.settings!['counts'].runtimeType, equals(type<SingleSetting<int>>()));
      expect(copied.settings!['names'].runtimeType, equals(type<SingleSetting<String>>()));
      expect(copied.settings!['data'].runtimeType, equals(type<SingleSetting<Data>>()));
    });

    test('Generic type encodinng', () {
      var jsonA = Mapper.toJson(SingleSetting<int>(properties: [2, 3]));
      expect(jsonA, equals('{"properties":[2,3]}'));

      var jsonB = Mapper.toJson<dynamic>(SingleSetting<int>(properties: [1, 4]));
      expect(jsonB, equals('{"properties":[1,4],"__type":"SingleSetting<int>"}'));
    });
  });
}
