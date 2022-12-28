// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'nested.dart';

class GameBMapper extends MapperBase<GameB> {
  static MapperContainer container = MapperContainer(
    mappers: {GameBMapper()},
  )..linkAll({PlayerBMapper.container});

  @override
  GameBMapperElement createElement(MapperContainer container) {
    return GameBMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<GameB>;
  static final fromJson = container.fromJson<GameB>;
}

class GameBMapperElement extends MapperElementBase<GameB> {
  GameBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  GameB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  GameB fromMap(Map<String, dynamic> map) =>
      GameB(player: container.$get(map, 'player'));

  @override
  Function get encoder => encode;
  dynamic encode(GameB v) => toMap(v);
  Map<String, dynamic> toMap(GameB g) =>
      {'player': container.$enc(g.player, 'player')};

  @override
  String stringify(GameB self) =>
      'GameB(player: ${container.asString(self.player)})';
  @override
  int hash(GameB self) => container.hash(self.player);
  @override
  bool equals(GameB self, GameB other) =>
      container.isEqual(self.player, other.player);
}

mixin GameBMappable {
  String toJson() => GameBMapper.container.toJson(this as GameB);
  Map<String, dynamic> toMap() => GameBMapper.container.toMap(this as GameB);
  GameBCopyWith<GameB, GameB, GameB> get copyWith =>
      _GameBCopyWithImpl(this as GameB, $identity, $identity);
  @override
  String toString() => GameBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          GameBMapper.container.isEqual(this, other));
  @override
  int get hashCode => GameBMapper.container.hash(this);
}

extension GameBValueCopy<$R, $Out extends GameB>
    on ObjectCopyWith<$R, GameB, $Out> {
  GameBCopyWith<$R, GameB, $Out> get asGameB =>
      base.as((v, t, t2) => _GameBCopyWithImpl(v, t, t2));
}

typedef GameBCopyWithBound = GameB;

abstract class GameBCopyWith<$R, $In extends GameB, $Out extends GameB>
    implements ObjectCopyWith<$R, $In, $Out> {
  GameBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends GameB>(
      Then<GameB, $Out2> t, Then<$Out2, $R2> t2);
  PlayerBCopyWith<$R, PlayerB, PlayerB> get player;
  $R call({PlayerB? player});
}

class _GameBCopyWithImpl<$R, $Out extends GameB>
    extends CopyWithBase<$R, GameB, $Out>
    implements GameBCopyWith<$R, GameB, $Out> {
  _GameBCopyWithImpl(super.value, super.then, super.then2);
  @override
  GameBCopyWith<$R2, GameB, $Out2> chain<$R2, $Out2 extends GameB>(
          Then<GameB, $Out2> t, Then<$Out2, $R2> t2) =>
      _GameBCopyWithImpl($value, t, t2);

  @override
  PlayerBCopyWith<$R, PlayerB, PlayerB> get player =>
      $value.player.copyWith.chain($identity, (v) => call(player: v));
  @override
  $R call({PlayerB? player}) => $then(GameB(player: player ?? $value.player));
}

class PlayerBMapper extends MapperBase<PlayerB> {
  static MapperContainer container = MapperContainer(
    mappers: {PlayerBMapper()},
  );

  @override
  PlayerBMapperElement createElement(MapperContainer container) {
    return PlayerBMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<PlayerB>;
  static final fromJson = container.fromJson<PlayerB>;
}

class PlayerBMapperElement extends MapperElementBase<PlayerB> {
  PlayerBMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  PlayerB decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  PlayerB fromMap(Map<String, dynamic> map) =>
      PlayerB(name: container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(PlayerB v) => toMap(v);
  Map<String, dynamic> toMap(PlayerB p) =>
      {'name': container.$enc(p.name, 'name')};

  @override
  String stringify(PlayerB self) =>
      'PlayerB(name: ${container.asString(self.name)})';
  @override
  int hash(PlayerB self) => container.hash(self.name);
  @override
  bool equals(PlayerB self, PlayerB other) =>
      container.isEqual(self.name, other.name);
}

mixin PlayerBMappable {
  String toJson() => PlayerBMapper.container.toJson(this as PlayerB);
  Map<String, dynamic> toMap() =>
      PlayerBMapper.container.toMap(this as PlayerB);
  PlayerBCopyWith<PlayerB, PlayerB, PlayerB> get copyWith =>
      _PlayerBCopyWithImpl(this as PlayerB, $identity, $identity);
  @override
  String toString() => PlayerBMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PlayerBMapper.container.isEqual(this, other));
  @override
  int get hashCode => PlayerBMapper.container.hash(this);
}

extension PlayerBValueCopy<$R, $Out extends PlayerB>
    on ObjectCopyWith<$R, PlayerB, $Out> {
  PlayerBCopyWith<$R, PlayerB, $Out> get asPlayerB =>
      base.as((v, t, t2) => _PlayerBCopyWithImpl(v, t, t2));
}

typedef PlayerBCopyWithBound = PlayerB;

abstract class PlayerBCopyWith<$R, $In extends PlayerB, $Out extends PlayerB>
    implements ObjectCopyWith<$R, $In, $Out> {
  PlayerBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PlayerB>(
      Then<PlayerB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PlayerBCopyWithImpl<$R, $Out extends PlayerB>
    extends CopyWithBase<$R, PlayerB, $Out>
    implements PlayerBCopyWith<$R, PlayerB, $Out> {
  _PlayerBCopyWithImpl(super.value, super.then, super.then2);
  @override
  PlayerBCopyWith<$R2, PlayerB, $Out2> chain<$R2, $Out2 extends PlayerB>(
          Then<PlayerB, $Out2> t, Then<$Out2, $R2> t2) =>
      _PlayerBCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(PlayerB(name: name ?? $value.name));
}
