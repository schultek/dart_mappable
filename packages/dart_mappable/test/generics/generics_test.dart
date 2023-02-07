import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'generics_test.mapper.dart';

@MappableClass()
class Box<T extends Content> with BoxMappable<T> {
  int size;
  List<T> contents;

  Box(this.size, {required this.contents});
}

@MappableClass()
class Confetti extends Content with ConfettiMappable {
  String color;
  Confetti(this.color);
}

@MappableClass()
class Content with ContentMappable {}

@MappableClass()
class Data with DataMappable {
  final String data;
  Data(this.data);
}

@MappableClass()
class SingleSetting<T> with SingleSettingMappable {
  final List<T>? properties;

  const SingleSetting({
    this.properties,
  });
}

@MappableClass(hook: MapHooksAfter())
class Settings with SettingsMappable {
  final Map<String, SingleSetting>? settings;

  const Settings({
    this.settings,
  });
}

class MapHooksAfter extends MappingHook {
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

@MappableClass()
class Asset<T> with AssetMappable {
  Asset({
    required this.data,
  });

  final T data;
}

void main() {
  group('Generic classes', () {
    test('Should encode generic objects', () {
      BoxMapper.ensureInitialized();
      ConfettiMapper.ensureInitialized();
      Box box = Box<Confetti>(10, contents: [Confetti('Rainbow')]);
      String boxJson = MapperContainer.globals.toJson(box);
      expect(
        boxJson,
        equals(
            '{"size":10,"contents":[{"color":"Rainbow"}],"__type":"Box<Confetti>"}'),
      );

      dynamic whatAmI = BoxMapper.fromJson(boxJson);
      expect(whatAmI.runtimeType, equals(type<Box<Confetti>>()));
    });

    test('Should keep type information', () {
      DataMapper.ensureInitialized();

      var settings = Settings(settings: {
        'counts': SingleSetting<int>(properties: [2, 3, 4]),
        'names': SingleSetting<String>(properties: ['Tom', 'Anna']),
        'data': SingleSetting<Data>(properties: [Data('1234')]),
      });

      var json = settings.toJson();
      expect(
          json,
          equals(
              '{"settings":{"counts":{"properties":[2,3,4],"__type":"SingleSetting<int>"},"names":{"properties":["Tom","Anna"],"__type":"SingleSetting<String>"},"data":{"properties":[{"data":"1234"}],"__type":"SingleSetting<Data>"}}}'));

      Settings copied = SettingsMapper.fromJson(json);

      expect(copied.settings!['counts'].runtimeType,
          equals(type<SingleSetting<int>>()));
      expect(copied.settings!['names'].runtimeType,
          equals(type<SingleSetting<String>>()));
      expect(copied.settings!['data'].runtimeType,
          equals(type<SingleSetting<Data>>()));
    });

    test('Generic type encoding', () {
      var jsonA = MapperContainer.globals
          .toJson(SingleSetting<int>(properties: [2, 3]));
      expect(jsonA, equals('{"properties":[2,3]}'));

      var jsonB = MapperContainer.globals
          .toJson<dynamic>(SingleSetting<int>(properties: [1, 4]));
      expect(
          jsonB, equals('{"properties":[1,4],"__type":"SingleSetting<int>"}'));
    });

    test('Nullable generic param', () {
      expect(
        AssetMapper.fromJson<dynamic>('{"data": null}').data,
        isNull,
      );

      expect(
        AssetMapper.fromJson<String?>('{"data": null}').data,
        isNull,
      );

      expect(
        () => AssetMapper.fromJson<String>('{"data": null}'),
        throwsMapperException(MapperException.chain(MapperMethod.decode,
            '(Asset<String>).data', MapperException.missingParameter('data'))),
      );
    });
  });
}
