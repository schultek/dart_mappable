import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'hooks_test.mapper.g.dart';
import 'more_hooks.dart';
import 'other_hooks.dart';

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
          [PlayerHooks(), UnmappedPropertiesHooks('unmapped_props')]))
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

@MappableClass(hooks: UnmappedPropertiesHooks('unmapped_props'))
class Clothes with ClothesMappable {
  int size;
  Map<String, dynamic> unmappedProps;

  Clothes(this.size, {this.unmappedProps = const {}});
}

@MappableClass(hooks: UnmappedPropertiesHooks('unmapped_props'))
class Component with ComponentMappable {
  String id;
  String name;

  Map<String, dynamic>? unmappedProps;

  Component(this.id, this.unmappedProps, this.name);
}

void main() {
  group('Hooks', () {
    test('Before Decode Hook', () {
      Game game = Mapper.fromJson('{"player": {"id": "Tom"}}');
      expect(game.player.id, equals('Tom'));

      Game game2 = Mapper.fromJson('{"player": "John"}');
      expect(game2.player.id, equals('John'));
    });

    test('After Encode Hook', () {
      var game = Game(Player('Tom'));
      expect(game.toJson(), equals('{"player":"Tom"}'));
    });

    test('Chained field hooks', () {
      var game = Mapper.fromMap<CardGame>({'player': 'Anna'});
      expect(game.player.id, equals('Anna-card'));
    });
  });

  group('Class Hooks', () {
    test('Unmapped Properties', () {
      Clothes clothes =
          Mapper.fromJson('{"size": 1, "color": "green",  "quality": 2}');
      expect(clothes.unmappedProps, equals({'color': 'green', 'quality': 2}));
      expect(
          clothes.toMap(), equals({'size': 1, 'color': 'green', 'quality': 2}));

      Component component =
          Mapper.fromJson('{"id": "some_id", "value": 3, "name": "my_comp"}');
      expect(component.unmappedProps, equals({'value': 3}));
      component.name = 'changed';
      expect(component.toMap(),
          equals({'id': 'some_id', 'name': 'changed', 'value': 3}));
    });
  });
}
