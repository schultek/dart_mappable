import 'package:dart_mappable/internals.dart';

import 'hooks_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  GameMapper._(),
  PlayerMapper._(),
  ClothesMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class GameMapper extends BaseMapper<Game> {
  GameMapper._();

  @override Function get decoder => decode;
  Game decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Game fromMap(Map<String, dynamic> map) => Game(map.get('player', hooks: const PlayerHooks()));

  @override Function get encoder => (Game v) => encode(v);
  dynamic encode(Game v) => toMap(v);
  Map<String, dynamic> toMap(Game g) => {'player': const PlayerHooks().encode(g.player, Mapper.toValue)};

  @override String? stringify(Game self) => 'Game(player: ${Mapper.asString(self.player)})';
  @override int? hash(Game self) => Mapper.hash(self.player);
  @override bool? equals(Game self, Game other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<Game>();
}

extension GameMapperExtension on Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GameCopyWith<Game> get copyWith => GameCopyWith(this, $identity);
}

abstract class GameCopyWith<$R> {
  factory GameCopyWith(Game value, Then<Game, $R> then) = _GameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({Player? player});
}

class _GameCopyWithImpl<$R> extends BaseCopyWith<Game, $R> implements GameCopyWith<$R> {
  _GameCopyWithImpl(Game value, Then<Game, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith($value.player, (v) => call(player: v));
  @override $R call({Player? player}) => $then(Game(player ?? $value.player));
}

class PlayerMapper extends BaseMapper<Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  Player decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Player fromMap(Map<String, dynamic> map) => Player(map.get('id'));

  @override Function get encoder => (Player v) => encode(v);
  dynamic encode(Player v) => toMap(v);
  Map<String, dynamic> toMap(Player p) => {'id': Mapper.toValue(p.id)};

  @override String? stringify(Player self) => 'Player(id: ${Mapper.asString(self.id)})';
  @override int? hash(Player self) => Mapper.hash(self.id);
  @override bool? equals(Player self, Player other) => Mapper.isEqual(self.id, other.id);

  @override Function get typeFactory => (f) => f<Player>();
}

extension PlayerMapperExtension on Player {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PlayerCopyWith<Player> get copyWith => PlayerCopyWith(this, $identity);
}

abstract class PlayerCopyWith<$R> {
  factory PlayerCopyWith(Player value, Then<Player, $R> then) = _PlayerCopyWithImpl<$R>;
  $R call({String? id});
}

class _PlayerCopyWithImpl<$R> extends BaseCopyWith<Player, $R> implements PlayerCopyWith<$R> {
  _PlayerCopyWithImpl(Player value, Then<Player, $R> then) : super(value, then);

  @override $R call({String? id}) => $then(Player(id ?? $value.id));
}

class ClothesMapper extends BaseMapper<Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  Clothes decode(dynamic v) => const UnmappedPropertiesHooks('unmapped_props').decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Clothes fromMap(Map<String, dynamic> map) => Clothes(map.get('size'), unmappedProps: map.getOpt('unmapped_props') ?? const {});

  @override Function get encoder => (Clothes v) => encode(v);
  dynamic encode(Clothes v) => const UnmappedPropertiesHooks('unmapped_props').encode<Clothes>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(Clothes c) => {'size': Mapper.toValue(c.size), 'unmapped_props': Mapper.toValue(c.unmappedProps)};

  @override String? stringify(Clothes self) => 'Clothes(size: ${Mapper.asString(self.size)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int? hash(Clothes self) => Mapper.hash(self.size) ^ Mapper.hash(self.unmappedProps);
  @override bool? equals(Clothes self, Clothes other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<Clothes>();
}

extension ClothesMapperExtension on Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ClothesCopyWith<Clothes> get copyWith => ClothesCopyWith(this, $identity);
}

abstract class ClothesCopyWith<$R> {
  factory ClothesCopyWith(Clothes value, Then<Clothes, $R> then) = _ClothesCopyWithImpl<$R>;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
}

class _ClothesCopyWithImpl<$R> extends BaseCopyWith<Clothes, $R> implements ClothesCopyWith<$R> {
  _ClothesCopyWithImpl(Clothes value, Then<Clothes, $R> then) : super(value, then);

  @override $R call({int? size, Map<String, dynamic>? unmappedProps}) => $then(Clothes(size ?? $value.size, unmappedProps: unmappedProps ?? $value.unmappedProps));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static late MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable {
  BaseMapper? get _mapper => Mapper.get(runtimeType);

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) ||
      (runtimeType == other.runtimeType && (_mapper?.equals(this, other) 
      ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => _getOr(
      key, hooks, () => throw MapperException('Parameter $key is required.'));

  T? getOpt<T>(String key, {MappingHooks? hooks}) =>
      _getOr(key, hooks, () => null);

  T _getOr<T>(String key, MappingHooks? hooks, T Function() or) =>
      hooks.decode(this[key], (v) => v == null ? or() : Mapper.fromValue<T>(v));
}
