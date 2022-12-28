import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'more_hooks.dart';
import 'other_hooks.dart';

part 'hooks_test.mapper.dart';

class PlayerHooks extends MappingHooks {
  const PlayerHooks();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is String) {
      return {'id': value};
    }
    return value;
  }

  @override
  dynamic afterEncode(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value['id'];
    }
    return value;
  }
}

@MappableClass(hooks: GameHooks())
class Game with GameMappable {
  @MappableField(
      hooks: ChainedHooks(
          [PlayerHooks(), UnmappedPropertiesHooks('unmappedProps')]))
  Player player;

  Game(this.player);
}

@MappableClass()
class CardGame extends Game with CardGameMappable {
  CardGame(@MappableField(hooks: CardPlayerHooks()) Player player)
      : super(player);
}

@MappableClass()
class Player with PlayerMappable {
  String id;
  Player(this.id);
}

@MappableClass(hooks: UnmappedPropertiesHooks('unmappedProps'))
class Clothes with ClothesMappable {
  int size;
  Map<String, dynamic> unmappedProps;

  Clothes(this.size, {this.unmappedProps = const {}});
}

@MappableClass(hooks: UnmappedPropertiesHooks('unmappedProps'))
class Component with ComponentMappable {
  String id;
  String name;

  Map<String, dynamic>? unmappedProps;

  Component(this.id, this.unmappedProps, this.name);
}

void main() {
  group('hooks', () {
    test('apply before decode', () {
      Game game = GameMapper.fromJson('{"player": {"id": "Tom"}}');
      expect(game.player.id, equals('Tom'));

      Game game2 = GameMapper.fromJson('{"player": "John"}');
      expect(game2.player.id, equals('John'));
    });

    test('apply after encode', () {
      var game = Game(Player('Tom'));
      expect(game.toJson(), equals('{"player":"Tom"}'));
    });

    test('chained field hooks', () {
      var game = CardGameMapper.fromMap({'player': 'Anna'});
      expect(game.player.id, equals('Anna-card'));
    });
  });

  group('default hooks', () {
    test('unmapped properties', () {
      var clothes = ClothesMapper.fromJson(
          '{"size": 1, "color": "green",  "quality": 2}');
      expect(clothes.unmappedProps, equals({'color': 'green', 'quality': 2}));
      expect(
          clothes.toMap(), equals({'size': 1, 'color': 'green', 'quality': 2}));

      var component = ComponentMapper.fromJson(
          '{"id": "some_id", "value": 3, "name": "my_comp"}');
      expect(component.unmappedProps, equals({'value': 3}));
      component.name = 'changed';
      expect(component.toMap(),
          equals({'id': 'some_id', 'name': 'changed', 'value': 3}));
    });
  });
}
