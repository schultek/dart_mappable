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
}

mixin GameMixin {
  GameCopyWith<p0.Game, p0.Game> get copyWith => _GameCopyWithImpl(this as p0.Game, $identity);
}

extension GameObjectCopy<$R> on ObjectCopyWith<$R, p0.Game> {
  GameCopyWith<$R, p0.Game> get asGame => chain(_GameCopyWithImpl.new);
}

abstract class GameCopyWith<$R, $V extends p0.Game> implements ObjectCopyWith<$R, $V> {
  PlayerCopyWith<$R> get player;
  $R call({p0.Player? player});
}

class _GameCopyWithImpl<$R> extends BaseCopyWith<p0.Game, $R> implements GameCopyWith<$R, p0.Game> {
  _GameCopyWithImpl(super.value, super.then);

  @override PlayerCopyWith<$R> get player => _PlayerCopyWithImpl($value.player, (v) => call(player: v));
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
}

mixin CardGameMixin {
  CardGameCopyWith<p0.CardGame> get copyWith => _CardGameCopyWithImpl(this as p0.CardGame, $identity);
}

extension CardGameObjectCopy<$R> on ObjectCopyWith<$R, p0.CardGame> {
  CardGameCopyWith<$R> get asCardGame => chain(_CardGameCopyWithImpl.new);
}

abstract class CardGameCopyWith<$R> implements GameCopyWith<$R, p0.CardGame> {
  @override PlayerCopyWith<$R> get player;
  @override $R call({p0.Player? player});
}

class _CardGameCopyWithImpl<$R> extends BaseCopyWith<p0.CardGame, $R> implements CardGameCopyWith<$R> {
  _CardGameCopyWithImpl(super.value, super.then);

  @override PlayerCopyWith<$R> get player => _PlayerCopyWithImpl($value.player, (v) => call(player: v));
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
  PlayerCopyWith<p0.Player> get copyWith => _PlayerCopyWithImpl(this, $identity);
}

extension PlayerObjectCopy<$R> on ObjectCopyWith<$R, p0.Player> {
  PlayerCopyWith<$R> get asPlayer => chain(_PlayerCopyWithImpl.new);
}

abstract class PlayerCopyWith<$R> implements ObjectCopyWith<$R, p0.Player> {
  $R call({String? id});
}

class _PlayerCopyWithImpl<$R> extends BaseCopyWith<p0.Player, $R> implements PlayerCopyWith<$R> {
  _PlayerCopyWithImpl(super.value, super.then);

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
  ClothesCopyWith<p0.Clothes> get copyWith => _ClothesCopyWithImpl(this, $identity);
}

extension ClothesObjectCopy<$R> on ObjectCopyWith<$R, p0.Clothes> {
  ClothesCopyWith<$R> get asClothes => chain(_ClothesCopyWithImpl.new);
}

abstract class ClothesCopyWith<$R> implements ObjectCopyWith<$R, p0.Clothes> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>> get unmappedProps;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
}

class _ClothesCopyWithImpl<$R> extends BaseCopyWith<p0.Clothes, $R> implements ClothesCopyWith<$R> {
  _ClothesCopyWithImpl(super.value, super.then);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>> get unmappedProps => MapCopyWith($value.unmappedProps, (v, t) => ObjectCopyWith(v, t), (v) => call(unmappedProps: v));
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
  ComponentCopyWith<p0.Component> get copyWith => _ComponentCopyWithImpl(this, $identity);
}

extension ComponentObjectCopy<$R> on ObjectCopyWith<$R, p0.Component> {
  ComponentCopyWith<$R> get asComponent => chain(_ComponentCopyWithImpl.new);
}

abstract class ComponentCopyWith<$R> implements ObjectCopyWith<$R, p0.Component> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>>? get unmappedProps;
  $R call({String? id, Map<String, dynamic>? unmappedProps, String? name});
}

class _ComponentCopyWithImpl<$R> extends BaseCopyWith<p0.Component, $R> implements ComponentCopyWith<$R> {
  _ComponentCopyWithImpl(super.value, super.then);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>>? get unmappedProps => $value.unmappedProps != null ? MapCopyWith($value.unmappedProps!, (v, t) => ObjectCopyWith(v, t), (v) => call(unmappedProps: v)) : null;
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
