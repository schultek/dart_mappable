import 'dart:collection';
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import 'models/custom.dart';
import 'models/external.dart';
import 'models/inheritance.dart';
import 'models/model.dart';
import 'models/polymorphism.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <String, BaseMapper>{
  // primitive mappers
  _typeOf<dynamic>():  PrimitiveMapper((dynamic v) => v),
  _typeOf<String>():   PrimitiveMapper<String>((dynamic v) => v.toString()),
  _typeOf<int>():      PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  _typeOf<double>():   PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  _typeOf<num>():      PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  _typeOf<bool>():     PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  _typeOf<DateTime>(): DateTimeMapper(),
  _typeOf<List>():     IterableMapper<List>(<T>(Iterable<T> i) => i.toList(), <T>(f) => f<List<T>>()),
  _typeOf<Set>():      IterableMapper<Set>(<T>(Iterable<T> i) => i.toSet(), <T>(f) => f<Set<T>>()),
  _typeOf<Map>():      MapMapper<Map>(<K, V>(Map<K, V> map) => map, <K, V>(f) => f<Map<K, V>>()),
  // class mappers
  _typeOf<Animal>(): AnimalMapper._(),
  _typeOf<Cat>(): CatMapper._(),
  _typeOf<Dog>(): DogMapper._(),
  _typeOf<NullAnimal>(): NullAnimalMapper._(),
  _typeOf<DefaultAnimal>(): DefaultAnimalMapper._(),
  _typeOf<MyPrivateClass>(): MyPrivateClassMapper._(),
  _typeOf<Person>(): PersonMapper._(),
  _typeOf<ProjectConfig>(): ProjectConfigMapper._(),
  _typeOf<Car>(): CarMapper._(),
  _typeOf<Box>(): BoxMapper._(),
  _typeOf<Confetti>(): ConfettiMapper._(),
  _typeOf<Game>(): GameMapper._(),
  _typeOf<Player>(): PlayerMapper._(),
  _typeOf<CheckBoard>(): CheckBoardMapper._(),
  _typeOf<Clothes>(): ClothesMapper._(),
  _typeOf<SummerClothes>(): SummerClothesMapper._(),
  _typeOf<TShirt>(): TShirtMapper._(),
  _typeOf<Jeans>(): JeansMapper._(),
  _typeOf<Shorts>(): ShortsMapper._(),
  _typeOf<Top>(): TopMapper._(),
  _typeOf<GenericBox>(): GenericBoxMapper._(),
  // enum mappers
  _typeOf<Brand>(): EnumMapper<Brand>(BrandMapper.fromString, (Brand b) => b.toStringValue()),
  // custom mappers
  _typeOf<HashMap>(): HashMapMapper(),
  _typeOf<MyPrivateClass>(): PrivateClassMapper(),
  _typeOf<GenericBox>(): CustomGenericMapper(),
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  Animal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      case Animal.Dog: return DogMapper._().decode(map);
      case null: return NullAnimalMapper._().decode(map);
      default: return DefaultAnimalMapper._().decode(map);
    }
  });
  Animal fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class Animal, did you forgot to specify a subclass for [ type: '${map['type']}' ] or a default subclass?");

  @override Function get encoder => (Animal v) => encode(v);
  dynamic encode(Animal v) {
    if (v is Cat) { return CatMapper._().encode(v); }
    else if (v is Dog) { return DogMapper._().encode(v); }
    else if (v is NullAnimal) { return NullAnimalMapper._().encode(v); }
    else if (v is DefaultAnimal) { return DefaultAnimalMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(Animal a) => {'name': Mapper.toValue(a.name)};

  @override String? stringify(Animal self) => 'Animal(name: ${self.name})';
  @override int? hash(Animal self) => self.name.hashCode;
  @override bool? equals(Animal self, Animal other) => self.name == other.name;

  @override Function get typeFactory => (f) => f<Animal>();
}

extension AnimalMapperExtension on Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CatMapper extends BaseMapper<Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  Cat decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(map.get('name'), map.get('color'));

  @override Function get encoder => (Cat v) => encode(v);
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': Mapper.toValue(c.name), 'color': Mapper.toValue(c.color), 'type': 'Cat'};

  @override String? stringify(Cat self) => 'Cat(name: ${self.name}, color: ${self.color})';
  @override int? hash(Cat self) => self.name.hashCode ^ self.color.hashCode;
  @override bool? equals(Cat self, Cat other) => self.name == other.name && self.color == other.color;

  @override Function get typeFactory => (f) => f<Cat>();
}

extension CatMapperExtension on Cat {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Cat copyWith({String? name, String? color}) => Cat(name ?? this.name, color ?? this.color);
}

class DogMapper extends BaseMapper<Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  Dog decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(map.get('name'), map.get('age'));

  @override Function get encoder => (Dog v) => encode(v);
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {'name': Mapper.toValue(d.name), 'age': Mapper.toValue(d.age), 'type': Animal.Dog};

  @override String? stringify(Dog self) => 'Dog(name: ${self.name}, age: ${self.age})';
  @override int? hash(Dog self) => self.name.hashCode ^ self.age.hashCode;
  @override bool? equals(Dog self, Dog other) => self.name == other.name && self.age == other.age;

  @override Function get typeFactory => (f) => f<Dog>();
}

extension DogMapperExtension on Dog {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Dog copyWith({String? name, int? age}) => Dog(name ?? this.name, age ?? this.age);
}

class NullAnimalMapper extends BaseMapper<NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  NullAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  NullAnimal fromMap(Map<String, dynamic> map) => NullAnimal(map.get('name'));

  @override Function get encoder => (NullAnimal v) => encode(v);
  dynamic encode(NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(NullAnimal n) => {'name': Mapper.toValue(n.name), 'type': null};

  @override String? stringify(NullAnimal self) => 'NullAnimal(name: ${self.name})';
  @override int? hash(NullAnimal self) => self.name.hashCode;
  @override bool? equals(NullAnimal self, NullAnimal other) => self.name == other.name;

  @override Function get typeFactory => (f) => f<NullAnimal>();
}

extension NullAnimalMapperExtension on NullAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NullAnimal copyWith({String? name}) => NullAnimal(name ?? this.name);
}

class DefaultAnimalMapper extends BaseMapper<DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  DefaultAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  DefaultAnimal fromMap(Map<String, dynamic> map) => DefaultAnimal(map.get('name'), map.get('type'));

  @override Function get encoder => (DefaultAnimal v) => encode(v);
  dynamic encode(DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(DefaultAnimal d) => {'name': Mapper.toValue(d.name), 'type': Mapper.toValue(d.type)};

  @override String? stringify(DefaultAnimal self) => 'DefaultAnimal(name: ${self.name}, type: ${self.type})';
  @override int? hash(DefaultAnimal self) => self.name.hashCode ^ self.type.hashCode;
  @override bool? equals(DefaultAnimal self, DefaultAnimal other) => self.name == other.name && self.type == other.type;

  @override Function get typeFactory => (f) => f<DefaultAnimal>();
}

extension DefaultAnimalMapperExtension on DefaultAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DefaultAnimal copyWith({String? name, String? type}) => DefaultAnimal(name ?? this.name, type ?? this.type);
}

class MyPrivateClassMapper extends BaseMapper<MyPrivateClass> {
  MyPrivateClassMapper._();

  @override Function get decoder => decode;
  MyPrivateClass decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  MyPrivateClass fromMap(Map<String, dynamic> map) => MyPrivateClass();

  @override Function get encoder => (MyPrivateClass v) => encode(v);
  dynamic encode(MyPrivateClass v) => toMap(v);
  Map<String, dynamic> toMap(MyPrivateClass m) => {};

  @override String? stringify(MyPrivateClass self) => 'MyPrivateClass()';
  @override int? hash(MyPrivateClass self) => 0;
  @override bool? equals(MyPrivateClass self, MyPrivateClass other) => true;

  @override Function get typeFactory => (f) => f<MyPrivateClass>();
}

extension MyPrivateClassMapperExtension on MyPrivateClass {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MyPrivateClass copy() => MyPrivateClass();
}

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(map.get('name'), age: map.getOpt('age') ?? 18, car: map.getOpt('car'));

  @override Function get encoder => (Person v) => encode(v);
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': Mapper.toValue(p.name), 'age': Mapper.toValue(p.age), 'car': Mapper.toValue(p.car)};

  @override String? stringify(Person self) => 'Person(name: ${self.name}, age: ${self.age}, car: ${self.car})';
  @override int? hash(Person self) => self.name.hashCode ^ self.age.hashCode ^ self.car.hashCode;
  @override bool? equals(Person self, Person other) => self.name == other.name && self.age == other.age && self.car == other.car;

  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonMapperExtension on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Person copyWith({String? name, int? age, Car? car}) => Person(name ?? this.name, age: age ?? this.age, car: car ?? this.car);
}

class ProjectConfigMapper extends BaseMapper<ProjectConfig> {
  ProjectConfigMapper._();

  @override Function get decoder => decode;
  ProjectConfig decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  ProjectConfig fromMap(Map<String, dynamic> map) => ProjectConfig(taskFilter: map.getListOpt('task_filter') ?? const [], taskDetailsFilter: map.getListOpt('task_details_filter') ?? const []);

  @override Function get encoder => (ProjectConfig v) => encode(v);
  dynamic encode(ProjectConfig v) => toMap(v);
  Map<String, dynamic> toMap(ProjectConfig p) => {'task_filter': Mapper.toValue(p.taskFilter), 'task_details_filter': Mapper.toValue(p.taskDetailsFilter)};

  @override String? stringify(ProjectConfig self) => 'ProjectConfig(taskFilter: ${self.taskFilter}, taskDetailsFilter: ${self.taskDetailsFilter})';
  @override int? hash(ProjectConfig self) => self.taskFilter.hashCode ^ self.taskDetailsFilter.hashCode;
  @override bool? equals(ProjectConfig self, ProjectConfig other) => self.taskFilter == other.taskFilter && self.taskDetailsFilter == other.taskDetailsFilter;

  @override Function get typeFactory => (f) => f<ProjectConfig>();
}

extension ProjectConfigMapperExtension on ProjectConfig {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ProjectConfig copyWith({List<String>? taskFilter, List<String>? taskDetailsFilter}) => ProjectConfig(taskFilter: taskFilter ?? this.taskFilter, taskDetailsFilter: taskDetailsFilter ?? this.taskDetailsFilter);
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(map.get('driven_km'), map.get('brand'));

  @override Function get encoder => (Car v) => encode(v);
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'driven_km': Mapper.toValue(c.drivenKm), 'brand': Mapper.toValue(c.brand)};

  @override String? stringify(Car self) => 'Car(miles: ${self.miles}, brand: ${self.brand})';
  @override int? hash(Car self) => self.drivenKm.hashCode ^ self.brand.hashCode;
  @override bool? equals(Car self, Car other) => self.drivenKm == other.drivenKm && self.brand == other.brand;

  @override Function get typeFactory => (f) => f<Car>();
}

extension CarMapperExtension on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class BoxMapper extends BaseMapper<Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  Box<T> decode<T extends Object>(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T extends Object>(Map<String, dynamic> map) => Box(map.get('size'), content: map.get('content'));

  @override Function get encoder => (Box v) => encode(v);
  dynamic encode(Box v) => toMap(v);
  Map<String, dynamic> toMap(Box b) => {'size': Mapper.toValue(b.size), 'content': Mapper.toValue(b.content)};

  @override String? stringify(Box self) => 'Box(size: ${self.size}, content: ${self.content})';
  @override int? hash(Box self) => self.size.hashCode ^ self.content.hashCode;
  @override bool? equals(Box self, Box other) => self.size == other.size && self.content == other.content;

  @override Function get typeFactory => <T extends Object>(f) => f<Box<T>>();
}

extension BoxMapperExtension<T extends Object> on Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Box<T> copyWith({int? size, T? content}) => Box(size ?? this.size, content: content ?? this.content);
}

class ConfettiMapper extends BaseMapper<Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  Confetti decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) => Confetti(map.get('color'));

  @override Function get encoder => (Confetti v) => encode(v);
  dynamic encode(Confetti v) => toMap(v);
  Map<String, dynamic> toMap(Confetti c) => {'color': Mapper.toValue(c.color)};

  @override String? stringify(Confetti self) => 'Confetti(color: ${self.color})';
  @override int? hash(Confetti self) => self.color.hashCode;
  @override bool? equals(Confetti self, Confetti other) => self.color == other.color;

  @override Function get typeFactory => (f) => f<Confetti>();
}

extension ConfettiMapperExtension on Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Confetti copyWith({String? color}) => Confetti(color ?? this.color);
}

class GameMapper extends BaseMapper<Game> {
  GameMapper._();

  @override Function get decoder => decode;
  Game decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Game fromMap(Map<String, dynamic> map) => Game(map.get('player', hooks: const PlayerHooks()));

  @override Function get encoder => (Game v) => encode(v);
  dynamic encode(Game v) => toMap(v);
  Map<String, dynamic> toMap(Game g) => {'player': _toValue(g.player, hooks: const PlayerHooks())};

  @override String? stringify(Game self) => 'Game(player: ${self.player})';
  @override int? hash(Game self) => self.player.hashCode;
  @override bool? equals(Game self, Game other) => self.player == other.player;

  @override Function get typeFactory => (f) => f<Game>();
}

extension GameMapperExtension on Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Game copyWith({Player? player}) => Game(player ?? this.player);
}

class PlayerMapper extends BaseMapper<Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  Player decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Player fromMap(Map<String, dynamic> map) => Player(map.get('id'));

  @override Function get encoder => (Player v) => encode(v);
  dynamic encode(Player v) => toMap(v);
  Map<String, dynamic> toMap(Player p) => {'id': Mapper.toValue(p.id)};

  @override String? stringify(Player self) => 'Player(id: ${self.id})';
  @override int? hash(Player self) => self.id.hashCode;
  @override bool? equals(Player self, Player other) => self.id == other.id;

  @override Function get typeFactory => (f) => f<Player>();
}

extension PlayerMapperExtension on Player {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Player copyWith({String? id}) => Player(id ?? this.id);
}

class CheckBoardMapper extends BaseMapper<CheckBoard> {
  CheckBoardMapper._();

  @override int? hash(CheckBoard self) => self.checked.hashCode ^ self.count.hashCode;
  @override bool? equals(CheckBoard self, CheckBoard other) => self.checked == other.checked && self.count == other.count;
}

extension CheckBoardMapperExtension on CheckBoard {
}

class ClothesMapper extends BaseMapper<Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  Clothes decode(dynamic v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _checked(v, (Map<String, dynamic> map) {
    switch(map['label']) {
      case 'ATop':
      case 'BTop':
      case 'Shorts': return SummerClothesMapper._().decode(map);
      case 'Jeans': return JeansMapper._().decode(map);
      case 'TShirt': return TShirtMapper._().decode(map);
      default: return fromMap(map);
    }
  }));
  Clothes fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class Clothes, did you forgot to specify a subclass for [ label: '${map['label']}' ] or a default subclass?");

  @override Function get encoder => (Clothes v) => encode(v);
  dynamic encode(Clothes v) => _hookedEncode<Clothes>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) {
    if (v is SummerClothes) { return SummerClothesMapper._().encode(v); }
    else if (v is TShirt) { return TShirtMapper._().encode(v); }
    else if (v is Jeans) { return JeansMapper._().encode(v); }
    else { return toMap(v); }
  });
  Map<String, dynamic> toMap(Clothes c) => {'howbig': Mapper.toValue(c.size), 'color': Mapper.toValue(c.color), 'unmapped_props': Mapper.toValue(c.unmappedProps)};

  @override String? stringify(Clothes self) => 'Clothes(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps})';
  @override int? hash(Clothes self) => self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool? equals(Clothes self, Clothes other) => self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<Clothes>();
}

extension ClothesMapperExtension on Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class SummerClothesMapper extends BaseMapper<SummerClothes> {
  SummerClothesMapper._();

  @override Function get decoder => (v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, decode);
  SummerClothes decode(dynamic v) => _checked(v, (Map<String, dynamic> map) {
    switch(map['label']) {
      case 'ATop':
      case 'BTop': return TopMapper._().decode(map);
      case 'Shorts': return ShortsMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  SummerClothes fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class SummerClothes, did you forgot to specify a subclass for [ label: '${map['label']}' ] or a default subclass?");

  @override Function get encoder => (SummerClothes v) => _hookedEncode<SummerClothes>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => encode(v));
  dynamic encode(SummerClothes v) {
    if (v is Shorts) { return ShortsMapper._().encode(v); }
    else if (v is Top) { return TopMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(SummerClothes s) => {'howbig': Mapper.toValue(s.size), 'color': Mapper.toValue(s.color), 'unmapped_props': Mapper.toValue(s.unmappedProps)};

  @override String? stringify(SummerClothes self) => 'SummerClothes(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps})';
  @override int? hash(SummerClothes self) => self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool? equals(SummerClothes self, SummerClothes other) => self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<SummerClothes>();
}

extension SummerClothesMapperExtension on SummerClothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class TShirtMapper extends BaseMapper<TShirt> {
  TShirtMapper._();

  @override Function get decoder => (v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, decode);
  TShirt decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  TShirt fromMap(Map<String, dynamic> map) => TShirt(map.get('neck'), map.get('howbig'), map.getOpt('color'), map.getMap('unmapped_props'));

  @override Function get encoder => (TShirt v) => _hookedEncode<TShirt>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => encode(v));
  dynamic encode(TShirt v) => toMap(v);
  Map<String, dynamic> toMap(TShirt t) => {'neck': Mapper.toValue(t.neck), 'howbig': Mapper.toValue(t.size), 'color': Mapper.toValue(t.color), 'label': 'TShirt'};

  @override String? stringify(TShirt self) => 'TShirt(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, neck: ${self.neck})';
  @override int? hash(TShirt self) => self.neck.hashCode ^ self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool? equals(TShirt self, TShirt other) => self.neck == other.neck && self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<TShirt>();
}

extension TShirtMapperExtension on TShirt {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TShirt copyWith({String? neck, int? size, String? color, Map<String, dynamic>? unmappedProps}) => TShirt(neck ?? this.neck, size ?? this.size, color ?? this.color, unmappedProps ?? this.unmappedProps);
}

class JeansMapper extends BaseMapper<Jeans> {
  JeansMapper._();

  @override Function get decoder => (v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, decode);
  Jeans decode(dynamic v) => _hookedDecode(const JeansHooks(), v, (v) => _checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Jeans fromMap(Map<String, dynamic> map) => Jeans(map.get('age'), map.getOpt('color'), map.get('howbig'));

  @override Function get encoder => (Jeans v) => _hookedEncode<Jeans>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => encode(v));
  dynamic encode(Jeans v) => _hookedEncode<Jeans>(const JeansHooks(), v, (v) => toMap(v));
  Map<String, dynamic> toMap(Jeans j) => {'age': Mapper.toValue(j.age), 'color': Mapper.toValue(j.color), 'howbig': Mapper.toValue(j.size), 'label': 'Jeans'};

  @override String? stringify(Jeans self) => 'Jeans(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, age: ${self.age})';
  @override int? hash(Jeans self) => self.age.hashCode ^ self.color.hashCode ^ self.size.hashCode;
  @override bool? equals(Jeans self, Jeans other) => self.age == other.age && self.color == other.color && self.size == other.size;

  @override Function get typeFactory => (f) => f<Jeans>();
}

extension JeansMapperExtension on Jeans {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Jeans copyWith({int? age, String? color, int? size}) => Jeans(age ?? this.age, color ?? this.color, size ?? this.size);
}

class ShortsMapper extends BaseMapper<Shorts> {
  ShortsMapper._();

  @override Function get decoder => (v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, decode);
  Shorts decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Shorts fromMap(Map<String, dynamic> map) => Shorts(map.get('tag'), map.get('howbig'), map.getOpt('color'), map.getMap('unmapped_props'));

  @override Function get encoder => (Shorts v) => _hookedEncode<Shorts>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => encode(v));
  dynamic encode(Shorts v) => toMap(v);
  Map<String, dynamic> toMap(Shorts s) => {'tag': Mapper.toValue(s.tag), 'howbig': Mapper.toValue(s.size), 'color': Mapper.toValue(s.color), 'unmapped_props': Mapper.toValue(s.unmappedProps), 'label': 'Shorts'};

  @override String? stringify(Shorts self) => 'Shorts(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, tag: ${self.tag})';
  @override int? hash(Shorts self) => self.tag.hashCode ^ self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool? equals(Shorts self, Shorts other) => self.tag == other.tag && self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<Shorts>();
}

extension ShortsMapperExtension on Shorts {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Shorts copyWith({String? tag, int? size, String? color, Map<String, dynamic>? unmappedProps}) => Shorts(tag ?? this.tag, size ?? this.size, color ?? this.color, unmappedProps ?? this.unmappedProps);
}

class TopMapper extends BaseMapper<Top> {
  TopMapper._();

  @override Function get decoder => (v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, decode);
  Top decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Top fromMap(Map<String, dynamic> map) => Top(map.get('length'), map.get('howbig'), map.getOpt('color'), map.getMap('unmapped_props'));

  @override Function get encoder => (Top v) => _hookedEncode<Top>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => encode(v));
  dynamic encode(Top v) => toMap(v);
  Map<String, dynamic> toMap(Top t) => {'length': Mapper.toValue(t.length), 'howbig': Mapper.toValue(t.size), 'color': Mapper.toValue(t.color), 'unmapped_props': Mapper.toValue(t.unmappedProps), 'label': 'ATop'};

  @override String? stringify(Top self) => 'Top(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, length: ${self.length})';
  @override int? hash(Top self) => self.length.hashCode ^ self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool? equals(Top self, Top other) => self.length == other.length && self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<Top>();
}

extension TopMapperExtension on Top {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Top copyWith({int? length, int? size, String? color, Map<String, dynamic>? unmappedProps}) => Top(length ?? this.length, size ?? this.size, color ?? this.color, unmappedProps ?? this.unmappedProps);
}

class GenericBoxMapper extends BaseMapper<GenericBox> {
  GenericBoxMapper._();

  @override Function get decoder => decode;
  GenericBox<T> decode<T>(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  GenericBox<T> fromMap<T>(Map<String, dynamic> map) => GenericBox(map.get('content'));

  @override Function get encoder => (GenericBox v) => encode(v);
  dynamic encode(GenericBox v) => toMap(v);
  Map<String, dynamic> toMap(GenericBox g) => {'content': Mapper.toValue(g.content)};

  @override String? stringify(GenericBox self) => 'GenericBox(content: ${self.content})';
  @override int? hash(GenericBox self) => self.content.hashCode;
  @override bool? equals(GenericBox self, GenericBox other) => self.content == other.content;

  @override Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}

extension GenericBoxMapperExtension<T> on GenericBox<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  GenericBox<T> copyWith({T? content}) => GenericBox(content ?? this.content);
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

extension BrandMapper on Brand {
  static Brand fromString(String value) {
    switch (value) {
      case 'toyota': return Brand.Toyota;
      case 'audi': return Brand.Audi;
      case 'bmw': return Brand.BMW;
      default: return Brand.values[1];
    }
  }

  String toStringValue() {
    switch (this) {
      case Brand.Toyota: return 'toyota';
      case Brand.Audi: return 'audi';
      case Brand.BMW: return 'bmw';
    }
  }
}


// === GENERATED UTILITY CODE ===

class Mapper<T> {
  Mapper._();

  static T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      TypeInfo typeInfo;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        typeInfo = TypeInfo.fromType(value['__type'] as String);
      } else {
        typeInfo = TypeInfo.fromType<T>();
      }
      var mapper = _mappers[typeInfo.type];
      if (mapper?.decoder != null) {
        try {
          return genericCall(typeInfo, mapper!.decoder!, value) as T;
        } catch (e) {
          throw MapperException('Error on decoding type $T: ${e is MapperException ? e.message : e}');
        }
      } else {
        throw MapperException('Cannot decode value $value of type ${value.runtimeType} to type $T. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  static dynamic toValue(dynamic value) {
    if (value == null) return null;
    var typeInfo = TypeInfo.fromValue(value);
    var mapper = _mappers[typeInfo.type] ?? _mappers.values
      .cast<BaseMapper?>()
      .firstWhere((m) => m!.isFor(value), orElse: () => null);
    if (mapper != null && mapper.encoder != null) {
      var encoded = mapper.encoder!.call(value);
      if (encoded is Map<String, dynamic>) {
        _clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          typeInfo.type = _typeOf(mapper.type);
          encoded['__type'] = typeInfo.toString();
        }
      }
      return encoded;
    } else {
      throw MapperException('Cannot encode value $value of type ${value.runtimeType}. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  static Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
    }
  }
  
  static T fromIterable<T>(Iterable<dynamic> iterable) => fromValue<T>(iterable);

  static Iterable<dynamic> toIterable(dynamic object) {
    var value = toValue(object);
    if (value is Iterable<dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Iterable. Instead encoded to type ${value.runtimeType}.');
    }
  }

  static T fromJson<T>(String json) {
    return fromValue<T>(jsonDecode(json));
  }
  
  static String toJson(dynamic object) {
    return jsonEncode(toValue(object));
  }

  static bool isEqual(dynamic value, Object? other) {
    var type = _typeOf(value.runtimeType);
    return _mappers[type]?.equals(value, other) ?? value == other;
  }

  static String asString(dynamic value) {
    var type = _typeOf(value.runtimeType);
    return _mappers[type]?.stringify(value) ?? value.toString();
  }

  static void use<T>(BaseMapper<T> mapper) => _mappers[_typeOf<T>()] = mapper;
  static BaseMapper<T>? unuse<T>() => _mappers.remove(_typeOf<T>()) as BaseMapper<T>?;
}

String _typeOf<T>([Type? t]) {
  var input = (t ?? T).toString();
  return input.split('<')[0];
}

void _clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(_clearType);
  map.values.whereType<List>().forEach((l) => l.whereType<Map<String, dynamic>>().forEach(_clearType));
}

mixin Mappable {
  BaseMapper? get _mapper => _mappers[_typeOf(runtimeType)];

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && (_mapper?.equals(this, other) ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

T _checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException('Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

class DateTimeMapper extends SimpleMapper<DateTime> {

  @override
  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException('Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }
  
  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

class IterableMapper<I extends Iterable> extends BaseMapper<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  IterableMapper(this.fromIterable, this.typeFactory);

  @override Function get decoder => <T>(dynamic l) => _checked(l, (Iterable l) => fromIterable(l.map((v) => Mapper.fromValue<T>(v))));
  @override Function get encoder => (I self) => self.map((v) => Mapper.toValue(v)).toList();
  @override Function typeFactory;
}

class MapMapper<M extends Map> extends BaseMapper<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  MapMapper(this.fromMap, this.typeFactory);

  @override Function get decoder => <K, V>(dynamic m) => _checked(m,(Map m) => fromMap(m.map((key, value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)))));
  @override Function get encoder => (M self) => self.map((key, value) => MapEntry(Mapper.toValue(key), Mapper.toValue(value)));
  @override Function typeFactory;
}

class PrimitiveMapper<T> extends BaseMapper<T> {
  const PrimitiveMapper(this.decoder);
  
  @override final T Function(dynamic value) decoder;
  @override Function get encoder => (T value) => value;
  @override Function get typeFactory => (f) => f<T>();
  
  @override bool isFor(dynamic v) => v.runtimeType == T;
}

class EnumMapper<T> extends SimpleMapper<T> {
  EnumMapper(this._decoder, this._encoder);
  
  final T Function(String value) _decoder;
  final String Function(T value) _encoder;
  
  @override T decode(dynamic v) => _checked(v, _decoder);
  @override dynamic encode(T value) => _encoder(value);
}

dynamic genericCall(TypeInfo info, Function fn, dynamic value) {
  var params = [...info.params];

  dynamic call(dynamic Function<T>() next) {
    var t = params.removeAt(0);
    if (_mappers[t.type] != null) {
      return genericCall(t, _mappers[t.type]!.typeFactory ?? (f) => f(), next);
    } else {
      throw MapperException('Cannot find generic wrapper for type $t.');
    }
  }

  if (params.isEmpty) {
    return fn(value);
  } else if (params.length == 1) {
    return call(<A>() => fn<A>(value));
  } else if (params.length == 2) {
    return call(<A>() => call(<B>() => fn<A, B>(value)));
  } else if (params.length == 3) {
    return call(<A>() => call(<B>() => call(<C>() => fn<A, B, C>(value))));
  } else {
    throw MapperException('Cannot construct generic wrapper for type $info. Mapper only supports generic classes with up to 3 type arguments.');
  }
}

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
