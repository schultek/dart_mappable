// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  static const Field<Animal, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Animal> fields = const {#name: _f$name};

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Animal',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Animal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Animal>(map);
  }

  static Animal fromJson(String json) {
    return ensureInitialized().decodeJson<Animal>(json);
  }
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends Animal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CatMapper extends SubClassMapperBase<Cat> {
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
  static const Field<Cat, String> _f$name = Field('name', _$name);
  static String _$color(Cat v) => v.color;
  static const Field<Cat, String> _f$color = Field('color', _$color);

  @override
  final MappableFields<Cat> fields = const {#name: _f$name, #color: _f$color};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Cat';
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Cat _instantiate(DecodingData data) {
    return Cat(data.dec(_f$name), data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static Cat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Cat>(map);
  }

  static Cat fromJson(String json) {
    return ensureInitialized().decodeJson<Cat>(json);
  }
}

mixin CatMappable {
  String toJson() {
    return CatMapper.ensureInitialized().encodeJson<Cat>(this as Cat);
  }

  Map<String, dynamic> toMap() {
    return CatMapper.ensureInitialized().encodeMap<Cat>(this as Cat);
  }

  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl<Cat, Cat>(this as Cat, $identity, $identity);
  @override
  String toString() {
    return CatMapper.ensureInitialized().stringifyValue(this as Cat);
  }

  @override
  bool operator ==(Object other) {
    return CatMapper.ensureInitialized().equalsValue(this as Cat, other);
  }

  @override
  int get hashCode {
    return CatMapper.ensureInitialized().hashValue(this as Cat);
  }
}

extension CatValueCopy<$R, $Out> on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get $asCat =>
      $base.as((v, t, t2) => _CatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CatCopyWith<$R, $In extends Cat, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, String? color});
  CatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CatCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Cat, $Out>
    implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cat> $mapper = CatMapper.ensureInitialized();
  @override
  $R call({String? name, String? color}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (color != null) #color: color,
    }),
  );
  @override
  Cat $make(CopyWithData data) =>
      Cat(data.get(#name, or: $value.name), data.get(#color, or: $value.color));

  @override
  CatCopyWith<$R2, Cat, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DogMapper extends SubClassMapperBase<Dog> {
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
  static const Field<Dog, int> _f$age = Field('age', _$age);
  static String _$name(Dog v) => v.name;
  static const Field<Dog, String> _f$name = Field(
    'name',
    _$name,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Dog> fields = const {#age: _f$age, #name: _f$name};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 1;
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Dog _instantiate(DecodingData data) {
    return Dog(data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static Dog fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Dog>(map);
  }

  static Dog fromJson(String json) {
    return ensureInitialized().decodeJson<Dog>(json);
  }
}

mixin DogMappable {
  String toJson() {
    return DogMapper.ensureInitialized().encodeJson<Dog>(this as Dog);
  }

  Map<String, dynamic> toMap() {
    return DogMapper.ensureInitialized().encodeMap<Dog>(this as Dog);
  }

  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl<Dog, Dog>(this as Dog, $identity, $identity);
  @override
  String toString() {
    return DogMapper.ensureInitialized().stringifyValue(this as Dog);
  }

  @override
  bool operator ==(Object other) {
    return DogMapper.ensureInitialized().equalsValue(this as Dog, other);
  }

  @override
  int get hashCode {
    return DogMapper.ensureInitialized().hashValue(this as Dog);
  }
}

extension DogValueCopy<$R, $Out> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get $asDog =>
      $base.as((v, t, t2) => _DogCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DogCopyWith<$R, $In extends Dog, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({int? age});
  DogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Dog, $Out>
    implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dog> $mapper = DogMapper.ensureInitialized();
  @override
  $R call({int? age}) =>
      $apply(FieldCopyWithData({if (age != null) #age: age}));
  @override
  Dog $make(CopyWithData data) => Dog(data.get(#age, or: $value.age));

  @override
  DogCopyWith<$R2, Dog, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DogCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NullAnimalMapper extends SubClassMapperBase<NullAnimal> {
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
  static const Field<NullAnimal, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<NullAnimal> fields = const {#name: _f$name};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = null;
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static NullAnimal _instantiate(DecodingData data) {
    return NullAnimal(data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static NullAnimal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NullAnimal>(map);
  }

  static NullAnimal fromJson(String json) {
    return ensureInitialized().decodeJson<NullAnimal>(json);
  }
}

mixin NullAnimalMappable {
  String toJson() {
    return NullAnimalMapper.ensureInitialized().encodeJson<NullAnimal>(
      this as NullAnimal,
    );
  }

  Map<String, dynamic> toMap() {
    return NullAnimalMapper.ensureInitialized().encodeMap<NullAnimal>(
      this as NullAnimal,
    );
  }

  NullAnimalCopyWith<NullAnimal, NullAnimal, NullAnimal> get copyWith =>
      _NullAnimalCopyWithImpl<NullAnimal, NullAnimal>(
        this as NullAnimal,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NullAnimalMapper.ensureInitialized().stringifyValue(
      this as NullAnimal,
    );
  }

  @override
  bool operator ==(Object other) {
    return NullAnimalMapper.ensureInitialized().equalsValue(
      this as NullAnimal,
      other,
    );
  }

  @override
  int get hashCode {
    return NullAnimalMapper.ensureInitialized().hashValue(this as NullAnimal);
  }
}

extension NullAnimalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NullAnimal, $Out> {
  NullAnimalCopyWith<$R, NullAnimal, $Out> get $asNullAnimal =>
      $base.as((v, t, t2) => _NullAnimalCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NullAnimalCopyWith<$R, $In extends NullAnimal, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  NullAnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NullAnimalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NullAnimal, $Out>
    implements NullAnimalCopyWith<$R, NullAnimal, $Out> {
  _NullAnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NullAnimal> $mapper =
      NullAnimalMapper.ensureInitialized();
  @override
  $R call({String? name}) =>
      $apply(FieldCopyWithData({if (name != null) #name: name}));
  @override
  NullAnimal $make(CopyWithData data) =>
      NullAnimal(data.get(#name, or: $value.name));

  @override
  NullAnimalCopyWith<$R2, NullAnimal, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NullAnimalCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DefaultAnimalMapper extends SubClassMapperBase<DefaultAnimal> {
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
  static const Field<DefaultAnimal, String> _f$name = Field('name', _$name);
  static String _$type(DefaultAnimal v) => v.type;
  static const Field<DefaultAnimal, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<DefaultAnimal> fields = const {
    #name: _f$name,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static DefaultAnimal _instantiate(DecodingData data) {
    return DefaultAnimal(data.dec(_f$name), data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static DefaultAnimal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DefaultAnimal>(map);
  }

  static DefaultAnimal fromJson(String json) {
    return ensureInitialized().decodeJson<DefaultAnimal>(json);
  }
}

mixin DefaultAnimalMappable {
  String toJson() {
    return DefaultAnimalMapper.ensureInitialized().encodeJson<DefaultAnimal>(
      this as DefaultAnimal,
    );
  }

  Map<String, dynamic> toMap() {
    return DefaultAnimalMapper.ensureInitialized().encodeMap<DefaultAnimal>(
      this as DefaultAnimal,
    );
  }

  DefaultAnimalCopyWith<DefaultAnimal, DefaultAnimal, DefaultAnimal>
  get copyWith => _DefaultAnimalCopyWithImpl<DefaultAnimal, DefaultAnimal>(
    this as DefaultAnimal,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return DefaultAnimalMapper.ensureInitialized().stringifyValue(
      this as DefaultAnimal,
    );
  }

  @override
  bool operator ==(Object other) {
    return DefaultAnimalMapper.ensureInitialized().equalsValue(
      this as DefaultAnimal,
      other,
    );
  }

  @override
  int get hashCode {
    return DefaultAnimalMapper.ensureInitialized().hashValue(
      this as DefaultAnimal,
    );
  }
}

extension DefaultAnimalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DefaultAnimal, $Out> {
  DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> get $asDefaultAnimal =>
      $base.as((v, t, t2) => _DefaultAnimalCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DefaultAnimalCopyWith<$R, $In extends DefaultAnimal, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, String? type});
  DefaultAnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DefaultAnimalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DefaultAnimal, $Out>
    implements DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> {
  _DefaultAnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DefaultAnimal> $mapper =
      DefaultAnimalMapper.ensureInitialized();
  @override
  $R call({String? name, String? type}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (type != null) #type: type,
    }),
  );
  @override
  DefaultAnimal $make(CopyWithData data) => DefaultAnimal(
    data.get(#name, or: $value.name),
    data.get(#type, or: $value.type),
  );

  @override
  DefaultAnimalCopyWith<$R2, DefaultAnimal, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DefaultAnimalCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

  static Animal? _$animal(Zoo v) => v.animal;
  static const Field<Zoo, Animal> _f$animal = Field('animal', _$animal);
  static List<Animal>? _$animals(Zoo v) => v.animals;
  static const Field<Zoo, List<Animal>> _f$animals = Field(
    'animals',
    _$animals,
  );
  static Map<String, Animal>? _$animalsMap(Zoo v) => v.animalsMap;
  static const Field<Zoo, Map<String, Animal>> _f$animalsMap = Field(
    'animalsMap',
    _$animalsMap,
  );

  @override
  final MappableFields<Zoo> fields = const {
    #animal: _f$animal,
    #animals: _f$animals,
    #animalsMap: _f$animalsMap,
  };
  @override
  final bool ignoreNull = true;

  static Zoo _instantiate(DecodingData data) {
    return Zoo(
      data.dec(_f$animal),
      data.dec(_f$animals),
      data.dec(_f$animalsMap),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Zoo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Zoo>(map);
  }

  static Zoo fromJson(String json) {
    return ensureInitialized().decodeJson<Zoo>(json);
  }
}

mixin ZooMappable {
  String toJson() {
    return ZooMapper.ensureInitialized().encodeJson<Zoo>(this as Zoo);
  }

  Map<String, dynamic> toMap() {
    return ZooMapper.ensureInitialized().encodeMap<Zoo>(this as Zoo);
  }

  ZooCopyWith<Zoo, Zoo, Zoo> get copyWith =>
      _ZooCopyWithImpl<Zoo, Zoo>(this as Zoo, $identity, $identity);
  @override
  String toString() {
    return ZooMapper.ensureInitialized().stringifyValue(this as Zoo);
  }

  @override
  bool operator ==(Object other) {
    return ZooMapper.ensureInitialized().equalsValue(this as Zoo, other);
  }

  @override
  int get hashCode {
    return ZooMapper.ensureInitialized().hashValue(this as Zoo);
  }
}

extension ZooValueCopy<$R, $Out> on ObjectCopyWith<$R, Zoo, $Out> {
  ZooCopyWith<$R, Zoo, $Out> get $asZoo =>
      $base.as((v, t, t2) => _ZooCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ZooCopyWith<$R, $In extends Zoo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R, Animal, Animal>? get animal;
  ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>>? get animals;
  MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>>?
  get animalsMap;
  $R call({
    Animal? animal,
    List<Animal>? animals,
    Map<String, Animal>? animalsMap,
  });
  ZooCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ZooCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Zoo, $Out>
    implements ZooCopyWith<$R, Zoo, $Out> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Zoo> $mapper = ZooMapper.ensureInitialized();
  @override
  AnimalCopyWith<$R, Animal, Animal>? get animal =>
      $value.animal?.copyWith.$chain((v) => call(animal: v));
  @override
  ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>>? get animals =>
      $value.animals != null
      ? ListCopyWith(
          $value.animals!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(animals: v),
        )
      : null;
  @override
  MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>>?
  get animalsMap => $value.animalsMap != null
      ? MapCopyWith(
          $value.animalsMap!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(animalsMap: v),
        )
      : null;
  @override
  $R call({
    Object? animal = $none,
    Object? animals = $none,
    Object? animalsMap = $none,
  }) => $apply(
    FieldCopyWithData({
      if (animal != $none) #animal: animal,
      if (animals != $none) #animals: animals,
      if (animalsMap != $none) #animalsMap: animalsMap,
    }),
  );
  @override
  Zoo $make(CopyWithData data) => Zoo(
    data.get(#animal, or: $value.animal),
    data.get(#animals, or: $value.animals),
    data.get(#animalsMap, or: $value.animalsMap),
  );

  @override
  ZooCopyWith<$R2, Zoo, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ZooCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

