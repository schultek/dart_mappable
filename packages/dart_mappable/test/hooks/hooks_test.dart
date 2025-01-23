import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'game_hooks.dart' as game;

part 'hooks_test.mapper.dart';

class PlayerHook extends MappingHook {
  const PlayerHook();

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

@MappableClass(hook: game.GameHook())
class Game with GameMappable {
  @MappableField(
    hook: ChainedHook([
      PlayerHook(),
      UnmappedPropertiesHook('unmappedProps'),
    ]),
  )
  Player player;

  Game(this.player);
}

@MappableClass()
class CardGame extends Game with CardGameMappable {
  CardGame(@MappableField(hook: game.CardPlayerHook()) super.player);
}

@MappableClass()
class Player with PlayerMappable {
  String id;
  Player(this.id);
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
}
