// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'polymorphism_test.dart';

class AnimalMapper extends ClassMapperBase<Animal> {
  AnimalMapper._();
  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalMapper._());
      CatMapper.ensureInitialized();
      DogMapper.ensureInitialized();
      NullAnimalMapper.ensureInitialized();
      DefaultAnimalMapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'Animal';

  static String _$name(Animal v) => v.name;

  @override
  final Map<Symbol, Field<Animal, dynamic>> fields = const {
    #name: Field<Animal, String>('name', _$name),
  };

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('Animal', 'type', '${data.value['type']}');
  }
  @override
  final Function instantiate = _instantiate;

  static Animal fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Animal>(map);
  }
  static Animal fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Animal>(json);
  }
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;
abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}


class CatMapper extends DiscriminatorSubClassMapperBase<Cat> {
  CatMapper._();
  static CatMapper? _instance;
  static CatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }
  @override
  final String id = 'Cat';

  static String _$name(Cat v) => v.name;
  static String _$color(Cat v) => v.color;

  @override
  final Map<Symbol, Field<Cat, dynamic>> fields = const {
    #name: Field<Cat, String>('name', _$name),
    #color: Field<Cat, String>('color', _$color),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = 'Cat';

  static Cat _instantiate(DecodingData data) {
    return Cat(data.get(#name), data.get(#color));
  }
  @override
  final Function instantiate = _instantiate;

  static Cat fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Cat>(map);
  }
  static Cat fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Cat>(json);
  }
}

mixin CatMappable {
  String toJson() {
    CatMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Cat);
  }
  Map<String, dynamic> toMap() {
    CatMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Cat);
  }
  CatCopyWith<Cat, Cat, Cat> get copyWith => _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() {
    CatMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    CatMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    CatMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension CatValueCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;
abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  CatCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal> extends CopyWithBase<$R, Cat, $Out> implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, Cat, $Out2> chain<$R2, $Out2 extends Animal>(Then<Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends DiscriminatorSubClassMapperBase<Dog> {
  DogMapper._();
  static DogMapper? _instance;
  static DogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }
  @override
  final String id = 'Dog';

  static int _$age(Dog v) => v.age;
  static String _$name(Dog v) => v.name;

  @override
  final Map<Symbol, Field<Dog, dynamic>> fields = const {
    #age: Field<Dog, int>('age', _$age),
    #name: Field<Dog, String>('name', _$name, mode: FieldMode.member),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = 1;

  static Dog _instantiate(DecodingData data) {
    return Dog(data.get(#age));
  }
  @override
  final Function instantiate = _instantiate;

  static Dog fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Dog>(map);
  }
  static Dog fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Dog>(json);
  }
}

mixin DogMappable {
  String toJson() {
    DogMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Dog);
  }
  Map<String, dynamic> toMap() {
    DogMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Dog);
  }
  DogCopyWith<Dog, Dog, Dog> get copyWith => _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() {
    DogMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    DogMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    DogMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension DogValueCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get asDog => base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

typedef DogCopyWithBound = Animal;
abstract class DogCopyWith<$R, $In extends Dog, $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  DogCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({int? age});
}

class _DogCopyWithImpl<$R, $Out extends Animal> extends CopyWithBase<$R, Dog, $Out> implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override DogCopyWith<$R2, Dog, $Out2> chain<$R2, $Out2 extends Animal>(Then<Dog, $Out2> t, Then<$Out2, $R2> t2) => _DogCopyWithImpl($value, t, t2);

  @override $R call({int? age}) => $then(Dog(age ?? $value.age));
}

class NullAnimalMapper extends DiscriminatorSubClassMapperBase<NullAnimal> {
  NullAnimalMapper._();
  static NullAnimalMapper? _instance;
  static NullAnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NullAnimalMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }
  @override
  final String id = 'NullAnimal';

  static String _$name(NullAnimal v) => v.name;

  @override
  final Map<Symbol, Field<NullAnimal, dynamic>> fields = const {
    #name: Field<NullAnimal, String>('name', _$name),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = null;

  static NullAnimal _instantiate(DecodingData data) {
    return NullAnimal(data.get(#name));
  }
  @override
  final Function instantiate = _instantiate;

  static NullAnimal fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<NullAnimal>(map);
  }
  static NullAnimal fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<NullAnimal>(json);
  }
}

mixin NullAnimalMappable {
  String toJson() {
    NullAnimalMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as NullAnimal);
  }
  Map<String, dynamic> toMap() {
    NullAnimalMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as NullAnimal);
  }
  NullAnimalCopyWith<NullAnimal, NullAnimal, NullAnimal> get copyWith => _NullAnimalCopyWithImpl(this as NullAnimal, $identity, $identity);
  @override
  String toString() {
    NullAnimalMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    NullAnimalMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    NullAnimalMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension NullAnimalValueCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, NullAnimal, $Out> {
  NullAnimalCopyWith<$R, NullAnimal, $Out> get asNullAnimal => base.as((v, t, t2) => _NullAnimalCopyWithImpl(v, t, t2));
}

typedef NullAnimalCopyWithBound = Animal;
abstract class NullAnimalCopyWith<$R, $In extends NullAnimal, $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  NullAnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<NullAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name});
}

class _NullAnimalCopyWithImpl<$R, $Out extends Animal> extends CopyWithBase<$R, NullAnimal, $Out> implements NullAnimalCopyWith<$R, NullAnimal, $Out> {
  _NullAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override NullAnimalCopyWith<$R2, NullAnimal, $Out2> chain<$R2, $Out2 extends Animal>(Then<NullAnimal, $Out2> t, Then<$Out2, $R2> t2) => _NullAnimalCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(NullAnimal(name ?? $value.name));
}

class DefaultAnimalMapper extends DiscriminatorSubClassMapperBase<DefaultAnimal> {
  DefaultAnimalMapper._();
  static DefaultAnimalMapper? _instance;
  static DefaultAnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DefaultAnimalMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }
  @override
  final String id = 'DefaultAnimal';

  static String _$name(DefaultAnimal v) => v.name;
  static String _$type(DefaultAnimal v) => v.type;

  @override
  final Map<Symbol, Field<DefaultAnimal, dynamic>> fields = const {
    #name: Field<DefaultAnimal, String>('name', _$name),
    #type: Field<DefaultAnimal, String>('type', _$type),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = MappableClass.useAsDefault;

  static DefaultAnimal _instantiate(DecodingData data) {
    return DefaultAnimal(data.get(#name), data.get(#type));
  }
  @override
  final Function instantiate = _instantiate;

  static DefaultAnimal fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<DefaultAnimal>(map);
  }
  static DefaultAnimal fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<DefaultAnimal>(json);
  }
}

mixin DefaultAnimalMappable {
  String toJson() {
    DefaultAnimalMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as DefaultAnimal);
  }
  Map<String, dynamic> toMap() {
    DefaultAnimalMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as DefaultAnimal);
  }
  DefaultAnimalCopyWith<DefaultAnimal, DefaultAnimal, DefaultAnimal> get copyWith => _DefaultAnimalCopyWithImpl(this as DefaultAnimal, $identity, $identity);
  @override
  String toString() {
    DefaultAnimalMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    DefaultAnimalMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    DefaultAnimalMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension DefaultAnimalValueCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, DefaultAnimal, $Out> {
  DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> get asDefaultAnimal => base.as((v, t, t2) => _DefaultAnimalCopyWithImpl(v, t, t2));
}

typedef DefaultAnimalCopyWithBound = Animal;
abstract class DefaultAnimalCopyWith<$R, $In extends DefaultAnimal, $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  DefaultAnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(Then<DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? type});
}

class _DefaultAnimalCopyWithImpl<$R, $Out extends Animal> extends CopyWithBase<$R, DefaultAnimal, $Out> implements DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> {
  _DefaultAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override DefaultAnimalCopyWith<$R2, DefaultAnimal, $Out2> chain<$R2, $Out2 extends Animal>(Then<DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2) => _DefaultAnimalCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? type}) => $then(DefaultAnimal(name ?? $value.name, type ?? $value.type));
}

class ZooMapper extends ClassMapperBase<Zoo> {
  ZooMapper._();
  static ZooMapper? _instance;
  static ZooMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ZooMapper._());
      AnimalMapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'Zoo';

  static Animal _$animal(Zoo v) => v.animal;
  static List<Animal> _$animals(Zoo v) => v.animals;
  static Map<String, Animal> _$animals2(Zoo v) => v.animals2;

  @override
  final Map<Symbol, Field<Zoo, dynamic>> fields = const {
    #animal: Field<Zoo, Animal>('animal', _$animal),
    #animals: Field<Zoo, List<Animal>>('animals', _$animals),
    #animals2: Field<Zoo, Map<String, Animal>>('animals2', _$animals2),
  };

  static Zoo _instantiate(DecodingData data) {
    return Zoo(data.get(#animal), data.get(#animals), data.get(#animals2));
  }
  @override
  final Function instantiate = _instantiate;

  static Zoo fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Zoo>(map);
  }
  static Zoo fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Zoo>(json);
  }
}

mixin ZooMappable {
  String toJson() {
    ZooMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Zoo);
  }
  Map<String, dynamic> toMap() {
    ZooMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Zoo);
  }
  ZooCopyWith<Zoo, Zoo, Zoo> get copyWith => _ZooCopyWithImpl(this as Zoo, $identity, $identity);
  @override
  String toString() {
    ZooMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    ZooMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    ZooMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension ZooValueCopy<$R, $Out extends Zoo> on ObjectCopyWith<$R, Zoo, $Out> {
  ZooCopyWith<$R, Zoo, $Out> get asZoo => base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;
abstract class ZooCopyWith<$R, $In extends Zoo, $Out extends Zoo> implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Zoo>(Then<Zoo, $Out2> t, Then<$Out2, $R2> t2);
  AnimalCopyWith<$R, Animal, Animal> get animal;
  ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals;
  MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals2;
  $R call({Animal? animal, List<Animal>? animals, Map<String, Animal>? animals2});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo> extends CopyWithBase<$R, Zoo, $Out> implements ZooCopyWith<$R, Zoo, $Out> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override ZooCopyWith<$R2, Zoo, $Out2> chain<$R2, $Out2 extends Zoo>(Then<Zoo, $Out2> t, Then<$Out2, $R2> t2) => _ZooCopyWithImpl($value, t, t2);

  @override AnimalCopyWith<$R, Animal, Animal> get animal => $value.animal.copyWith.chain($identity, (v) => call(animal: v));
  @override ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals => ListCopyWith($value.animals, (v, t) => v.copyWith.chain<$R, Animal>($identity, t), (v) => call(animals: v));
  @override MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals2 => MapCopyWith($value.animals2, (v, t) => v.copyWith.chain<$R, Animal>($identity, t), (v) => call(animals2: v));
  @override $R call({Animal? animal, List<Animal>? animals, Map<String, Animal>? animals2}) => $then(Zoo(animal ?? $value.animal, animals ?? $value.animals, animals2 ?? $value.animals2));
}
