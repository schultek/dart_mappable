import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'hooks_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  GameMapper._(),
  CardGameMapper._(),
  PlayerMapper._(),
  ClothesMapper._(),
  ComponentMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class GameMapper extends BaseMapper<Game> {
  GameMapper._();

  @override Function get decoder => decode;
  Game decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Game fromMap(Map<String, dynamic> map) => Game(Mapper.i.$get(map, 'player', const PlayerHooks()));

  @override Function get encoder => (Game v) => encode(v);
  dynamic encode(Game v) {
    if (v is CardGame) { return CardGameMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(Game g) => {'player': Mapper.i.$enc(g.player, 'player', const PlayerHooks())};

  @override String stringify(Game self) => 'Game(player: ${Mapper.asString(self.player)})';
  @override int hash(Game self) => Mapper.hash(self.player);
  @override bool equals(Game self, Game other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<Game>();
}

extension GameMapperExtension  on Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GameCopyWith<Game> get copyWith => GameCopyWith(this, $identity);
}

abstract class GameCopyWith<$R> {
  factory GameCopyWith(Game value, Then<Game, $R> then) = _GameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({Player? player});
  $R apply(Game Function(Game) transform);
}

class _GameCopyWithImpl<$R> extends BaseCopyWith<Game, $R> implements GameCopyWith<$R> {
  _GameCopyWithImpl(Game value, Then<Game, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith($value.player, (v) => call(player: v));
  @override $R call({Player? player}) => $then(Game(player ?? $value.player));
}

class CardGameMapper extends BaseMapper<CardGame> {
  CardGameMapper._();

  @override Function get decoder => decode;
  CardGame decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CardGame fromMap(Map<String, dynamic> map) => CardGame(Mapper.i.$get(map, 'player', const ChainedHooks([PlayerHooks(), CardPlayerHooks()])));

  @override Function get encoder => (CardGame v) => encode(v);
  dynamic encode(CardGame v) => toMap(v);
  Map<String, dynamic> toMap(CardGame c) => {'player': Mapper.i.$enc(c.player, 'player', const ChainedHooks([PlayerHooks(), CardPlayerHooks()]))};

  @override String stringify(CardGame self) => 'CardGame(player: ${Mapper.asString(self.player)})';
  @override int hash(CardGame self) => Mapper.hash(self.player);
  @override bool equals(CardGame self, CardGame other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<CardGame>();
}

extension CardGameMapperExtension  on CardGame {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CardGameCopyWith<CardGame> get copyWith => CardGameCopyWith(this, $identity);
}

abstract class CardGameCopyWith<$R> {
  factory CardGameCopyWith(CardGame value, Then<CardGame, $R> then) = _CardGameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({Player? player});
  $R apply(CardGame Function(CardGame) transform);
}

class _CardGameCopyWithImpl<$R> extends BaseCopyWith<CardGame, $R> implements CardGameCopyWith<$R> {
  _CardGameCopyWithImpl(CardGame value, Then<CardGame, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith($value.player, (v) => call(player: v));
  @override $R call({Player? player}) => $then(CardGame(player ?? $value.player));
}

class PlayerMapper extends BaseMapper<Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  Player decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Player fromMap(Map<String, dynamic> map) => Player(Mapper.i.$get(map, 'id'));

  @override Function get encoder => (Player v) => encode(v);
  dynamic encode(Player v) => toMap(v);
  Map<String, dynamic> toMap(Player p) => {'id': Mapper.i.$enc(p.id, 'id')};

  @override String stringify(Player self) => 'Player(id: ${Mapper.asString(self.id)})';
  @override int hash(Player self) => Mapper.hash(self.id);
  @override bool equals(Player self, Player other) => Mapper.isEqual(self.id, other.id);

  @override Function get typeFactory => (f) => f<Player>();
}

extension PlayerMapperExtension  on Player {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PlayerCopyWith<Player> get copyWith => PlayerCopyWith(this, $identity);
}

abstract class PlayerCopyWith<$R> {
  factory PlayerCopyWith(Player value, Then<Player, $R> then) = _PlayerCopyWithImpl<$R>;
  $R call({String? id});
  $R apply(Player Function(Player) transform);
}

class _PlayerCopyWithImpl<$R> extends BaseCopyWith<Player, $R> implements PlayerCopyWith<$R> {
  _PlayerCopyWithImpl(Player value, Then<Player, $R> then) : super(value, then);

  @override $R call({String? id}) => $then(Player(id ?? $value.id));
}

class ClothesMapper extends BaseMapper<Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  Clothes decode(dynamic v) => const UnmappedPropertiesHooks('unmapped_props').decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Clothes fromMap(Map<String, dynamic> map) => Clothes(Mapper.i.$get(map, 'size'), unmappedProps: Mapper.i.$getOpt(map, 'unmapped_props') ?? const {});

  @override Function get encoder => (Clothes v) => encode(v);
  dynamic encode(Clothes v) => const UnmappedPropertiesHooks('unmapped_props').encode<Clothes>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(Clothes c) => {'size': Mapper.i.$enc(c.size, 'size'), 'unmapped_props': Mapper.i.$enc(c.unmappedProps, 'unmappedProps')};

  @override String stringify(Clothes self) => 'Clothes(size: ${Mapper.asString(self.size)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int hash(Clothes self) => Mapper.hash(self.size) ^ Mapper.hash(self.unmappedProps);
  @override bool equals(Clothes self, Clothes other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<Clothes>();
}

extension ClothesMapperExtension  on Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ClothesCopyWith<Clothes> get copyWith => ClothesCopyWith(this, $identity);
}

abstract class ClothesCopyWith<$R> {
  factory ClothesCopyWith(Clothes value, Then<Clothes, $R> then) = _ClothesCopyWithImpl<$R>;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
  $R apply(Clothes Function(Clothes) transform);
}

class _ClothesCopyWithImpl<$R> extends BaseCopyWith<Clothes, $R> implements ClothesCopyWith<$R> {
  _ClothesCopyWithImpl(Clothes value, Then<Clothes, $R> then) : super(value, then);

  @override $R call({int? size, Map<String, dynamic>? unmappedProps}) => $then(Clothes(size ?? $value.size, unmappedProps: unmappedProps ?? $value.unmappedProps));
}

class ComponentMapper extends BaseMapper<Component> {
  ComponentMapper._();

  @override Function get decoder => decode;
  Component decode(dynamic v) => const UnmappedPropertiesHooks('unmapped_props').decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Component fromMap(Map<String, dynamic> map) => Component(Mapper.i.$get(map, 'id'), Mapper.i.$getOpt(map, 'unmapped_props'), Mapper.i.$get(map, 'name'));

  @override Function get encoder => (Component v) => encode(v);
  dynamic encode(Component v) => const UnmappedPropertiesHooks('unmapped_props').encode<Component>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(Component c) => {'id': Mapper.i.$enc(c.id, 'id'), 'unmapped_props': Mapper.i.$enc(c.unmappedProps, 'unmappedProps'), 'name': Mapper.i.$enc(c.name, 'name')};

  @override String stringify(Component self) => 'Component(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int hash(Component self) => Mapper.hash(self.id) ^ Mapper.hash(self.name) ^ Mapper.hash(self.unmappedProps);
  @override bool equals(Component self, Component other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<Component>();
}

extension ComponentMapperExtension  on Component {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ComponentCopyWith<Component> get copyWith => ComponentCopyWith(this, $identity);
}

abstract class ComponentCopyWith<$R> {
  factory ComponentCopyWith(Component value, Then<Component, $R> then) = _ComponentCopyWithImpl<$R>;
  $R call({String? id, Map<String, dynamic>? unmappedProps, String? name});
  $R apply(Component Function(Component) transform);
}

class _ComponentCopyWithImpl<$R> extends BaseCopyWith<Component, $R> implements ComponentCopyWith<$R> {
  _ComponentCopyWithImpl(Component value, Then<Component, $R> then) : super(value, then);

  @override $R call({String? id, Object? unmappedProps = $none, String? name}) => $then(Component(id ?? $value.id, or(unmappedProps, $value.unmappedProps), name ?? $value.name));
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

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
