// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'multi_poly_test.dart';

class AnimalMapper extends ClassMapperBase<Animal> {
  AnimalMapper._();
  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalMapper._());
      CatMapper.ensureInitialized();
      DogMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Animal';

  static String? _$name(Animal v) => v.name;

  @override
  final Map<Symbol, Field<Animal, dynamic>> fields = const {
    #name: Field<Animal, String?>('name', _$name),
  };
  @override
  final bool ignoreNull = true;

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Animal', 'type', '${data.value.get('type')}');
  }

  @override
  final Function instantiate = _instantiate;

  static Animal fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Animal>(map));
  }

  static Animal fromJson(String json) {
    return _guard((c) => c.fromJson<Animal>(json));
  }
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;

abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Animal>(
      Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
}

class CatMapper extends SubClassMapperBase<Cat> {
  CatMapper._();
  static CatMapper? _instance;
  static CatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatMapper._());
      SiameseMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Cat';

  static String? _$name(Cat v) => v.name;

  @override
  final Map<Symbol, Field<Cat, dynamic>> fields = const {
    #name: Field<Cat, String?>('name', _$name),
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Cat';
  @override
  final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Cat _instantiate(DecodingData data) {
    return Cat(data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Cat fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Cat>(map));
  }

  static Cat fromJson(String json) {
    return _guard((c) => c.fromJson<Cat>(json));
  }
}

mixin CatMappable {
  String toJson() {
    return CatMapper._guard((c) => c.toJson(this as Cat));
  }

  Map<String, dynamic> toMap() {
    return CatMapper._guard((c) => c.toMap(this as Cat));
  }

  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() {
    return CatMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CatMapper._guard((c) => c.hash(this));
  }
}

extension CatValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get $asCat =>
      $base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;

abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  CatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Animal>(
      Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
}

class _CatCopyWithImpl<$R, $Out extends Animal>
    extends ClassCopyWithBase<$R, Cat, $Out>
    implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cat> $mapper = CatMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  Cat $make(CopyWithData data) => Cat(data.get(#name, or: $value.name));

  @override
  CatCopyWith<$R2, Cat, $Out2> $chain<$R2, $Out2 extends Animal>(
          Then<Cat, $Out2> t, Then<$Out2, $R2> t2) =>
      _CatCopyWithImpl($value, t, t2);
}

class SiameseMapper extends SubClassMapperBase<Siamese> {
  SiameseMapper._();
  static SiameseMapper? _instance;
  static SiameseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SiameseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Siamese';

  static String? _$name(Siamese v) => v.name;

  @override
  final Map<Symbol, Field<Siamese, dynamic>> fields = const {
    #name: Field<Siamese, String?>('name', _$name),
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'breed';
  @override
  final dynamic discriminatorValue = 'Siamese';
  @override
  final ClassMapperBase superMapper = CatMapper.ensureInitialized();

  static Siamese _instantiate(DecodingData data) {
    return Siamese(data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Siamese fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Siamese>(map));
  }

  static Siamese fromJson(String json) {
    return _guard((c) => c.fromJson<Siamese>(json));
  }
}

mixin SiameseMappable {
  String toJson() {
    return SiameseMapper._guard((c) => c.toJson(this as Siamese));
  }

  Map<String, dynamic> toMap() {
    return SiameseMapper._guard((c) => c.toMap(this as Siamese));
  }

  SiameseCopyWith<Siamese, Siamese, Siamese> get copyWith =>
      _SiameseCopyWithImpl(this as Siamese, $identity, $identity);
  @override
  String toString() {
    return SiameseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SiameseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SiameseMapper._guard((c) => c.hash(this));
  }
}

extension SiameseValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Siamese, $Out> {
  SiameseCopyWith<$R, Siamese, $Out> get $asSiamese =>
      $base.as((v, t, t2) => _SiameseCopyWithImpl(v, t, t2));
}

typedef SiameseCopyWithBound = Animal;

abstract class SiameseCopyWith<$R, $In extends Siamese, $Out extends Animal>
    implements CatCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  SiameseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Animal>(
      Then<Siamese, $Out2> t, Then<$Out2, $R2> t2);
}

class _SiameseCopyWithImpl<$R, $Out extends Animal>
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
  SiameseCopyWith<$R2, Siamese, $Out2> $chain<$R2, $Out2 extends Animal>(
          Then<Siamese, $Out2> t, Then<$Out2, $R2> t2) =>
      _SiameseCopyWithImpl($value, t, t2);
}

class DogMapper extends SubClassMapperBase<Dog> {
  DogMapper._();
  static DogMapper? _instance;
  static DogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogMapper._());
      ShepherdMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Dog';

  static String? _$name(Dog v) => v.name;

  @override
  final Map<Symbol, Field<Dog, dynamic>> fields = const {
    #name: Field<Dog, String?>('name', _$name),
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Dog';
  @override
  final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static Dog _instantiate(DecodingData data) {
    return Dog(data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Dog fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Dog>(map));
  }

  static Dog fromJson(String json) {
    return _guard((c) => c.fromJson<Dog>(json));
  }
}

mixin DogMappable {
  String toJson() {
    return DogMapper._guard((c) => c.toJson(this as Dog));
  }

  Map<String, dynamic> toMap() {
    return DogMapper._guard((c) => c.toMap(this as Dog));
  }

  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() {
    return DogMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DogMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DogMapper._guard((c) => c.hash(this));
  }
}

extension DogValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get $asDog =>
      $base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

typedef DogCopyWithBound = Animal;

abstract class DogCopyWith<$R, $In extends Dog, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  DogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Animal>(
      Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
}

class _DogCopyWithImpl<$R, $Out extends Animal>
    extends ClassCopyWithBase<$R, Dog, $Out>
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
  DogCopyWith<$R2, Dog, $Out2> $chain<$R2, $Out2 extends Animal>(
          Then<Dog, $Out2> t, Then<$Out2, $R2> t2) =>
      _DogCopyWithImpl($value, t, t2);
}

class ShepherdMapper extends SubClassMapperBase<Shepherd> {
  ShepherdMapper._();
  static ShepherdMapper? _instance;
  static ShepherdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShepherdMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Shepherd';

  static String? _$name(Shepherd v) => v.name;

  @override
  final Map<Symbol, Field<Shepherd, dynamic>> fields = const {
    #name: Field<Shepherd, String?>('name', _$name),
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Shepherd';
  @override
  final ClassMapperBase superMapper = DogMapper.ensureInitialized();

  static Shepherd _instantiate(DecodingData data) {
    return Shepherd(data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Shepherd fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Shepherd>(map));
  }

  static Shepherd fromJson(String json) {
    return _guard((c) => c.fromJson<Shepherd>(json));
  }
}

mixin ShepherdMappable {
  String toJson() {
    return ShepherdMapper._guard((c) => c.toJson(this as Shepherd));
  }

  Map<String, dynamic> toMap() {
    return ShepherdMapper._guard((c) => c.toMap(this as Shepherd));
  }

  ShepherdCopyWith<Shepherd, Shepherd, Shepherd> get copyWith =>
      _ShepherdCopyWithImpl(this as Shepherd, $identity, $identity);
  @override
  String toString() {
    return ShepherdMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ShepherdMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ShepherdMapper._guard((c) => c.hash(this));
  }
}

extension ShepherdValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Shepherd, $Out> {
  ShepherdCopyWith<$R, Shepherd, $Out> get $asShepherd =>
      $base.as((v, t, t2) => _ShepherdCopyWithImpl(v, t, t2));
}

typedef ShepherdCopyWithBound = Animal;

abstract class ShepherdCopyWith<$R, $In extends Shepherd, $Out extends Animal>
    implements DogCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  ShepherdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Animal>(
      Then<Shepherd, $Out2> t, Then<$Out2, $R2> t2);
}

class _ShepherdCopyWithImpl<$R, $Out extends Animal>
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
  ShepherdCopyWith<$R2, Shepherd, $Out2> $chain<$R2, $Out2 extends Animal>(
          Then<Shepherd, $Out2> t, Then<$Out2, $R2> t2) =>
      _ShepherdCopyWithImpl($value, t, t2);
}
