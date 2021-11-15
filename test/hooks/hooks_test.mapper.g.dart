import 'package:dart_mappable/dart_mappable.dart';

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
  Game decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Game fromMap(Map<String, dynamic> map) => Game(map.get('player', hooks: const PlayerHooks()));

  @override Function get encoder => (Game v) => encode(v);
  dynamic encode(Game v) => toMap(v);
  Map<String, dynamic> toMap(Game g) => {'player': _toValue(g.player, hooks: const PlayerHooks())};

  @override String? stringify(Game self) => 'Game(player: ${Mapper.asString(self.player)})';
  @override int? hash(Game self) => Mapper.hash(self.player);
  @override bool? equals(Game self, Game other) => Mapper.isEqual(self.player, other.player);

  @override Function get typeFactory => (f) => f<Game>();
}

extension GameMapperExtension on Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GameCopyWith<Game> get copyWith => GameCopyWith(this, _$identity);
}

abstract class GameCopyWith<$R> {
  factory GameCopyWith(Game value, Then<Game, $R> then) = _GameCopyWithImpl<$R>;
  PlayerCopyWith<$R> get player;
  $R call({Player? player});
}

class _GameCopyWithImpl<$R> extends BaseCopyWith<Game, $R> implements GameCopyWith<$R> {
  _GameCopyWithImpl(Game value, Then<Game, $R> then) : super(value, then);

  @override PlayerCopyWith<$R> get player => PlayerCopyWith(_value.player, (v) => call(player: v));
  @override $R call({Player? player}) => _then(Game(player ?? _value.player));
}

class PlayerMapper extends BaseMapper<Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  Player decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
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
  PlayerCopyWith<Player> get copyWith => PlayerCopyWith(this, _$identity);
}

abstract class PlayerCopyWith<$R> {
  factory PlayerCopyWith(Player value, Then<Player, $R> then) = _PlayerCopyWithImpl<$R>;
  $R call({String? id});
}

class _PlayerCopyWithImpl<$R> extends BaseCopyWith<Player, $R> implements PlayerCopyWith<$R> {
  _PlayerCopyWithImpl(Player value, Then<Player, $R> then) : super(value, then);

  @override $R call({String? id}) => _then(Player(id ?? _value.id));
}

class ClothesMapper extends BaseMapper<Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  Clothes decode(dynamic v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Clothes fromMap(Map<String, dynamic> map) => Clothes(map.get('size'), unmappedProps: map.getMapOpt('unmapped_props') ?? const {});

  @override Function get encoder => (Clothes v) => encode(v);
  dynamic encode(Clothes v) => _hookedEncode<Clothes>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => toMap(v));
  Map<String, dynamic> toMap(Clothes c) => {'size': Mapper.toValue(c.size), 'unmapped_props': Mapper.toValue(c.unmappedProps)};

  @override String? stringify(Clothes self) => 'Clothes(size: ${Mapper.asString(self.size)}, unmappedProps: ${Mapper.asString(self.unmappedProps)})';
  @override int? hash(Clothes self) => Mapper.hash(self.size) ^ Mapper.hash(self.unmappedProps);
  @override bool? equals(Clothes self, Clothes other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.unmappedProps, other.unmappedProps);

  @override Function get typeFactory => (f) => f<Clothes>();
}

extension ClothesMapperExtension on Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ClothesCopyWith<Clothes> get copyWith => ClothesCopyWith(this, _$identity);
}

abstract class ClothesCopyWith<$R> {
  factory ClothesCopyWith(Clothes value, Then<Clothes, $R> then) = _ClothesCopyWithImpl<$R>;
  $R call({int? size, Map<String, dynamic>? unmappedProps});
}

class _ClothesCopyWithImpl<$R> extends BaseCopyWith<Clothes, $R> implements ClothesCopyWith<$R> {
  _ClothesCopyWithImpl(Clothes value, Then<Clothes, $R> then) : super(value, then);

  @override $R call({int? size, Map<String, dynamic>? unmappedProps}) => _then(Clothes(size ?? _value.size, unmappedProps: unmappedProps ?? _value.unmappedProps));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===


class _Mapper extends MapperContainer {
  _Mapper._() : super(_mappers);
}

class Mapper {
  Mapper._();

  static late _Mapper i = _Mapper._();

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) =>
      i.fromIterable<T>(iterable);
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

  @override
  String toString() => _mapper?.stringify(this) ?? super.toString();
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          (_mapper?.equals(this, other) ?? super == other));
  @override
  int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

final _checked = MapperContainer.checked;

T _hookedDecode<T>(MappingHooks hooks, dynamic value, T Function(dynamic value) fn) {
  var v = hooks.beforeDecode(value);
  if (v is! T) v = fn(v);
  return hooks.afterDecode(v) as T;
}
dynamic _hookedEncode<T>(MappingHooks hooks, T value, dynamic Function(T value) fn) {
  var v = hooks.beforeEncode(value);
  if (v is T) v = fn(v);
  return hooks.afterEncode(v);
}

dynamic _toValue(dynamic value, {MappingHooks? hooks}) {
  if (hooks == null) {
    return Mapper.toValue(value);
  } else {
    return hooks.afterEncode(Mapper.toValue(hooks.beforeEncode(value)));
  }
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.fromValue<T>(v);
  });

  T? getOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    }
    return Mapper.fromValue<T>(v);
  });

  List<T> getList<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  List<T>? getListOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  Map<K, V> getMap<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  Map<K, V>? getMapOpt<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  T hooked<T>(MappingHooks? hooks, String key, T Function(dynamic v) fn) {
    if (hooks == null) {
      return fn(this[key]);
    } else {
      return hooks.afterDecode(fn(hooks.beforeDecode(this[key]))) as T;
    }
  }
}

class _None { const _None(); }
const _none = _None();

T _$identity<T>(T value) => value;
typedef Then<$T, $R> = $R Function($T);

class BaseCopyWith<$T, $R> {
  BaseCopyWith(this._value, this._then);

  final $T _value;
  final Then<$T, $R> _then;
  
  T or<T>(Object? _v, T v) => _v == _none ? v : _v as T;
}

