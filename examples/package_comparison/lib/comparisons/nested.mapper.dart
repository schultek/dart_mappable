// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'nested.dart';

class GameBMapper extends ClassMapperBase<GameB> {
  GameBMapper._();
  static GameBMapper? _instance;
  static GameBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameBMapper._());
      PlayerBMapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'GameB';

  static PlayerB _$player(GameB v) => v.player;

  @override
  final Map<Symbol, Field<GameB, dynamic>> fields = const {
    #player: Field<GameB, PlayerB>('player', _$player),
  };

  static GameB _instantiate(DecodingData data) {
    return GameB(player: data.get(#player));
  }
  @override
  final Function instantiate = _instantiate;

  static GameB fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<GameB>(map);
  }
  static GameB fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<GameB>(json);
  }
}

mixin GameBMappable {
  String toJson() {
    GameBMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as GameB);
  }
  Map<String, dynamic> toMap() {
    GameBMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as GameB);
  }
  GameBCopyWith<GameB, GameB, GameB> get copyWith => _GameBCopyWithImpl(this as GameB, $identity, $identity);
  @override
  String toString() {
    GameBMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    GameBMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    GameBMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension GameBValueCopy<$R, $Out extends GameB> on ObjectCopyWith<$R, GameB, $Out> {
  GameBCopyWith<$R, GameB, $Out> get asGameB => base.as((v, t, t2) => _GameBCopyWithImpl(v, t, t2));
}

typedef GameBCopyWithBound = GameB;
abstract class GameBCopyWith<$R, $In extends GameB, $Out extends GameB> implements ObjectCopyWith<$R, $In, $Out> {
  GameBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends GameB>(Then<GameB, $Out2> t, Then<$Out2, $R2> t2);
  PlayerBCopyWith<$R, PlayerB, PlayerB> get player;
  $R call({PlayerB? player});
}

class _GameBCopyWithImpl<$R, $Out extends GameB> extends CopyWithBase<$R, GameB, $Out> implements GameBCopyWith<$R, GameB, $Out> {
  _GameBCopyWithImpl(super.value, super.then, super.then2);
  @override GameBCopyWith<$R2, GameB, $Out2> chain<$R2, $Out2 extends GameB>(Then<GameB, $Out2> t, Then<$Out2, $R2> t2) => _GameBCopyWithImpl($value, t, t2);

  @override PlayerBCopyWith<$R, PlayerB, PlayerB> get player => $value.player.copyWith.chain($identity, (v) => call(player: v));
  @override $R call({PlayerB? player}) => $then(GameB(player: player ?? $value.player));
}

class PlayerBMapper extends ClassMapperBase<PlayerB> {
  PlayerBMapper._();
  static PlayerBMapper? _instance;
  static PlayerBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerBMapper._());
    }
    return _instance!;
  }
  @override
  final String id = 'PlayerB';

  static String _$name(PlayerB v) => v.name;

  @override
  final Map<Symbol, Field<PlayerB, dynamic>> fields = const {
    #name: Field<PlayerB, String>('name', _$name),
  };

  static PlayerB _instantiate(DecodingData data) {
    return PlayerB(name: data.get(#name));
  }
  @override
  final Function instantiate = _instantiate;

  static PlayerB fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<PlayerB>(map);
  }
  static PlayerB fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<PlayerB>(json);
  }
}

mixin PlayerBMappable {
  String toJson() {
    PlayerBMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as PlayerB);
  }
  Map<String, dynamic> toMap() {
    PlayerBMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as PlayerB);
  }
  PlayerBCopyWith<PlayerB, PlayerB, PlayerB> get copyWith => _PlayerBCopyWithImpl(this as PlayerB, $identity, $identity);
  @override
  String toString() {
    PlayerBMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    PlayerBMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    PlayerBMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension PlayerBValueCopy<$R, $Out extends PlayerB> on ObjectCopyWith<$R, PlayerB, $Out> {
  PlayerBCopyWith<$R, PlayerB, $Out> get asPlayerB => base.as((v, t, t2) => _PlayerBCopyWithImpl(v, t, t2));
}

typedef PlayerBCopyWithBound = PlayerB;
abstract class PlayerBCopyWith<$R, $In extends PlayerB, $Out extends PlayerB> implements ObjectCopyWith<$R, $In, $Out> {
  PlayerBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PlayerB>(Then<PlayerB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PlayerBCopyWithImpl<$R, $Out extends PlayerB> extends CopyWithBase<$R, PlayerB, $Out> implements PlayerBCopyWith<$R, PlayerB, $Out> {
  _PlayerBCopyWithImpl(super.value, super.then, super.then2);
  @override PlayerBCopyWith<$R2, PlayerB, $Out2> chain<$R2, $Out2 extends PlayerB>(Then<PlayerB, $Out2> t, Then<$Out2, $R2> t2) => _PlayerBCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(PlayerB(name: name ?? $value.name));
}
