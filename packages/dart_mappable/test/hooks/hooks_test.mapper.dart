// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'hooks_test.dart';

class GameMapper extends ClassMapperBase<Game> {
  GameMapper._();
  static GameMapper? _instance;
  static GameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameMapper._());
      CardGameMapper.ensureInitialized();
      PlayerMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Game';

  static Player _$player(Game v) => v.player;

  @override
  final Map<Symbol, Field<Game, dynamic>> fields = const {
    #player: Field<Game, Player>('player', _$player,
        hook: ChainedHook(
            [PlayerHook(), UnmappedPropertiesHook('unmappedProps')])),
  };

  @override
  final MappingHook hook = const game.GameHook();
  static Game _instantiate(DecodingData data) {
    return Game(data.get(#player));
  }

  @override
  final Function instantiate = _instantiate;

  static Game fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Game>(map));
  }

  static Game fromJson(String json) {
    return _guard((c) => c.fromJson<Game>(json));
  }
}

mixin GameMappable {
  String toJson() {
    return GameMapper._guard((c) => c.toJson(this as Game));
  }

  Map<String, dynamic> toMap() {
    return GameMapper._guard((c) => c.toMap(this as Game));
  }

  GameCopyWith<Game, Game, Game> get copyWith =>
      _GameCopyWithImpl(this as Game, $identity, $identity);
  @override
  String toString() {
    return GameMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GameMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return GameMapper._guard((c) => c.hash(this));
  }
}

extension GameValueCopy<$R, $Out extends Game>
    on ObjectCopyWith<$R, Game, $Out> {
  GameCopyWith<$R, Game, $Out> get $asGame =>
      $base.as((v, t, t2) => _GameCopyWithImpl(v, t, t2));
}

typedef GameCopyWithBound = Game;

abstract class GameCopyWith<$R, $In extends Game, $Out extends Game>
    implements ClassCopyWith<$R, $In, $Out> {
  PlayerCopyWith<$R, Player, Player> get player;
  $R call({Player? player});
  GameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Game>(
      Then<Game, $Out2> t, Then<$Out2, $R2> t2);
}

class _GameCopyWithImpl<$R, $Out extends Game>
    extends ClassCopyWithBase<$R, Game, $Out>
    implements GameCopyWith<$R, Game, $Out> {
  _GameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Game> $mapper = GameMapper.ensureInitialized();
  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.$chain($identity, (v) => call(player: v));
  @override
  $R call({Player? player}) =>
      $apply(FieldCopyWithData({if (player != null) #player: player}));
  @override
  Game $make(CopyWithData data) => Game(data.get(#player, or: $value.player));

  @override
  GameCopyWith<$R2, Game, $Out2> $chain<$R2, $Out2 extends Game>(
          Then<Game, $Out2> t, Then<$Out2, $R2> t2) =>
      _GameCopyWithImpl($value, t, t2);
}

class CardGameMapper extends ClassMapperBase<CardGame> {
  CardGameMapper._();
  static CardGameMapper? _instance;
  static CardGameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CardGameMapper._());
      PlayerMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CardGame';

  static Player _$player(CardGame v) => v.player;

  @override
  final Map<Symbol, Field<CardGame, dynamic>> fields = const {
    #player: Field<CardGame, Player>('player', _$player,
        hook: ChainedHook([
          PlayerHook(),
          UnmappedPropertiesHook('unmappedProps'),
          game.CardPlayerHook()
        ])),
  };

  @override
  final MappingHook superHook = const game.GameHook();

  static CardGame _instantiate(DecodingData data) {
    return CardGame(data.get(#player));
  }

  @override
  final Function instantiate = _instantiate;

  static CardGame fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CardGame>(map));
  }

  static CardGame fromJson(String json) {
    return _guard((c) => c.fromJson<CardGame>(json));
  }
}

mixin CardGameMappable {
  String toJson() {
    return CardGameMapper._guard((c) => c.toJson(this as CardGame));
  }

  Map<String, dynamic> toMap() {
    return CardGameMapper._guard((c) => c.toMap(this as CardGame));
  }

  CardGameCopyWith<CardGame, CardGame, CardGame> get copyWith =>
      _CardGameCopyWithImpl(this as CardGame, $identity, $identity);
  @override
  String toString() {
    return CardGameMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CardGameMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CardGameMapper._guard((c) => c.hash(this));
  }
}

extension CardGameValueCopy<$R, $Out extends Game>
    on ObjectCopyWith<$R, CardGame, $Out> {
  CardGameCopyWith<$R, CardGame, $Out> get $asCardGame =>
      $base.as((v, t, t2) => _CardGameCopyWithImpl(v, t, t2));
}

typedef CardGameCopyWithBound = Game;

abstract class CardGameCopyWith<$R, $In extends CardGame, $Out extends Game>
    implements GameCopyWith<$R, $In, $Out> {
  @override
  PlayerCopyWith<$R, Player, Player> get player;
  @override
  $R call({Player? player});
  CardGameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Game>(
      Then<CardGame, $Out2> t, Then<$Out2, $R2> t2);
}

class _CardGameCopyWithImpl<$R, $Out extends Game>
    extends ClassCopyWithBase<$R, CardGame, $Out>
    implements CardGameCopyWith<$R, CardGame, $Out> {
  _CardGameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CardGame> $mapper =
      CardGameMapper.ensureInitialized();
  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.$chain($identity, (v) => call(player: v));
  @override
  $R call({Player? player}) =>
      $apply(FieldCopyWithData({if (player != null) #player: player}));
  @override
  CardGame $make(CopyWithData data) =>
      CardGame(data.get(#player, or: $value.player));

  @override
  CardGameCopyWith<$R2, CardGame, $Out2> $chain<$R2, $Out2 extends Game>(
          Then<CardGame, $Out2> t, Then<$Out2, $R2> t2) =>
      _CardGameCopyWithImpl($value, t, t2);
}

class PlayerMapper extends ClassMapperBase<Player> {
  PlayerMapper._();
  static PlayerMapper? _instance;
  static PlayerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Player';

  static String _$id(Player v) => v.id;

  @override
  final Map<Symbol, Field<Player, dynamic>> fields = const {
    #id: Field<Player, String>('id', _$id),
  };

  static Player _instantiate(DecodingData data) {
    return Player(data.get(#id));
  }

  @override
  final Function instantiate = _instantiate;

  static Player fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Player>(map));
  }

  static Player fromJson(String json) {
    return _guard((c) => c.fromJson<Player>(json));
  }
}

mixin PlayerMappable {
  String toJson() {
    return PlayerMapper._guard((c) => c.toJson(this as Player));
  }

  Map<String, dynamic> toMap() {
    return PlayerMapper._guard((c) => c.toMap(this as Player));
  }

  PlayerCopyWith<Player, Player, Player> get copyWith =>
      _PlayerCopyWithImpl(this as Player, $identity, $identity);
  @override
  String toString() {
    return PlayerMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PlayerMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PlayerMapper._guard((c) => c.hash(this));
  }
}

extension PlayerValueCopy<$R, $Out extends Player>
    on ObjectCopyWith<$R, Player, $Out> {
  PlayerCopyWith<$R, Player, $Out> get $asPlayer =>
      $base.as((v, t, t2) => _PlayerCopyWithImpl(v, t, t2));
}

typedef PlayerCopyWithBound = Player;

abstract class PlayerCopyWith<$R, $In extends Player, $Out extends Player>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  PlayerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Player>(
      Then<Player, $Out2> t, Then<$Out2, $R2> t2);
}

class _PlayerCopyWithImpl<$R, $Out extends Player>
    extends ClassCopyWithBase<$R, Player, $Out>
    implements PlayerCopyWith<$R, Player, $Out> {
  _PlayerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Player> $mapper = PlayerMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  Player $make(CopyWithData data) => Player(data.get(#id, or: $value.id));

  @override
  PlayerCopyWith<$R2, Player, $Out2> $chain<$R2, $Out2 extends Player>(
          Then<Player, $Out2> t, Then<$Out2, $R2> t2) =>
      _PlayerCopyWithImpl($value, t, t2);
}
