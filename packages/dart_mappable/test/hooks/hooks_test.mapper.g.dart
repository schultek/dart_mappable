import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'hooks_test.dart' as p0;
import 'more_hooks.dart' as p1;
import 'other_hooks.dart' as p2;


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

class GameMapper extends BaseMapper<p0.Game> {
  GameMapper._();

  @override Function get decoder => decode;
  p0.Game decode(dynamic v) => const p1.GameHooks().decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  p0.Game fromMap(Map<String, dynamic> map) => p0.Game(Mapper.i.$get(map, 'player', const ChainedHooks( [p0.PlayerHooks(), UnmappedPropertiesHooks('unmapped_props')])));

  @override Function get encoder => encode;
  dynamic encode(p0.Game v) => const p1.GameHooks().encode<p0.Game>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(p0.Game g) => {'player': Mapper.i.$enc(g.player, 'player', const ChainedHooks( [p0.PlayerHooks(), UnmappedPropertiesHooks('unmapped_props')]))};

  @override String stringify(p0.Game self) => 'Game(player: ${Mapper.asString(self.player)})';
  @override int hash(p0.Game self) => Mapper.hash(self.player);
  @override bool equals(p0.Game self, p0.Game other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<p0.Game>();
}

extension GameMapperExtension on p0.Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GameCopyWith<p0.Game> get copyWith => GameCopyWith(this, $identity);
}

abstract class GameCopyWith<$R> {
  factory GameCopyWith(p0.Game value, Then<p0.Game, $R> then) = _GameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({p0.Player? player});
  $R apply(p0.Game Function(p0.Game) transform);
}

class _GameCopyWithImpl<$R> extends BaseCopyWith<p0.Game, $R> implements GameCopyWith<$R> {
  _GameCopyWithImpl(p0.Game value, Then<p0.Game, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith($value.player, (v) => call(player: v));
  @override $R call({p0.Player? player}) => $then(p0.Game(player ?? $value.player));
}

class CardGameMapper extends BaseMapper<p0.CardGame> {
  CardGameMapper._();

  @override Function get decoder => (v) => const p1.GameHooks().decode(v, decode);
  p0.CardGame decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.CardGame fromMap(Map<String, dynamic> map) => p0.CardGame(Mapper.i.$get(map, 'player', const ChainedHooks([p0.PlayerHooks(), UnmappedPropertiesHooks('unmapped_props'), p2.CardPlayerHooks()])));

  @override Function get encoder => (p0.CardGame v) => const p1.GameHooks().encode<p0.CardGame>(v, (v) => encode);
  dynamic encode(p0.CardGame v) => toMap(v);
  Map<String, dynamic> toMap(p0.CardGame c) => {'player': Mapper.i.$enc(c.player, 'player', const ChainedHooks([p0.PlayerHooks(), UnmappedPropertiesHooks('unmapped_props'), p2.CardPlayerHooks()]))};

  @override String stringify(p0.CardGame self) => 'CardGame(player: ${Mapper.asString(self.player)})';
  @override int hash(p0.CardGame self) => Mapper.hash(self.player);
  @override bool equals(p0.CardGame self, p0.CardGame other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<p0.CardGame>();
}

extension CardGameMapperExtension on p0.CardGame {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CardGameCopyWith<p0.CardGame> get copyWith => CardGameCopyWith(this, $identity);
}

abstract class CardGameCopyWith<$R> {
  factory CardGameCopyWith(p0.CardGame value, Then<p0.CardGame, $R> then) = _CardGameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({p0.Player? player});
  $R apply(p0.CardGame Function(p0.CardGame) transform);
}

class _CardGameCopyWithImpl<$R> extends BaseCopyWith<p0.CardGame, $R> implements CardGameCopyWith<$R> {
  _CardGameCopyWithImpl(p0.CardGame value, Then<p0.CardGame, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith($value.player, (v) => call(player: v));
  @override $R call({p0.Player? player}) => $then(p0.CardGame(player ?? $value.player));
}

class PlayerMapper extends BaseMapper<p0.Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  p0.Player decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Player fromMap(Map<String, dynamic> map) => p0.Player(Mapper.i.$get(map, 'id'));

  @override Function get encoder => encode;
  dynamic encode(p0.Player v) => toMap(v);
  Map<String, dynamic> toMap(p0.Player p) => {'id': Mapper.i.$enc(p.id, 'id')};

  @override String stringify(p0.Player self) => 'Player(id: ${Mapper.asString(self.id)})';
  @override int hash(p0.Player self) => Mapper.hash(self.id);
  @override bool equals(p0.Player self, p0.Player other) => Mapper.isEqual(self.id, other.id);

  @override Function get typeFactory => (f) => f<p0.Player>();
}

extension PlayerMapperExtension on p0.Player {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PlayerCopyWith<p0.Player> get copyWith => PlayerCopyWith(this, $identity);
}

abstract class PlayerCopyWith<$R> {
  factory PlayerCopyWith(p0.Player value, Then<p0.Player, $R> then) = _PlayerCopyWithImpl<$R>;
  $R call({String? id});
  $R apply(p0.Player Function(p0.Player) transform);
}

class _PlayerCopyWithImpl<$R> extends BaseCopyWith<p0.Player, $R> implements PlayerCopyWith<$R> {
  _PlayerCopyWithImpl(p0.Player value, Then<p0.Player, $R> then) : super(value, then);

  @override $R call({String? id}) => $then(p0.Player(id ?? $value.id));
}

class ClothesMapper extends BaseMapper<p0.Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  p0.Clothes decode(dynamic v) => const UnmappedPropertiesHooks('unmapped_props').decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  p0.Clothes fromMap(Map<String, dynamic> map) => p0.Clothes(Mapper.i.$get(map, 'size'), unmappedProps: Mapper.i.$getOpt(map, 'unmapped_props') ?? const {});

  @override Function get encoder => encode;
  dynamic encode(p0.Clothes v) => const UnmappedPropertiesHooks('unmapped_props').encode<p0.Clothes>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(p0.Clothes c) => {'size': Mapper.i.$enc(c.size, 'size'), 'unmapped_props': Mapper.i.$enc(c.unmappedProps, 'unmappedProps')};

  @override String stringify(p0.Clothes self) => 'Clothes(size: ${Mapper.asString(self.size)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int hash(p0.Clothes self) => Mapper.hash(self.size) ^ Mapper.hash(self.unmappedProps);
  @override bool equals(p0.Clothes self, p0.Clothes other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<p0.Clothes>();
}

extension ClothesMapperExtension on p0.Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ClothesCopyWith<p0.Clothes> get copyWith => ClothesCopyWith(this, $identity);
}

abstract class ClothesCopyWith<$R> {
  factory ClothesCopyWith(p0.Clothes value, Then<p0.Clothes, $R> then) = _ClothesCopyWithImpl<$R>;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
  $R apply(p0.Clothes Function(p0.Clothes) transform);
}

class _ClothesCopyWithImpl<$R> extends BaseCopyWith<p0.Clothes, $R> implements ClothesCopyWith<$R> {
  _ClothesCopyWithImpl(p0.Clothes value, Then<p0.Clothes, $R> then) : super(value, then);

  @override $R call({int? size, Map<String, dynamic>? unmappedProps}) => $then(p0.Clothes(size ?? $value.size, unmappedProps: unmappedProps ?? $value.unmappedProps));
}

class ComponentMapper extends BaseMapper<p0.Component> {
  ComponentMapper._();

  @override Function get decoder => decode;
  p0.Component decode(dynamic v) => const UnmappedPropertiesHooks('unmapped_props').decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  p0.Component fromMap(Map<String, dynamic> map) => p0.Component(Mapper.i.$get(map, 'id'), Mapper.i.$getOpt(map, 'unmapped_props'), Mapper.i.$get(map, 'name'));

  @override Function get encoder => encode;
  dynamic encode(p0.Component v) => const UnmappedPropertiesHooks('unmapped_props').encode<p0.Component>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(p0.Component c) => {'id': Mapper.i.$enc(c.id, 'id'), 'unmapped_props': Mapper.i.$enc(c.unmappedProps, 'unmappedProps'), 'name': Mapper.i.$enc(c.name, 'name')};

  @override String stringify(p0.Component self) => 'Component(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int hash(p0.Component self) => Mapper.hash(self.id) ^ Mapper.hash(self.name) ^ Mapper.hash(self.unmappedProps);
  @override bool equals(p0.Component self, p0.Component other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<p0.Component>();
}

extension ComponentMapperExtension on p0.Component {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ComponentCopyWith<p0.Component> get copyWith => ComponentCopyWith(this, $identity);
}

abstract class ComponentCopyWith<$R> {
  factory ComponentCopyWith(p0.Component value, Then<p0.Component, $R> then) = _ComponentCopyWithImpl<$R>;
  $R call({String? id, Map<String, dynamic>? unmappedProps, String? name});
  $R apply(p0.Component Function(p0.Component) transform);
}

class _ComponentCopyWithImpl<$R> extends BaseCopyWith<p0.Component, $R> implements ComponentCopyWith<$R> {
  _ComponentCopyWithImpl(p0.Component value, Then<p0.Component, $R> then) : super(value, then);

  @override $R call({String? id, Object? unmappedProps = $none, String? name}) => $then(p0.Component(id ?? $value.id, or(unmappedProps, $value.unmappedProps), name ?? $value.name));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

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
