// ignore_for_file: unnecessary_cast, prefer_relative_imports, unused_element
import 'dart:convert';
import 'models/polymorphism.dart';
import 'models/model.dart';
import 'models/inheritance.dart';
import 'package:dart_mappable/annotations.dart';

// === GENERATED MAPPER CLASSES AND EXTENSIONS ===

class AnimalMapper implements Mapper<Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  Animal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Animal fromMap(Map<String, dynamic> map) => Mapper.fromMap<DefaultAnimal>(map);

  @override dynamic encode(Animal v) => toMap(v);
  Map<String, dynamic> toMap(Animal a) => {'name': Mapper.toValue(a.name)};

  @override String stringify(Animal self) => 'Animal(name: ${self.name})';
  @override int hash(Animal self) => self.name.hashCode;
  @override bool equals(Animal self, Animal other) => self.name == other.name;

  @override Function get typeFactory => (f) => f<Animal>();
  @override Discriminator? get discriminator => Discriminator(key: '_type');
}

extension AnimalExtension on Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

}

class CatMapper implements Mapper<Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  Cat decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(map.get('name'), map.get('color'));

  @override dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': Mapper.toValue(c.name), 'color': Mapper.toValue(c.color)};

  @override String stringify(Cat self) => 'Cat(name: ${self.name}, color: ${self.color})';
  @override int hash(Cat self) => self.name.hashCode ^ self.color.hashCode;
  @override bool equals(Cat self, Cat other) => self.name == other.name && self.color == other.color;

  @override Function get typeFactory => (f) => f<Cat>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: 'Cat');
}

extension CatExtension on Cat {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Cat copyWith({String? name, String? color}) => Cat(name ?? this.name, color ?? this.color);
}

class DogMapper implements Mapper<Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  Dog decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(map.get('name'), map.get('age'));

  @override dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {'name': Mapper.toValue(d.name), 'age': Mapper.toValue(d.age)};

  @override String stringify(Dog self) => 'Dog(name: ${self.name}, age: ${self.age})';
  @override int hash(Dog self) => self.name.hashCode ^ self.age.hashCode;
  @override bool equals(Dog self, Dog other) => self.name == other.name && self.age == other.age;

  @override Function get typeFactory => (f) => f<Dog>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: Animal.Dog);
}

extension DogExtension on Dog {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Dog copyWith({String? name, int? age}) => Dog(name ?? this.name, age ?? this.age);
}

class NullAnimalMapper implements Mapper<NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  NullAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  NullAnimal fromMap(Map<String, dynamic> map) => NullAnimal(map.get('name'));

  @override dynamic encode(NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(NullAnimal n) => {'name': Mapper.toValue(n.name)};

  @override String stringify(NullAnimal self) => 'NullAnimal(name: ${self.name})';
  @override int hash(NullAnimal self) => self.name.hashCode;
  @override bool equals(NullAnimal self, NullAnimal other) => self.name == other.name;

  @override Function get typeFactory => (f) => f<NullAnimal>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: null);
}

extension NullAnimalExtension on NullAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NullAnimal copyWith({String? name}) => NullAnimal(name ?? this.name);
}

class DefaultAnimalMapper implements Mapper<DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  DefaultAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  DefaultAnimal fromMap(Map<String, dynamic> map) => DefaultAnimal(map.get('name'), map.get('_type'));

  @override dynamic encode(DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(DefaultAnimal d) => {'name': Mapper.toValue(d.name), '_type': Mapper.toValue(d.type)};

  @override String stringify(DefaultAnimal self) => 'DefaultAnimal(name: ${self.name}, type: ${self.type})';
  @override int hash(DefaultAnimal self) => self.name.hashCode ^ self.type.hashCode;
  @override bool equals(DefaultAnimal self, DefaultAnimal other) => self.name == other.name && self.type == other.type;

  @override Function get typeFactory => (f) => f<DefaultAnimal>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: '__default__');
}

extension DefaultAnimalExtension on DefaultAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DefaultAnimal copyWith({String? name, String? type}) => DefaultAnimal(name ?? this.name, type ?? this.type);
}

class PersonMapper implements Mapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(map.get('name'), age: map.getOpt('age') ?? 18, car: map.getOpt('car'));

  @override dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': Mapper.toValue(p.name), 'age': Mapper.toValue(p.age), 'car': Mapper.toValue(p.car)};

  @override String stringify(Person self) => 'Person(name: ${self.name}, age: ${self.age}, car: ${self.car})';
  @override int hash(Person self) => self.name.hashCode ^ self.age.hashCode ^ self.car.hashCode;
  @override bool equals(Person self, Person other) => self.name == other.name && self.age == other.age && self.car == other.car;

  @override Function get typeFactory => (f) => f<Person>();
  @override Discriminator? get discriminator => null;
}

extension PersonExtension on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Person copyWith({String? name, int? age, Car? car}) => Person(name ?? this.name, age: age ?? this.age, car: car ?? this.car);
}

class CarMapper implements Mapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(map.get('driven_km'), map.get('brand'));

  @override dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'driven_km': Mapper.toValue(c.drivenKm), 'brand': Mapper.toValue(c.brand)};

  @override String stringify(Car self) => 'Car(miles: ${self.miles}, brand: ${self.brand})';
  @override int hash(Car self) => self.drivenKm.hashCode ^ self.brand.hashCode;
  @override bool equals(Car self, Car other) => self.drivenKm == other.drivenKm && self.brand == other.brand;

  @override Function get typeFactory => (f) => f<Car>();
  @override Discriminator? get discriminator => null;
}

extension CarExtension on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Car copyWith({int? drivenKm, Brand? brand}) => Car(drivenKm ?? this.drivenKm, brand ?? this.brand);
}

class BoxMapper implements Mapper<Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  Box<T> decode<T>(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T>(Map<String, dynamic> map) => Box(map.get('size'), content: map.get('content'));

  @override dynamic encode(Box v) => toMap(v);
  Map<String, dynamic> toMap(Box b) => {'size': Mapper.toValue(b.size), 'content': Mapper.toValue(b.content)};

  @override String stringify(Box self) => 'Box(size: ${self.size}, content: ${self.content})';
  @override int hash(Box self) => self.size.hashCode ^ self.content.hashCode;
  @override bool equals(Box self, Box other) => self.size == other.size && self.content == other.content;

  @override Function get typeFactory => <T>(f) => f<Box<T>>();
  @override Discriminator? get discriminator => null;
}

extension BoxExtension<T> on Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Box<T> copyWith({int? size, T? content}) => Box(size ?? this.size, content: content ?? this.content);
}

class ConfettiMapper implements Mapper<Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  Confetti decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) => Confetti(map.get('color'));

  @override dynamic encode(Confetti v) => toMap(v);
  Map<String, dynamic> toMap(Confetti c) => {'color': Mapper.toValue(c.color)};

  @override String stringify(Confetti self) => 'Confetti(color: ${self.color})';
  @override int hash(Confetti self) => self.color.hashCode;
  @override bool equals(Confetti self, Confetti other) => self.color == other.color;

  @override Function get typeFactory => (f) => f<Confetti>();
  @override Discriminator? get discriminator => null;
}

extension ConfettiExtension on Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Confetti copyWith({String? color}) => Confetti(color ?? this.color);
}

class GameMapper implements Mapper<Game> {
  GameMapper._();

  @override Function get decoder => decode;
  Game decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Game fromMap(Map<String, dynamic> map) => Game(map.get('player', hooks: const PlayerHooks()));

  @override dynamic encode(Game v) => toMap(v);
  Map<String, dynamic> toMap(Game g) => {'player': _toValue(g.player, hooks: const PlayerHooks())};

  @override String stringify(Game self) => 'Game(player: ${self.player})';
  @override int hash(Game self) => self.player.hashCode;
  @override bool equals(Game self, Game other) => self.player == other.player;

  @override Function get typeFactory => (f) => f<Game>();
  @override Discriminator? get discriminator => null;
}

extension GameExtension on Game {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Game copyWith({Player? player}) => Game(player ?? this.player);
}

class PlayerMapper implements Mapper<Player> {
  PlayerMapper._();

  @override Function get decoder => decode;
  Player decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Player fromMap(Map<String, dynamic> map) => Player(map.get('id'));

  @override dynamic encode(Player v) => toMap(v);
  Map<String, dynamic> toMap(Player p) => {'id': Mapper.toValue(p.id)};

  @override String stringify(Player self) => 'Player(id: ${self.id})';
  @override int hash(Player self) => self.id.hashCode;
  @override bool equals(Player self, Player other) => self.id == other.id;

  @override Function get typeFactory => (f) => f<Player>();
  @override Discriminator? get discriminator => null;
}

extension PlayerExtension on Player {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Player copyWith({String? id}) => Player(id ?? this.id);
}

class ClothesMapper implements Mapper<Clothes> {
  ClothesMapper._();

  @override Function get decoder => decode;
  Clothes decode(dynamic v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Clothes fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate abstract class Clothes, did you forgot to specify a subclass for [ _type: '${map['_type']}' ] or a default subclass?");

  @override dynamic encode(Clothes v) => _hookedEncode<Clothes>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => toMap(v));
  Map<String, dynamic> toMap(Clothes c) => {'howbig': Mapper.toValue(c.size), 'color': Mapper.toValue(c.color), 'unmapped_props': Mapper.toValue(c.unmappedProps)};

  @override String stringify(Clothes self) => 'Clothes(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps})';
  @override int hash(Clothes self) => self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool equals(Clothes self, Clothes other) => self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<Clothes>();
  @override Discriminator? get discriminator => Discriminator(key: '_type');
}

extension ClothesExtension on Clothes {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

}

class TShirtMapper implements Mapper<TShirt> {
  TShirtMapper._();

  @override Function get decoder => decode;
  TShirt decode(dynamic v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _checked(v, (Map<String, dynamic> map) => fromMap(map)));
  TShirt fromMap(Map<String, dynamic> map) => TShirt(map.get('neck'), map.get('howbig'), map.getOpt('color'), map.getMap('unmapped_props'));

  @override dynamic encode(TShirt v) => _hookedEncode<TShirt>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => toMap(v));
  Map<String, dynamic> toMap(TShirt t) => {'neck': Mapper.toValue(t.neck), 'howbig': Mapper.toValue(t.size), 'color': Mapper.toValue(t.color)};

  @override String stringify(TShirt self) => 'TShirt(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, neck: ${self.neck})';
  @override int hash(TShirt self) => self.neck.hashCode ^ self.size.hashCode ^ self.color.hashCode ^ self.unmappedProps.hashCode;
  @override bool equals(TShirt self, TShirt other) => self.neck == other.neck && self.size == other.size && self.color == other.color && self.unmappedProps == other.unmappedProps;

  @override Function get typeFactory => (f) => f<TShirt>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: 'TShirt');
}

extension TShirtExtension on TShirt {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TShirt copyWith({String? neck, int? size, String? color, Map<String, dynamic>? unmappedProps}) => TShirt(neck ?? this.neck, size ?? this.size, color ?? this.color, unmappedProps ?? this.unmappedProps);
}

class JeansHooksMapper implements Mapper<JeansHooks> {
  JeansHooksMapper._();

  @override Function get decoder => decode;
  JeansHooks decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  JeansHooks fromMap(Map<String, dynamic> map) => JeansHooks();

  @override dynamic encode(JeansHooks v) => toMap(v);
  Map<String, dynamic> toMap(JeansHooks j) => {};

  @override String stringify(JeansHooks self) => 'JeansHooks()';
  @override int hash(JeansHooks self) => 0;
  @override bool equals(JeansHooks self, JeansHooks other) => true;

  @override Function get typeFactory => (f) => f<JeansHooks>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: 'JeansHooks');
}

extension JeansHooksExtension on JeansHooks {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  JeansHooks copy() => JeansHooks();
}

class MappingHooksMapper implements Mapper<MappingHooks> {
  MappingHooksMapper._();

  @override Function get decoder => decode;
  MappingHooks decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  MappingHooks fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate abstract class MappingHooks, did you forgot to specify a subclass for [ _type: '${map['_type']}' ] or a default subclass?");

  @override dynamic encode(MappingHooks v) => toMap(v);
  Map<String, dynamic> toMap(MappingHooks m) => {};

  @override String stringify(MappingHooks self) => 'MappingHooks()';
  @override int hash(MappingHooks self) => 0;
  @override bool equals(MappingHooks self, MappingHooks other) => true;

  @override Function get typeFactory => (f) => f<MappingHooks>();
  @override Discriminator? get discriminator => Discriminator(key: '_type');
}

extension MappingHooksExtension on MappingHooks {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

}

class JeansMapper implements Mapper<Jeans> {
  JeansMapper._();

  @override Function get decoder => decode;
  Jeans decode(dynamic v) => _hookedDecode(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _hookedDecode(const JeansHooks(), v, (v) => _checked(v, (Map<String, dynamic> map) => fromMap(map))));
  Jeans fromMap(Map<String, dynamic> map) => Jeans(map.get('age'), map.getOpt('color'), map.get('howbig'));

  @override dynamic encode(Jeans v) => _hookedEncode<Jeans>(const UnmappedPropertiesHooks('unmapped_props'), v, (v) => _hookedEncode<Jeans>(const JeansHooks(), v, (v) => toMap(v)));
  Map<String, dynamic> toMap(Jeans j) => {'age': Mapper.toValue(j.age), 'color': Mapper.toValue(j.color), 'howbig': Mapper.toValue(j.size)};

  @override String stringify(Jeans self) => 'Jeans(size: ${self.size}, color: ${self.color}, unmappedProps: ${self.unmappedProps}, age: ${self.age})';
  @override int hash(Jeans self) => self.age.hashCode ^ self.color.hashCode ^ self.size.hashCode;
  @override bool equals(Jeans self, Jeans other) => self.age == other.age && self.color == other.color && self.size == other.size;

  @override Function get typeFactory => (f) => f<Jeans>();
  @override Discriminator? get discriminator => Discriminator(superKey: '_type', value: 'Jeans');
}

extension JeansExtension on Jeans {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Jeans copyWith({int? age, String? color, int? size}) => Jeans(age ?? this.age, color ?? this.color, size ?? this.size);
}


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



// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <String, Mapper>{
  // primitive mappers
  _typeOf<dynamic>():  _PrimitiveMapper((dynamic v) => v),
  _typeOf<String>():   _PrimitiveMapper<String>((dynamic v) => v.toString()),
  _typeOf<int>():      _PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  _typeOf<double>():   _PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  _typeOf<num>():      _PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  _typeOf<bool>():     _PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  _typeOf<DateTime>(): _DateTimeMapper(),
  _typeOf<List>():     IterableMapper<List>(<T>(Iterable<T> i) => i.toList(), <T>(f) => f<List<T>>()),
  _typeOf<Set>():      IterableMapper<Set>(<T>(Iterable<T> i) => i.toSet(), <T>(f) => f<Set<T>>()),
  _typeOf<Map>():      MapMapper<Map>(<K, V>(Map<K, V> map) => map, <K, V>(f) => f<Map<K, V>>()),
  // generated mappers
  _typeOf<Animal>(): AnimalMapper._(),
  _typeOf<Cat>(): CatMapper._(),
  _typeOf<Dog>(): DogMapper._(),
  _typeOf<NullAnimal>(): NullAnimalMapper._(),
  _typeOf<DefaultAnimal>(): DefaultAnimalMapper._(),
  _typeOf<Person>(): PersonMapper._(),
  _typeOf<Car>(): CarMapper._(),
  _typeOf<Box>(): BoxMapper._(),
  _typeOf<Confetti>(): ConfettiMapper._(),
  _typeOf<Game>(): GameMapper._(),
  _typeOf<Player>(): PlayerMapper._(),
  _typeOf<Clothes>(): ClothesMapper._(),
  _typeOf<TShirt>(): TShirtMapper._(),
  _typeOf<JeansHooks>(): JeansHooksMapper._(),
  _typeOf<MappingHooks>(): MappingHooksMapper._(),
  _typeOf<Jeans>(): JeansMapper._(),

  _typeOf<Brand>(): _EnumMapper<Brand>(BrandMapper.fromString, (Brand b) => b.toStringValue()),

};

// === GENERATED UTILITY CLASSES ===

abstract class Mapper<T> {
  dynamic encode(T self);
  Function get decoder;
  Function get typeFactory;
  Discriminator? get discriminator;
  
  String stringify(T self);
  int hash(T self);
  bool equals(T self, T other);

  Mapper._();

  static T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      TypeInfo typeInfo;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        typeInfo = getTypeInfo(value['__type'] as String);
      } else {
        typeInfo = getTypeInfo<T>();
      }
      var mapper = _mappers[typeInfo.type];
      while (value is Map<String, dynamic> && mapper?.discriminator?.key != null) {
        var matches = _mappers.entries.where((e) {
          return e.value.discriminator?.superKey == mapper!.discriminator!.key 
              && e.value.discriminator?.value == value[mapper.discriminator!.key];
        });
        if (matches.isEmpty) {
          break;
        }
        mapper = matches.first.value;
        typeInfo = TypeInfo()..type = matches.first.key;
      }
      if (mapper != null) {
        try {
          return genericCall(typeInfo, mapper.decoder, value) as T;
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
    var typeInfo = getTypeInfoFor(value);
    if (_mappers[typeInfo.type] != null) {
      var encoded = _mappers[typeInfo.type]!.encode(value);
      if (encoded is Map<String, dynamic>) {
        _clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          encoded['__type'] = typeInfo.toString();
        }
        if (_mappers[typeInfo.type]!.discriminator?.superKey != null) {
          encoded[_mappers[typeInfo.type]!.discriminator!.superKey!] = _mappers[typeInfo.type]!.discriminator!.value;
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
    if (_mappers[type] != null) {
      return _mappers[type]!.equals(value, other);
    } else {
      throw MapperException(
          'Cannot compare value of type $type for equality. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static String asString(dynamic value) {
    var type = _typeOf(value.runtimeType);
    if (_mappers[type] != null) {
      return _mappers[type]!.stringify(value);
    } else {
      throw MapperException(
          'Cannot stringify value of type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static void use<T>(Mapper<T> mapper) => _mappers[_typeOf<T>()] = mapper;
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
  Mapper? get _mapper => _mappers[_typeOf(runtimeType)];

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => _mapper != null ? identical(this, other) || runtimeType == other.runtimeType && _mapper!.equals(this, other) : super == other;
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

T _checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException('Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

class Discriminator {
  String? key;
  String? superKey;
  dynamic value;
  Discriminator({this.key, this.superKey, this.value});
}

abstract class BaseMapper<T> implements Mapper<T> {
  @override bool equals(T self, Object? other) => self == other;
  @override int hash(T self) => self.hashCode;
  @override String stringify(T self) => self.toString();
  @override Function get typeFactory => (f) => f<T>();
  @override Discriminator? get discriminator => null;
}

class _DateTimeMapper extends BaseMapper<DateTime> {
  @override Function get decoder => decode;

  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException('Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }
  
  @override String encode(DateTime self) => self.toUtc().toIso8601String();
}

class IterableMapper<I extends Iterable> extends BaseMapper<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  IterableMapper(this.fromIterable, this.typeFactory);

  @override Function get decoder => decode;
  Iterable<T> decode<T>(dynamic l) => _checked(l, (Iterable l) => fromIterable(l.map((v) => Mapper.fromValue<T>(v))));
  @override List encode(I self) => self.map((v) => Mapper.toValue(v)).toList();
  @override Function typeFactory;
}

class MapMapper<M extends Map> extends BaseMapper<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  MapMapper(this.fromMap, this.typeFactory);

  @override Function get decoder => decode;
  Map<K, V> decode<K, V>(dynamic m) => _checked(m,(Map m) => fromMap(m.map((key, value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)))));
  @override Map encode(M self) => self.map((key, value) => MapEntry(Mapper.toValue(key), Mapper.toValue(value)));
  @override Function typeFactory;
}

class _PrimitiveMapper<T> with BaseMapper<T> implements Mapper<T> {
  const _PrimitiveMapper(this.decoder);
  
  @override final T Function(dynamic value) decoder;
  @override dynamic encode(T value) => value;
}

class _EnumMapper<T> with BaseMapper<T> implements Mapper<T> {
  _EnumMapper(this.strDecoder, this.encoder);
  
  @override
  Function get decoder => (dynamic v) => _checked(v, strDecoder);
  
  final T Function(String value) strDecoder;
  final String Function(T value) encoder;

  @override String encode(T self) => encoder(self);
}

class MapperException implements Exception {
  final String message;
  const MapperException(this.message);

  @override
  String toString() => 'MapperException: $message';
}


class TypeInfo {
  String type = '';
  List<TypeInfo> params = [];
  TypeInfo? parent;

  @override
  String toString() => '$type${params.isNotEmpty ? '<${params.join(', ')}>' : ''}';
}

TypeInfo getTypeInfoFor(dynamic value) {
  var info = getTypeInfo(value.runtimeType.toString());
  if (value is List) {
    return info..type = 'List';
  } else if (value is Map) {
    return info..type = 'Map';
  } else {
    return info;
  }
}

TypeInfo getTypeInfo<T>([String? type]) {
  var typeString = type ?? T.toString();
  var curr = TypeInfo();

  for (var i = 0; i < typeString.length; i++) {
    var c = typeString[i];
    if (c == '<') {
      var t = TypeInfo();
      curr.params.add(t..parent = curr);
      curr = t;
    } else if (c == '>') {
      curr = curr.parent!;
    } else if (c == ' ') {
      continue;
    } else if (c == ',') {
      var t = TypeInfo();
      curr = curr.parent!;
      curr.params.add(t..parent = curr);
      curr = t;
    } else {
      curr.type += c;
    }
  }

  return curr;
}

dynamic genericCall(TypeInfo info, Function fn, dynamic value) {
  var params = [...info.params];

  dynamic call(dynamic Function<T>() next) {
    var t = params.removeAt(0);
    if (_mappers[t.type] != null) {
      return genericCall(t, _mappers[t.type]!.typeFactory, next);
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

extension on Map<String, dynamic> {
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
    List value = v as List<dynamic>;
    return value.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  List<T>? getListOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    List value = v as List<dynamic>;
    return value.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  Map<K, V> getMap<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    Map value = v as Map<dynamic, dynamic>;
    return value.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  Map<K, V>? getMapOpt<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    Map value = v as Map<dynamic, dynamic>;
    return value.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  T hooked<T>(MappingHooks? hooks, String key, T Function(dynamic v) fn) {
    if (hooks == null) {
      return fn(this[key]);
    } else {
      return hooks.afterDecode(fn(hooks.beforeDecode(this[key]))) as T;
    }
  }
}
