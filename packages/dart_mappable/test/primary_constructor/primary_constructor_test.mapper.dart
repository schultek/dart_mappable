// @dart = 3.13
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'primary_constructor_test.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();

  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static const Field<Person, String> _f$name = Field('name', _$name);
  static int _$age(Person v) => v.age;
  static const Field<Person, int> _f$age = Field(
    'age',
    _$age,
    opt: true,
    def: 20,
  );

  @override
  final MappableFields<Person> fields = const {#name: _f$name, #age: _f$age};

  static Person _instantiate(DecodingData data) {
    return Person(data.dec(_f$name), age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl<Person, Person>(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return PersonMapper.ensureInitialized().equalsValue(this as Person, other);
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? age});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  $R call({String? name, int? age}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (age != null) #age: age,
    }),
  );
  @override
  Person $make(CopyWithData data) => Person(
    data.get(#name, or: $value.name),
    age: data.get(#age, or: $value.age),
  );

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PointMapper extends ClassMapperBase<Point> {
  PointMapper._();

  static PointMapper? _instance;
  static PointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PointMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Point';

  static int _$x(Point v) => v.x;
  static const Field<Point, int> _f$x = Field('x', _$x);
  static int _$y(Point v) => v.y;
  static const Field<Point, int> _f$y = Field('y', _$y, key: r'delta');

  @override
  final MappableFields<Point> fields = const {#x: _f$x, #y: _f$y};

  static Point _instantiate(DecodingData data) {
    return Point(data.dec(_f$x), data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static Point fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Point>(map);
  }

  static Point fromJson(String json) {
    return ensureInitialized().decodeJson<Point>(json);
  }
}

mixin PointMappable {
  String toJson() {
    return PointMapper.ensureInitialized().encodeJson<Point>(this as Point);
  }

  Map<String, dynamic> toMap() {
    return PointMapper.ensureInitialized().encodeMap<Point>(this as Point);
  }

  PointCopyWith<Point, Point, Point> get copyWith =>
      _PointCopyWithImpl<Point, Point>(this as Point, $identity, $identity);
  @override
  String toString() {
    return PointMapper.ensureInitialized().stringifyValue(this as Point);
  }

  @override
  bool operator ==(Object other) {
    return PointMapper.ensureInitialized().equalsValue(this as Point, other);
  }

  @override
  int get hashCode {
    return PointMapper.ensureInitialized().hashValue(this as Point);
  }
}

extension PointValueCopy<$R, $Out> on ObjectCopyWith<$R, Point, $Out> {
  PointCopyWith<$R, Point, $Out> get $asPoint =>
      $base.as((v, t, t2) => _PointCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PointCopyWith<$R, $In extends Point, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? x, int? delta});
  PointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PointCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Point, $Out>
    implements PointCopyWith<$R, Point, $Out> {
  _PointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Point> $mapper = PointMapper.ensureInitialized();
  @override
  $R call({int? x, int? delta}) => $apply(
    FieldCopyWithData({if (x != null) #x: x, if (delta != null) #delta: delta}),
  );
  @override
  Point $make(CopyWithData data) =>
      Point(data.get(#x, or: $value.x), data.get(#delta, or: $value.y));

  @override
  PointCopyWith<$R2, Point, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PointCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

  static String _$name(Animal v) => v.name;
  static const Field<Animal, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Animal> fields = const {#name: _f$name};

  static Animal _instantiate(DecodingData data) {
    return Animal(data.dec(_f$name));
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
  String toJson() {
    return AnimalMapper.ensureInitialized().encodeJson<Animal>(this as Animal);
  }

  Map<String, dynamic> toMap() {
    return AnimalMapper.ensureInitialized().encodeMap<Animal>(this as Animal);
  }

  AnimalCopyWith<Animal, Animal, Animal> get copyWith =>
      _AnimalCopyWithImpl<Animal, Animal>(this as Animal, $identity, $identity);
  @override
  String toString() {
    return AnimalMapper.ensureInitialized().stringifyValue(this as Animal);
  }

  @override
  bool operator ==(Object other) {
    return AnimalMapper.ensureInitialized().equalsValue(this as Animal, other);
  }

  @override
  int get hashCode {
    return AnimalMapper.ensureInitialized().hashValue(this as Animal);
  }
}

extension AnimalValueCopy<$R, $Out> on ObjectCopyWith<$R, Animal, $Out> {
  AnimalCopyWith<$R, Animal, $Out> get $asAnimal =>
      $base.as((v, t, t2) => _AnimalCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AnimalCopyWith<$R, $In extends Animal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AnimalCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Animal, $Out>
    implements AnimalCopyWith<$R, Animal, $Out> {
  _AnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Animal> $mapper = AnimalMapper.ensureInitialized();
  @override
  $R call({String? name}) =>
      $apply(FieldCopyWithData({if (name != null) #name: name}));
  @override
  Animal $make(CopyWithData data) => Animal(data.get(#name, or: $value.name));

  @override
  AnimalCopyWith<$R2, Animal, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AnimalCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DogMapper extends ClassMapperBase<Dog> {
  DogMapper._();

  static DogMapper? _instance;
  static DogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DogMapper._());
      AnimalMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Dog';

  static String _$name(Dog v) => v.name;
  static const Field<Dog, String> _f$name = Field('name', _$name);
  static int _$barkVolume(Dog v) => v.barkVolume;
  static const Field<Dog, int> _f$barkVolume = Field(
    'barkVolume',
    _$barkVolume,
  );

  @override
  final MappableFields<Dog> fields = const {
    #name: _f$name,
    #barkVolume: _f$barkVolume,
  };

  static Dog _instantiate(DecodingData data) {
    return Dog(data.dec(_f$name), data.dec(_f$barkVolume));
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
  $R call({String? name, int? barkVolume});
  DogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Dog, $Out>
    implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dog> $mapper = DogMapper.ensureInitialized();
  @override
  $R call({String? name, int? barkVolume}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (barkVolume != null) #barkVolume: barkVolume,
    }),
  );
  @override
  Dog $make(CopyWithData data) => Dog(
    data.get(#name, or: $value.name),
    data.get(#barkVolume, or: $value.barkVolume),
  );

  @override
  DogCopyWith<$R2, Dog, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DogCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CatMapper extends ClassMapperBase<Cat> {
  CatMapper._();

  static CatMapper? _instance;
  static CatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatMapper._());
      AnimalMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Cat';

  static String _$name(Cat v) => v.name;
  static const Field<Cat, String> _f$name = Field('name', _$name);
  static bool _$isLazy(Cat v) => v.isLazy;
  static const Field<Cat, bool> _f$isLazy = Field('isLazy', _$isLazy);

  @override
  final MappableFields<Cat> fields = const {#name: _f$name, #isLazy: _f$isLazy};

  static Cat _instantiate(DecodingData data) {
    return Cat(data.dec(_f$name), data.dec(_f$isLazy));
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
  $R call({String? name, bool? isLazy});
  CatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CatCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Cat, $Out>
    implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cat> $mapper = CatMapper.ensureInitialized();
  @override
  $R call({String? name, bool? isLazy}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (isLazy != null) #isLazy: isLazy,
    }),
  );
  @override
  Cat $make(CopyWithData data) => Cat(
    data.get(#name, or: $value.name),
    data.get(#isLazy, or: $value.isLazy),
  );

  @override
  CatCopyWith<$R2, Cat, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ConfigMapper extends ClassMapperBase<Config> {
  ConfigMapper._();

  static ConfigMapper? _instance;
  static ConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Config';

  static String _$host(Config v) => v.host;
  static const Field<Config, String> _f$host = Field(
    'host',
    _$host,
    opt: true,
    def: 'localhost',
  );
  static int _$port(Config v) => v.port;
  static const Field<Config, int> _f$port = Field(
    'port',
    _$port,
    opt: true,
    def: 8080,
  );

  @override
  final MappableFields<Config> fields = const {#host: _f$host, #port: _f$port};

  static Config _instantiate(DecodingData data) {
    return Config.named(host: data.dec(_f$host), port: data.dec(_f$port));
  }

  @override
  final Function instantiate = _instantiate;

  static Config fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Config>(map);
  }

  static Config fromJson(String json) {
    return ensureInitialized().decodeJson<Config>(json);
  }
}

mixin ConfigMappable {
  String toJson() {
    return ConfigMapper.ensureInitialized().encodeJson<Config>(this as Config);
  }

  Map<String, dynamic> toMap() {
    return ConfigMapper.ensureInitialized().encodeMap<Config>(this as Config);
  }

  ConfigCopyWith<Config, Config, Config> get copyWith =>
      _ConfigCopyWithImpl<Config, Config>(this as Config, $identity, $identity);
  @override
  String toString() {
    return ConfigMapper.ensureInitialized().stringifyValue(this as Config);
  }

  @override
  bool operator ==(Object other) {
    return ConfigMapper.ensureInitialized().equalsValue(this as Config, other);
  }

  @override
  int get hashCode {
    return ConfigMapper.ensureInitialized().hashValue(this as Config);
  }
}

extension ConfigValueCopy<$R, $Out> on ObjectCopyWith<$R, Config, $Out> {
  ConfigCopyWith<$R, Config, $Out> get $asConfig =>
      $base.as((v, t, t2) => _ConfigCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConfigCopyWith<$R, $In extends Config, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? host, int? port});
  ConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Config, $Out>
    implements ConfigCopyWith<$R, Config, $Out> {
  _ConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Config> $mapper = ConfigMapper.ensureInitialized();
  @override
  $R call({String? host, int? port}) => $apply(
    FieldCopyWithData({
      if (host != null) #host: host,
      if (port != null) #port: port,
    }),
  );
  @override
  Config $make(CopyWithData data) => Config.named(
    host: data.get(#host, or: $value.host),
    port: data.get(#port, or: $value.port),
  );

  @override
  ConfigCopyWith<$R2, Config, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BoxMapper extends ClassMapperBase<Box> {
  BoxMapper._();

  static BoxMapper? _instance;
  static BoxMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Box';
  @override
  Function get typeFactory =>
      <T>(f) => f<Box<T>>();

  static dynamic _$value(Box v) => v.value;
  static dynamic _arg$value<T>(f) => f<T>();
  static const Field<Box, dynamic> _f$value = Field(
    'value',
    _$value,
    arg: _arg$value,
  );

  @override
  final MappableFields<Box> fields = const {#value: _f$value};

  static Box<T> _instantiate<T>(DecodingData data) {
    return Box(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Box<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Box<T>>(map);
  }

  static Box<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Box<T>>(json);
  }
}

mixin BoxMappable<T> {
  String toJson() {
    return BoxMapper.ensureInitialized().encodeJson<Box<T>>(this as Box<T>);
  }

  Map<String, dynamic> toMap() {
    return BoxMapper.ensureInitialized().encodeMap<Box<T>>(this as Box<T>);
  }

  BoxCopyWith<Box<T>, Box<T>, Box<T>, T> get copyWith =>
      _BoxCopyWithImpl<Box<T>, Box<T>, T>(this as Box<T>, $identity, $identity);
  @override
  String toString() {
    return BoxMapper.ensureInitialized().stringifyValue(this as Box<T>);
  }

  @override
  bool operator ==(Object other) {
    return BoxMapper.ensureInitialized().equalsValue(this as Box<T>, other);
  }

  @override
  int get hashCode {
    return BoxMapper.ensureInitialized().hashValue(this as Box<T>);
  }
}

extension BoxValueCopy<$R, $Out, T> on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? value});
  BoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  $R call({Object? value = $none}) =>
      $apply(FieldCopyWithData({if (value != $none) #value: value}));
  @override
  Box<T> $make(CopyWithData data) => Box(data.get(#value, or: $value.value));

  @override
  BoxCopyWith<$R2, Box<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

