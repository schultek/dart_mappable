// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'hooks_test.dart';

class GameMapper extends MapperBase<Game> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {GameMapper()},
      ))
        ..linkAll({CardGameMapper.container, PlayerMapper.container}));

  @override
  GameMapperElement createElement(MapperContainer container) {
    return GameMapperElement._(this, container);
  }

  @override
  String get id => 'Game';

  static final fromMap = container.fromMap<Game>;
  static final fromJson = container.fromJson<Game>;
}

class GameMapperElement extends MapperElementBase<Game> {
  GameMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Game decode(dynamic v) => const GameHook().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  Game fromMap(Map<String, dynamic> map) => Game(container.$get(
      map,
      'player',
      const ChainedHook(
          [PlayerHook(), UnmappedPropertiesHook('unmappedProps')])));

  @override
  Function get encoder => encode;
  dynamic encode(Game v) =>
      const GameHook().encode<Game>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Game g) => {
        'player': container.$enc(
            g.player,
            'player',
            const ChainedHook(
                [PlayerHook(), UnmappedPropertiesHook('unmappedProps')]))
      };

  @override
  String stringify(Game self) =>
      'Game(player: ${container.asString(self.player)})';
  @override
  int hash(Game self) => container.hash(self.player);
  @override
  bool equals(Game self, Game other) =>
      container.isEqual(self.player, other.player);
}

mixin GameMappable {
  String toJson() => GameMapper.container.toJson(this as Game);
  Map<String, dynamic> toMap() => GameMapper.container.toMap(this as Game);
  GameCopyWith<Game, Game, Game> get copyWith =>
      _GameCopyWithImpl(this as Game, $identity, $identity);
  @override
  String toString() => GameMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          GameMapper.container.isEqual(this, other));
  @override
  int get hashCode => GameMapper.container.hash(this);
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

class CardGameMapper extends MapperBase<CardGame> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CardGameMapper()},
      ))
        ..linkAll({GameMapper.container, PlayerMapper.container}));

  @override
  CardGameMapperElement createElement(MapperContainer container) {
    return CardGameMapperElement._(this, container);
  }

  @override
  String get id => 'CardGame';

  static final fromMap = container.fromMap<CardGame>;
  static final fromJson = container.fromJson<CardGame>;
}

class CardGameMapperElement extends MapperElementBase<CardGame> {
  CardGameMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => (v) => const GameHook().decode(v, decode, container);
  CardGame decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CardGame fromMap(Map<String, dynamic> map) => CardGame(container.$get(
      map,
      'player',
      const ChainedHook([
        PlayerHook(),
        UnmappedPropertiesHook('unmappedProps'),
        CardPlayerHook()
      ])));

  @override
  Function get encoder => (CardGame v) =>
      const GameHook().encode<CardGame>(v, (v) => encode, container);
  dynamic encode(CardGame v) => toMap(v);
  Map<String, dynamic> toMap(CardGame c) => {
        'player': container.$enc(
            c.player,
            'player',
            const ChainedHook([
              PlayerHook(),
              UnmappedPropertiesHook('unmappedProps'),
              CardPlayerHook()
            ]))
      };

  @override
  String stringify(CardGame self) =>
      'CardGame(player: ${container.asString(self.player)})';
  @override
  int hash(CardGame self) => container.hash(self.player);
  @override
  bool equals(CardGame self, CardGame other) =>
      container.isEqual(self.player, other.player);
}

mixin CardGameMappable {
  String toJson() => CardGameMapper.container.toJson(this as CardGame);
  Map<String, dynamic> toMap() =>
      CardGameMapper.container.toMap(this as CardGame);
  CardGameCopyWith<CardGame, CardGame, CardGame> get copyWith =>
      _CardGameCopyWithImpl(this as CardGame, $identity, $identity);
  @override
  String toString() => CardGameMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CardGameMapper.container.isEqual(this, other));
  @override
  int get hashCode => CardGameMapper.container.hash(this);
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

class PlayerMapper extends MapperBase<Player> {
  static MapperContainer container = MapperContainer(
    mappers: {PlayerMapper()},
  );

  @override
  PlayerMapperElement createElement(MapperContainer container) {
    return PlayerMapperElement._(this, container);
  }

  @override
  String get id => 'Player';

  static final fromMap = container.fromMap<Player>;
  static final fromJson = container.fromJson<Player>;
}

class PlayerMapperElement extends MapperElementBase<Player> {
  PlayerMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Player decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Player fromMap(Map<String, dynamic> map) => Player(container.$get(map, 'id'));

  @override
  Function get encoder => encode;
  dynamic encode(Player v) => toMap(v);
  Map<String, dynamic> toMap(Player p) => {'id': container.$enc(p.id, 'id')};

  @override
  String stringify(Player self) => 'Player(id: ${container.asString(self.id)})';
  @override
  int hash(Player self) => container.hash(self.id);
  @override
  bool equals(Player self, Player other) =>
      container.isEqual(self.id, other.id);
}

mixin PlayerMappable {
  String toJson() => PlayerMapper.container.toJson(this as Player);
  Map<String, dynamic> toMap() => PlayerMapper.container.toMap(this as Player);
  PlayerCopyWith<Player, Player, Player> get copyWith =>
      _PlayerCopyWithImpl(this as Player, $identity, $identity);
  @override
  String toString() => PlayerMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PlayerMapper.container.isEqual(this, other));
  @override
  int get hashCode => PlayerMapper.container.hash(this);
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

class ClothesMapper extends MapperBase<Clothes> {
  static MapperContainer container = MapperContainer(
    mappers: {ClothesMapper()},
  );

  @override
  ClothesMapperElement createElement(MapperContainer container) {
    return ClothesMapperElement._(this, container);
  }

  @override
  String get id => 'Clothes';

  static final fromMap = container.fromMap<Clothes>;
  static final fromJson = container.fromJson<Clothes>;
}

class ClothesMapperElement extends MapperElementBase<Clothes> {
  ClothesMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Clothes decode(dynamic v) =>
      const UnmappedPropertiesHook('unmappedProps').decode(
          v,
          (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
          container);
  Clothes fromMap(Map<String, dynamic> map) =>
      Clothes(container.$get(map, 'size'),
          unmappedProps: container.$getOpt(map, 'unmappedProps') ?? const {});

  @override
  Function get encoder => encode;
  dynamic encode(Clothes v) => const UnmappedPropertiesHook('unmappedProps')
      .encode<Clothes>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Clothes c) => {
        'size': container.$enc(c.size, 'size'),
        'unmappedProps': container.$enc(c.unmappedProps, 'unmappedProps')
      };

  @override
  String stringify(Clothes self) =>
      'Clothes(size: ${container.asString(self.size)}, unmappedProps: ${container.asString(self.unmappedProps)})';
  @override
  int hash(Clothes self) =>
      container.hash(self.size) ^ container.hash(self.unmappedProps);
  @override
  bool equals(Clothes self, Clothes other) =>
      container.isEqual(self.size, other.size) &&
      container.isEqual(self.unmappedProps, other.unmappedProps);
}

mixin ClothesMappable {
  String toJson() => ClothesMapper.container.toJson(this as Clothes);
  Map<String, dynamic> toMap() =>
      ClothesMapper.container.toMap(this as Clothes);
  ClothesCopyWith<Clothes, Clothes, Clothes> get copyWith =>
      _ClothesCopyWithImpl(this as Clothes, $identity, $identity);
  @override
  String toString() => ClothesMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ClothesMapper.container.isEqual(this, other));
  @override
  int get hashCode => ClothesMapper.container.hash(this);
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

class ComponentMapper extends MapperBase<Component> {
  static MapperContainer container = MapperContainer(
    mappers: {ComponentMapper()},
  );

  @override
  ComponentMapperElement createElement(MapperContainer container) {
    return ComponentMapperElement._(this, container);
  }

  @override
  String get id => 'Component';

  static final fromMap = container.fromMap<Component>;
  static final fromJson = container.fromJson<Component>;
}

class ComponentMapperElement extends MapperElementBase<Component> {
  ComponentMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Component decode(dynamic v) =>
      const UnmappedPropertiesHook('unmappedProps').decode(
          v,
          (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
          container);
  Component fromMap(Map<String, dynamic> map) => Component(
      container.$get(map, 'id'),
      container.$getOpt(map, 'unmappedProps'),
      container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(Component v) => const UnmappedPropertiesHook('unmappedProps')
      .encode<Component>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Component c) => {
        'id': container.$enc(c.id, 'id'),
        'unmappedProps': container.$enc(c.unmappedProps, 'unmappedProps'),
        'name': container.$enc(c.name, 'name')
      };

  @override
  String stringify(Component self) =>
      'Component(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, unmappedProps: ${container.asString(self.unmappedProps)})';
  @override
  int hash(Component self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.unmappedProps);
  @override
  bool equals(Component self, Component other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.unmappedProps, other.unmappedProps);
}

mixin ComponentMappable {
  String toJson() => ComponentMapper.container.toJson(this as Component);
  Map<String, dynamic> toMap() =>
      ComponentMapper.container.toMap(this as Component);
  ComponentCopyWith<Component, Component, Component> get copyWith =>
      _ComponentCopyWithImpl(this as Component, $identity, $identity);
  @override
  String toString() => ComponentMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ComponentMapper.container.isEqual(this, other));
  @override
  int get hashCode => ComponentMapper.container.hash(this);
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
