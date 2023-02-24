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
  final MappingHook hook = const GameHook();
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
  GameCopyWith<$R, Game, $Out> get asGame =>
      base.as((v, t, t2) => _GameCopyWithImpl(v, t, t2));
}

typedef GameCopyWithBound = Game;

abstract class GameCopyWith<$R, $In extends Game, $Out extends Game>
    implements ObjectCopyWith<$R, $In, $Out> {
  GameCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Game>(
      Then<Game, $Out2> t, Then<$Out2, $R2> t2);
  PlayerCopyWith<$R, Player, Player> get player;
  $R call({Player? player});
}

class _GameCopyWithImpl<$R, $Out extends Game>
    extends CopyWithBase<$R, Game, $Out>
    implements GameCopyWith<$R, Game, $Out> {
  _GameCopyWithImpl(super.value, super.then, super.then2);
  @override
  GameCopyWith<$R2, Game, $Out2> chain<$R2, $Out2 extends Game>(
          Then<Game, $Out2> t, Then<$Out2, $R2> t2) =>
      _GameCopyWithImpl($value, t, t2);

  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.chain($identity, (v) => call(player: v));
  @override
  $R call({Player? player}) => $then(Game(player ?? $value.player));
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
          CardPlayerHook()
        ])),
  };

  @override
  final MappingHook superHook = const GameHook();

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
  CardGameCopyWith<$R, CardGame, $Out> get asCardGame =>
      base.as((v, t, t2) => _CardGameCopyWithImpl(v, t, t2));
}

typedef CardGameCopyWithBound = Game;

abstract class CardGameCopyWith<$R, $In extends CardGame, $Out extends Game>
    implements GameCopyWith<$R, $In, $Out> {
  CardGameCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Game>(
      Then<CardGame, $Out2> t, Then<$Out2, $R2> t2);
  @override
  PlayerCopyWith<$R, Player, Player> get player;
  @override
  $R call({Player? player});
}

class _CardGameCopyWithImpl<$R, $Out extends Game>
    extends CopyWithBase<$R, CardGame, $Out>
    implements CardGameCopyWith<$R, CardGame, $Out> {
  _CardGameCopyWithImpl(super.value, super.then, super.then2);
  @override
  CardGameCopyWith<$R2, CardGame, $Out2> chain<$R2, $Out2 extends Game>(
          Then<CardGame, $Out2> t, Then<$Out2, $R2> t2) =>
      _CardGameCopyWithImpl($value, t, t2);

  @override
  PlayerCopyWith<$R, Player, Player> get player =>
      $value.player.copyWith.chain($identity, (v) => call(player: v));
  @override
  $R call({Player? player}) => $then(CardGame(player ?? $value.player));
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
  PlayerCopyWith<$R, Player, $Out> get asPlayer =>
      base.as((v, t, t2) => _PlayerCopyWithImpl(v, t, t2));
}

typedef PlayerCopyWithBound = Player;

abstract class PlayerCopyWith<$R, $In extends Player, $Out extends Player>
    implements ObjectCopyWith<$R, $In, $Out> {
  PlayerCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Player>(
      Then<Player, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
}

class _PlayerCopyWithImpl<$R, $Out extends Player>
    extends CopyWithBase<$R, Player, $Out>
    implements PlayerCopyWith<$R, Player, $Out> {
  _PlayerCopyWithImpl(super.value, super.then, super.then2);
  @override
  PlayerCopyWith<$R2, Player, $Out2> chain<$R2, $Out2 extends Player>(
          Then<Player, $Out2> t, Then<$Out2, $R2> t2) =>
      _PlayerCopyWithImpl($value, t, t2);

  @override
  $R call({String? id}) => $then(Player(id ?? $value.id));
}

class ClothesMapper extends ClassMapperBase<Clothes> {
  ClothesMapper._();
  static ClothesMapper? _instance;
  static ClothesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClothesMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Clothes';

  static int _$size(Clothes v) => v.size;
  static Map<String, dynamic> _$unmappedProps(Clothes v) => v.unmappedProps;

  @override
  final Map<Symbol, Field<Clothes, dynamic>> fields = const {
    #size: Field<Clothes, int>('size', _$size),
    #unmappedProps: Field<Clothes, Map<String, dynamic>>(
        'unmappedProps', _$unmappedProps,
        opt: true, def: const {}),
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static Clothes _instantiate(DecodingData data) {
    return Clothes(data.get(#size), unmappedProps: data.get(#unmappedProps));
  }

  @override
  final Function instantiate = _instantiate;

  static Clothes fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Clothes>(map));
  }

  static Clothes fromJson(String json) {
    return _guard((c) => c.fromJson<Clothes>(json));
  }
}

mixin ClothesMappable {
  String toJson() {
    return ClothesMapper._guard((c) => c.toJson(this as Clothes));
  }

  Map<String, dynamic> toMap() {
    return ClothesMapper._guard((c) => c.toMap(this as Clothes));
  }

  ClothesCopyWith<Clothes, Clothes, Clothes> get copyWith =>
      _ClothesCopyWithImpl(this as Clothes, $identity, $identity);
  @override
  String toString() {
    return ClothesMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ClothesMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ClothesMapper._guard((c) => c.hash(this));
  }
}

extension ClothesValueCopy<$R, $Out extends Clothes>
    on ObjectCopyWith<$R, Clothes, $Out> {
  ClothesCopyWith<$R, Clothes, $Out> get asClothes =>
      base.as((v, t, t2) => _ClothesCopyWithImpl(v, t, t2));
}

typedef ClothesCopyWithBound = Clothes;

abstract class ClothesCopyWith<$R, $In extends Clothes, $Out extends Clothes>
    implements ObjectCopyWith<$R, $In, $Out> {
  ClothesCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Clothes>(
      Then<Clothes, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
}

class _ClothesCopyWithImpl<$R, $Out extends Clothes>
    extends CopyWithBase<$R, Clothes, $Out>
    implements ClothesCopyWith<$R, Clothes, $Out> {
  _ClothesCopyWithImpl(super.value, super.then, super.then2);
  @override
  ClothesCopyWith<$R2, Clothes, $Out2> chain<$R2, $Out2 extends Clothes>(
          Then<Clothes, $Out2> t, Then<$Out2, $R2> t2) =>
      _ClothesCopyWithImpl($value, t, t2);

  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get unmappedProps => MapCopyWith(
          $value.unmappedProps,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(unmappedProps: v));
  @override
  $R call({int? size, Map<String, dynamic>? unmappedProps}) =>
      $then(Clothes(size ?? $value.size,
          unmappedProps: unmappedProps ?? $value.unmappedProps));
}

class ComponentMapper extends ClassMapperBase<Component> {
  ComponentMapper._();
  static ComponentMapper? _instance;
  static ComponentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ComponentMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Component';

  static String _$id(Component v) => v.id;
  static Map<String, dynamic>? _$unmappedProps(Component v) => v.unmappedProps;
  static String _$name(Component v) => v.name;

  @override
  final Map<Symbol, Field<Component, dynamic>> fields = const {
    #id: Field<Component, String>('id', _$id),
    #unmappedProps: Field<Component, Map<String, dynamic>?>(
        'unmappedProps', _$unmappedProps),
    #name: Field<Component, String>('name', _$name),
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static Component _instantiate(DecodingData data) {
    return Component(data.get(#id), data.get(#unmappedProps), data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Component fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Component>(map));
  }

  static Component fromJson(String json) {
    return _guard((c) => c.fromJson<Component>(json));
  }
}

mixin ComponentMappable {
  String toJson() {
    return ComponentMapper._guard((c) => c.toJson(this as Component));
  }

  Map<String, dynamic> toMap() {
    return ComponentMapper._guard((c) => c.toMap(this as Component));
  }

  ComponentCopyWith<Component, Component, Component> get copyWith =>
      _ComponentCopyWithImpl(this as Component, $identity, $identity);
  @override
  String toString() {
    return ComponentMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ComponentMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ComponentMapper._guard((c) => c.hash(this));
  }
}

extension ComponentValueCopy<$R, $Out extends Component>
    on ObjectCopyWith<$R, Component, $Out> {
  ComponentCopyWith<$R, Component, $Out> get asComponent =>
      base.as((v, t, t2) => _ComponentCopyWithImpl(v, t, t2));
}

typedef ComponentCopyWithBound = Component;

abstract class ComponentCopyWith<$R, $In extends Component,
    $Out extends Component> implements ObjectCopyWith<$R, $In, $Out> {
  ComponentCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Component>(
      Then<Component, $Out2> t, Then<$Out2, $R2> t2);
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get unmappedProps;
  $R call({String? id, Map<String, dynamic>? unmappedProps, String? name});
}

class _ComponentCopyWithImpl<$R, $Out extends Component>
    extends CopyWithBase<$R, Component, $Out>
    implements ComponentCopyWith<$R, Component, $Out> {
  _ComponentCopyWithImpl(super.value, super.then, super.then2);
  @override
  ComponentCopyWith<$R2, Component, $Out2> chain<$R2, $Out2 extends Component>(
          Then<Component, $Out2> t, Then<$Out2, $R2> t2) =>
      _ComponentCopyWithImpl($value, t, t2);

  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get unmappedProps => $value.unmappedProps != null
          ? MapCopyWith(
              $value.unmappedProps!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(unmappedProps: v))
          : null;
  @override
  $R call({String? id, Object? unmappedProps = $none, String? name}) =>
      $then(Component(id ?? $value.id, or(unmappedProps, $value.unmappedProps),
          name ?? $value.name));
}
