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

  @override
  final String id = 'Game';

  static Player _$player(Game v) => v.player;
  static const Field<Game, Player> _f$player = Field('player', _$player,
      hook:
          ChainedHook([PlayerHook(), UnmappedPropertiesHook('unmappedProps')]));

  @override
  final Map<Symbol, Field<Game, dynamic>> fields = const {
    #player: _f$player,
  };

  @override
  final MappingHook hook = const game.GameHook();
  static Game _instantiate(DecodingData data) {
    return Game(data.dec(_f$player));
  }

  @override
  final Function instantiate = _instantiate;

  static Game fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Game>(map);
  }

  static Game fromJson(String json) {
    return ensureInitialized().decodeJson<Game>(json);
  }
}

mixin GameMappable {
  String toJson() {
    return GameMapper.ensureInitialized().encodeJson<Game>(this as Game);
  }

  Map<String, dynamic> toMap() {
    return GameMapper.ensureInitialized().encodeMap<Game>(this as Game);
  }

  GameCopyWith<Game, Game, Game> get copyWith =>
      _GameCopyWithImpl(this as Game, $identity, $identity);
  @override
  String toString() {
    return GameMapper.ensureInitialized().stringifyValue(this as Game);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GameMapper.ensureInitialized().isValueEqual(this as Game, other));
  }

  @override
  int get hashCode {
    return GameMapper.ensureInitialized().hashValue(this as Game);
  }
}

extension GameValueCopy<$R, $Out> on ObjectCopyWith<$R, Game, $Out> {
  GameCopyWith<$R, Game, $Out> get $asGame =>
      $base.as((v, t, t2) => _GameCopyWithImpl(v, t, t2));
}

abstract class GameCopyWith<$R, $In extends Game, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PlayerCopyWith<$R, Player, Player> get player;
  $R call({Player? player});
  GameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Game, $Out>
    implements GameCopyWith<$R, Game, $Out> {
  _GameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Game> $mapper = GameMapper.ensureInitialized();
  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.$chain((v) => call(player: v));
  @override
  $R call({Player? player}) =>
      $apply(FieldCopyWithData({if (player != null) #player: player}));
  @override
  Game $make(CopyWithData data) => Game(data.get(#player, or: $value.player));

  @override
  GameCopyWith<$R2, Game, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GameCopyWithImpl($value, $cast, t);
}

class CardGameMapper extends ClassMapperBase<CardGame> {
  CardGameMapper._();

  static CardGameMapper? _instance;
  static CardGameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CardGameMapper._());
      GameMapper.ensureInitialized();
      PlayerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CardGame';

  static Player _$player(CardGame v) => v.player;
  static const Field<CardGame, Player> _f$player = Field('player', _$player,
      hook: ChainedHook([
        PlayerHook(),
        UnmappedPropertiesHook('unmappedProps'),
        game.CardPlayerHook()
      ]));

  @override
  final Map<Symbol, Field<CardGame, dynamic>> fields = const {
    #player: _f$player,
  };

  @override
  final MappingHook superHook = const game.GameHook();

  static CardGame _instantiate(DecodingData data) {
    return CardGame(data.dec(_f$player));
  }

  @override
  final Function instantiate = _instantiate;

  static CardGame fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CardGame>(map);
  }

  static CardGame fromJson(String json) {
    return ensureInitialized().decodeJson<CardGame>(json);
  }
}

mixin CardGameMappable {
  String toJson() {
    return CardGameMapper.ensureInitialized()
        .encodeJson<CardGame>(this as CardGame);
  }

  Map<String, dynamic> toMap() {
    return CardGameMapper.ensureInitialized()
        .encodeMap<CardGame>(this as CardGame);
  }

  CardGameCopyWith<CardGame, CardGame, CardGame> get copyWith =>
      _CardGameCopyWithImpl(this as CardGame, $identity, $identity);
  @override
  String toString() {
    return CardGameMapper.ensureInitialized().stringifyValue(this as CardGame);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CardGameMapper.ensureInitialized()
                .isValueEqual(this as CardGame, other));
  }

  @override
  int get hashCode {
    return CardGameMapper.ensureInitialized().hashValue(this as CardGame);
  }
}

extension CardGameValueCopy<$R, $Out> on ObjectCopyWith<$R, CardGame, $Out> {
  CardGameCopyWith<$R, CardGame, $Out> get $asCardGame =>
      $base.as((v, t, t2) => _CardGameCopyWithImpl(v, t, t2));
}

abstract class CardGameCopyWith<$R, $In extends CardGame, $Out>
    implements GameCopyWith<$R, $In, $Out> {
  @override
  PlayerCopyWith<$R, Player, Player> get player;
  @override
  $R call({Player? player});
  CardGameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CardGameCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CardGame, $Out>
    implements CardGameCopyWith<$R, CardGame, $Out> {
  _CardGameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CardGame> $mapper =
      CardGameMapper.ensureInitialized();
  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.$chain((v) => call(player: v));
  @override
  $R call({Player? player}) =>
      $apply(FieldCopyWithData({if (player != null) #player: player}));
  @override
  CardGame $make(CopyWithData data) =>
      CardGame(data.get(#player, or: $value.player));

  @override
  CardGameCopyWith<$R2, CardGame, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CardGameCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Player';

  static String _$id(Player v) => v.id;
  static const Field<Player, String> _f$id = Field('id', _$id);

  @override
  final Map<Symbol, Field<Player, dynamic>> fields = const {
    #id: _f$id,
  };

  static Player _instantiate(DecodingData data) {
    return Player(data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static Player fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Player>(map);
  }

  static Player fromJson(String json) {
    return ensureInitialized().decodeJson<Player>(json);
  }
}

mixin PlayerMappable {
  String toJson() {
    return PlayerMapper.ensureInitialized().encodeJson<Player>(this as Player);
  }

  Map<String, dynamic> toMap() {
    return PlayerMapper.ensureInitialized().encodeMap<Player>(this as Player);
  }

  PlayerCopyWith<Player, Player, Player> get copyWith =>
      _PlayerCopyWithImpl(this as Player, $identity, $identity);
  @override
  String toString() {
    return PlayerMapper.ensureInitialized().stringifyValue(this as Player);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PlayerMapper.ensureInitialized()
                .isValueEqual(this as Player, other));
  }

  @override
  int get hashCode {
    return PlayerMapper.ensureInitialized().hashValue(this as Player);
  }
}

extension PlayerValueCopy<$R, $Out> on ObjectCopyWith<$R, Player, $Out> {
  PlayerCopyWith<$R, Player, $Out> get $asPlayer =>
      $base.as((v, t, t2) => _PlayerCopyWithImpl(v, t, t2));
}

abstract class PlayerCopyWith<$R, $In extends Player, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  PlayerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlayerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Player, $Out>
    implements PlayerCopyWith<$R, Player, $Out> {
  _PlayerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Player> $mapper = PlayerMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  Player $make(CopyWithData data) => Player(data.get(#id, or: $value.id));

  @override
  PlayerCopyWith<$R2, Player, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PlayerCopyWithImpl($value, $cast, t);
}
