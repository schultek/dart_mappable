// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'multi_poly_test.dart';

class ShepherdMapper extends SubClassMapperBase<Shepherd> {
  ShepherdMapper._();

  static ShepherdMapper? _instance;
  static ShepherdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShepherdMapper._());
      DogMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Shepherd';

  static String? _$name(Shepherd v) => v.name;
  static const Field<Shepherd, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<Shepherd, dynamic>> fields = const {
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Shepherd';
  @override
  late final ClassMapperBase superMapper = DogMapper.ensureInitialized();

  static Shepherd _instantiate(DecodingData data) {
    return Shepherd(data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Shepherd fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Shepherd>(map);
  }

  static Shepherd fromJson(String json) {
    return ensureInitialized().decodeJson<Shepherd>(json);
  }
}

mixin ShepherdMappable {
  String toJson() {
    return ShepherdMapper.ensureInitialized()
        .encodeJson<Shepherd>(this as Shepherd);
  }

  Map<String, dynamic> toMap() {
    return ShepherdMapper.ensureInitialized()
        .encodeMap<Shepherd>(this as Shepherd);
  }

  ShepherdCopyWith<Shepherd, Shepherd, Shepherd> get copyWith =>
      _ShepherdCopyWithImpl(this as Shepherd, $identity, $identity);
  @override
  String toString() {
    return ShepherdMapper.ensureInitialized().stringifyValue(this as Shepherd);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ShepherdMapper.ensureInitialized()
                .isValueEqual(this as Shepherd, other));
  }

  @override
  int get hashCode {
    return ShepherdMapper.ensureInitialized().hashValue(this as Shepherd);
  }
}

extension ShepherdValueCopy<$R, $Out> on ObjectCopyWith<$R, Shepherd, $Out> {
  ShepherdCopyWith<$R, Shepherd, $Out> get $asShepherd =>
      $base.as((v, t, t2) => _ShepherdCopyWithImpl(v, t, t2));
}

abstract class ShepherdCopyWith<$R, $In extends Shepherd, $Out>
    implements DogCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  ShepherdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ShepherdCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Shepherd, $Out>
    implements ShepherdCopyWith<$R, Shepherd, $Out> {
  _ShepherdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Shepherd> $mapper =
      ShepherdMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  Shepherd $make(CopyWithData data) =>
      Shepherd(data.get(#name, or: $value.name));

  @override
  ShepherdCopyWith<$R2, Shepherd, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ShepherdCopyWithImpl($value, $cast, t);
}

class DogMapper extends SubClassMapperBase<Dog> {
  DogMapper._();

  static DogMapper? _instance;
  static DogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      ShepherdMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Dog';

  static String? _$name(Dog v) => v.name;
  static const Field<Dog, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<Dog, dynamic>> fields = const {
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Dog';
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Dog _instantiate(DecodingData data) {
    return Dog(data.dec(_f$name));
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
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() {
    return DogMapper.ensureInitialized().stringifyValue(this as Dog);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DogMapper.ensureInitialized().isValueEqual(this as Dog, other));
  }

  @override
  int get hashCode {
    return DogMapper.ensureInitialized().hashValue(this as Dog);
  }
}

extension DogValueCopy<$R, $Out> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get $asDog =>
      $base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $In extends Dog, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  DogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Dog, $Out>
    implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dog> $mapper = DogMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  Dog $make(CopyWithData data) => Dog(data.get(#name, or: $value.name));

  @override
  DogCopyWith<$R2, Dog, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DogCopyWithImpl($value, $cast, t);
}

class AnimalMapper extends ClassMapperBase<Animal> {
  AnimalMapper._();

  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalMapper._());
      DogMapper.ensureInitialized();
      CatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Animal';

  static String? _$name(Animal v) => v.name;
  static const Field<Animal, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<Animal, dynamic>> fields = const {
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Animal', 'type', '${data.value['type']}');
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
  $R call({String? name});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CatMapper extends SubClassMapperBase<Cat> {
  CatMapper._();

  static CatMapper? _instance;
  static CatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      SiameseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Cat';

  static String? _$name(Cat v) => v.name;
  static const Field<Cat, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<Cat, dynamic>> fields = const {
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Cat';
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Cat _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Cat', 'breed', '${data.value['breed']}');
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
  String toJson();
  Map<String, dynamic> toMap();
  CatCopyWith<Cat, Cat, Cat> get copyWith;
}

abstract class CatCopyWith<$R, $In extends Cat, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  CatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SiameseMapper extends SubClassMapperBase<Siamese> {
  SiameseMapper._();

  static SiameseMapper? _instance;
  static SiameseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SiameseMapper._());
      CatMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Siamese';

  static String? _$name(Siamese v) => v.name;
  static const Field<Siamese, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<Siamese, dynamic>> fields = const {
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'breed';
  @override
  final dynamic discriminatorValue = 'Siamese';
  @override
  late final ClassMapperBase superMapper = CatMapper.ensureInitialized();

  static Siamese _instantiate(DecodingData data) {
    return Siamese(data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Siamese fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Siamese>(map);
  }

  static Siamese fromJson(String json) {
    return ensureInitialized().decodeJson<Siamese>(json);
  }
}

mixin SiameseMappable {
  String toJson() {
    return SiameseMapper.ensureInitialized()
        .encodeJson<Siamese>(this as Siamese);
  }

  Map<String, dynamic> toMap() {
    return SiameseMapper.ensureInitialized()
        .encodeMap<Siamese>(this as Siamese);
  }

  SiameseCopyWith<Siamese, Siamese, Siamese> get copyWith =>
      _SiameseCopyWithImpl(this as Siamese, $identity, $identity);
  @override
  String toString() {
    return SiameseMapper.ensureInitialized().stringifyValue(this as Siamese);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SiameseMapper.ensureInitialized()
                .isValueEqual(this as Siamese, other));
  }

  @override
  int get hashCode {
    return SiameseMapper.ensureInitialized().hashValue(this as Siamese);
  }
}

extension SiameseValueCopy<$R, $Out> on ObjectCopyWith<$R, Siamese, $Out> {
  SiameseCopyWith<$R, Siamese, $Out> get $asSiamese =>
      $base.as((v, t, t2) => _SiameseCopyWithImpl(v, t, t2));
}

abstract class SiameseCopyWith<$R, $In extends Siamese, $Out>
    implements CatCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  SiameseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SiameseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Siamese, $Out>
    implements SiameseCopyWith<$R, Siamese, $Out> {
  _SiameseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Siamese> $mapper =
      SiameseMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  Siamese $make(CopyWithData data) => Siamese(data.get(#name, or: $value.name));

  @override
  SiameseCopyWith<$R2, Siamese, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SiameseCopyWithImpl($value, $cast, t);
}

class HumanMapper extends ClassMapperBase<Human> {
  HumanMapper._();

  static HumanMapper? _instance;
  static HumanMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HumanMapper._());
      CatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Human';

  static Cat _$cat(Human v) => v.cat;
  static const Field<Human, Cat> _f$cat = Field('cat', _$cat);

  @override
  final Map<Symbol, Field<Human, dynamic>> fields = const {
    #cat: _f$cat,
  };

  static Human _instantiate(DecodingData data) {
    return Human(data.dec(_f$cat));
  }

  @override
  final Function instantiate = _instantiate;

  static Human fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Human>(map);
  }

  static Human fromJson(String json) {
    return ensureInitialized().decodeJson<Human>(json);
  }
}

mixin HumanMappable {
  String toJson() {
    return HumanMapper.ensureInitialized().encodeJson<Human>(this as Human);
  }

  Map<String, dynamic> toMap() {
    return HumanMapper.ensureInitialized().encodeMap<Human>(this as Human);
  }

  HumanCopyWith<Human, Human, Human> get copyWith =>
      _HumanCopyWithImpl(this as Human, $identity, $identity);
  @override
  String toString() {
    return HumanMapper.ensureInitialized().stringifyValue(this as Human);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HumanMapper.ensureInitialized().isValueEqual(this as Human, other));
  }

  @override
  int get hashCode {
    return HumanMapper.ensureInitialized().hashValue(this as Human);
  }
}

extension HumanValueCopy<$R, $Out> on ObjectCopyWith<$R, Human, $Out> {
  HumanCopyWith<$R, Human, $Out> get $asHuman =>
      $base.as((v, t, t2) => _HumanCopyWithImpl(v, t, t2));
}

abstract class HumanCopyWith<$R, $In extends Human, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CatCopyWith<$R, Cat, Cat> get cat;
  $R call({Cat? cat});
  HumanCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HumanCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Human, $Out>
    implements HumanCopyWith<$R, Human, $Out> {
  _HumanCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Human> $mapper = HumanMapper.ensureInitialized();
  @override
  CatCopyWith<$R, Cat, Cat> get cat =>
      $value.cat.copyWith.$chain((v) => call(cat: v));
  @override
  $R call({Cat? cat}) =>
      $apply(FieldCopyWithData({if (cat != null) #cat: cat}));
  @override
  Human $make(CopyWithData data) => Human(data.get(#cat, or: $value.cat));

  @override
  HumanCopyWith<$R2, Human, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _HumanCopyWithImpl($value, $cast, t);
}
