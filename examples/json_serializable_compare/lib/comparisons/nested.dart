import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

part 'nested.g.dart';
part 'nested.mapper.dart';

// === json_serializable ===

@JsonSerializable(explicitToJson: true)
class GameA {
  final PlayerA player;

  GameA({required this.player});

  // Required Boilerplate
  factory GameA.fromJson(Map<String, dynamic> json) =>
      _$GameAFromJson(json);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$GameAToJson(this);
}

@JsonSerializable()
class PlayerA {
  final String name;

  PlayerA({required this.name});

  // Required Boilerplate
  factory PlayerA.fromJson(Map<String, dynamic> json) =>
      _$PlayerAFromJson(json);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$PlayerAToJson(this);
}

// === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class GameB with GameBMappable {
  final PlayerB player;

  GameB({required this.player});
}

@MappableClass()
// Required Boilerplate (Mixin)
class PlayerB with PlayerBMappable {
  final String name;

  PlayerB({required this.name});
}

// === Comparison ===

void compareNested() {
  group('nested', () {
    test('decode from map', () {
      // json_serializable
      expect(
        GameA.fromJson({'player': {'name': 'Alice'}}),
        predicate<GameA>((p) => p.player.name == 'Alice'),
      );

      // dart_mappable
      expect(
        GameBMapper.fromMap({'player': {'name': 'Bob'}}),
        equals(GameB(player: PlayerB(name: 'Bob'))),
      );
    });

    test('encode to map', () {
      // json_serializable
      expect(
        GameA(player: PlayerA(name: 'Alice')).toJson(),
        equals({'player': {'name': 'Alice'}}),
      );

      // dart_mappable
      expect(
        GameB(player: PlayerB(name: 'Bob')).toMap(),
        equals({'player': {'name': 'Bob'}}),
      );
    });
  });
}
