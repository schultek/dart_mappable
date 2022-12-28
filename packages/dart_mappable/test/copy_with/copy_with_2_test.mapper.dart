// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'copy_with_2_test.dart';

class AnimalMapper extends MapperBase<Animal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AnimalMapper()},
      ))
        ..linkAll({CatMapper.container, DogMapper.container}));

  @override
  AnimalMapperElement createElement(MapperContainer container) {
    return AnimalMapperElement._(this, container);
  }
}

class AnimalMapperElement extends MapperElementBase<Animal> {
  AnimalMapperElement._(super.mapper, super.container);

  @override
  String stringify(Animal self) =>
      'Animal(name: ${container.asString(self.name)})';
}

mixin AnimalMappable {
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;

abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal>
    implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class CatMapper extends MapperBase<Cat> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CatMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  CatMapperElement createElement(MapperContainer container) {
    return CatMapperElement._(this, container);
  }
}

class CatMapperElement extends MapperElementBase<Cat> {
  CatMapperElement._(super.mapper, super.container);

  @override
  String stringify(Cat self) =>
      'Cat(name: ${container.asString(self.name)}, color: ${container.asString(self.color)})';
}

mixin CatMappable {
  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() => CatMapper.container.asString(this);
}

extension CatValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get asCat =>
      base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;

abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  CatCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Cat, $Out> implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override
  CatCopyWith<$R2, Cat, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Cat, $Out2> t, Then<$Out2, $R2> t2) =>
      _CatCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, String? color}) =>
      $then(Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends MapperBase<Dog> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DogMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  DogMapperElement createElement(MapperContainer container) {
    return DogMapperElement._(this, container);
  }
}

class DogMapperElement extends MapperElementBase<Dog> {
  DogMapperElement._(super.mapper, super.container);

  @override
  String stringify(Dog self) => 'Dog(name: ${container.asString(self.name)})';
}

mixin DogMappable {
  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() => DogMapper.container.asString(this);
}

extension DogValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get asDog =>
      base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

typedef DogCopyWithBound = Animal;

abstract class DogCopyWith<$R, $In extends Dog, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  DogCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name});
}

class _DogCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Dog, $Out> implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override
  DogCopyWith<$R2, Dog, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Dog, $Out2> t, Then<$Out2, $R2> t2) =>
      _DogCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(Dog(name ?? $value.name));
}

class ZooMapper extends MapperBase<Zoo> {
  static MapperContainer container = MapperContainer(
    mappers: {ZooMapper()},
  )..linkAll({AnimalMapper.container});

  @override
  ZooMapperElement createElement(MapperContainer container) {
    return ZooMapperElement._(this, container);
  }
}

class ZooMapperElement extends MapperElementBase<Zoo> {
  ZooMapperElement._(super.mapper, super.container);

  @override
  String stringify(Zoo self) =>
      'Zoo(animal: ${container.asString(self.animal)})';
}

mixin ZooMappable {
  ZooCopyWith<Zoo, Zoo, Zoo> get copyWith =>
      _ZooCopyWithImpl(this as Zoo, $identity, $identity);
  @override
  String toString() => ZooMapper.container.asString(this);
}

extension ZooValueCopy<$R, $Out extends Zoo> on ObjectCopyWith<$R, Zoo, $Out> {
  ZooCopyWith<$R, Zoo, $Out> get asZoo =>
      base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;

abstract class ZooCopyWith<$R, $In extends Zoo, $Out extends Zoo>
    implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Zoo>(
      Then<Zoo, $Out2> t, Then<$Out2, $R2> t2);
  AnimalCopyWith<$R, Animal, Animal> get animal;
  $R call({Animal? animal});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo> extends CopyWithBase<$R, Zoo, $Out>
    implements ZooCopyWith<$R, Zoo, $Out> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override
  ZooCopyWith<$R2, Zoo, $Out2> chain<$R2, $Out2 extends Zoo>(
          Then<Zoo, $Out2> t, Then<$Out2, $R2> t2) =>
      _ZooCopyWithImpl($value, t, t2);

  @override
  AnimalCopyWith<$R, Animal, Animal> get animal =>
      $value.animal.copyWith.chain($identity, (v) => call(animal: v));
  @override
  $R call({Animal? animal}) => $then(Zoo(animal ?? $value.animal));
}

class AMapper extends MapperBase<A> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AMapper()},
      ))
        ..linkAll({CMapper.container}));

  @override
  AMapperElement createElement(MapperContainer container) {
    return AMapperElement._(this, container);
  }

  @override
  Function get typeFactory => <T>(f) => f<A<T>>();
  static A<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<A<T>>(map);
  static A<T> fromJson<T>(String json) => container.fromJson<A<T>>(json);
}

class AMapperElement extends MapperElementBase<A> {
  AMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  A<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  A<T> fromMap<T>(Map<String, dynamic> map) => A();

  @override
  Function get encoder => encode;
  dynamic encode<T>(A<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(A<T> a) => {...container.$type<A<T>>(a)};

  @override
  String stringify(A self) => 'A()';
  @override
  int hash(A self) => 0;
  @override
  bool equals(A self, A other) => true;
}

mixin AMappable<T> {
  String toJson() => AMapper.container.toJson(this as A<T>);
  Map<String, dynamic> toMap() => AMapper.container.toMap(this as A<T>);
  ACopyWith<A<T>, A<T>, A<T>, T> get copyWith =>
      _ACopyWithImpl(this as A<T>, $identity, $identity);
  @override
  String toString() => AMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AMapper.container.isEqual(this, other));
  @override
  int get hashCode => AMapper.container.hash(this);
}

extension AValueCopy<$R, $Out extends A, T> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get asA =>
      base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A<T>, $Out extends A, T>
    implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends A>(
      Then<A<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ACopyWithImpl<$R, $Out extends A, T> extends CopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A<T>, $Out2, T> chain<$R2, $Out2 extends A>(
          Then<A<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call() => $then(A());
}

class CMapper extends MapperBase<C> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CMapper()},
      ))
        ..linkAll({AMapper.container}));

  @override
  CMapperElement createElement(MapperContainer container) {
    return CMapperElement._(this, container);
  }

  @override
  Function get typeFactory => <T>(f) => f<C<T>>();
  static C<T> fromMap<T>(Map<String, dynamic> map) =>
      container.fromMap<C<T>>(map);
  static C<T> fromJson<T>(String json) => container.fromJson<C<T>>(json);
}

class CMapperElement extends MapperElementBase<C> {
  CMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  C<T> decode<T>(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  C<T> fromMap<T>(Map<String, dynamic> map) => C();

  @override
  Function get encoder => encode;
  dynamic encode<T>(C<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(C<T> c) => {...container.$type<C<T>>(c)};

  @override
  String stringify(C self) => 'C()';
  @override
  int hash(C self) => 0;
  @override
  bool equals(C self, C other) => true;
}

mixin CMappable<T> {
  String toJson() => CMapper.container.toJson(this as C<T>);
  Map<String, dynamic> toMap() => CMapper.container.toMap(this as C<T>);
  CCopyWith<C<T>, C<T>, C<T>, T> get copyWith =>
      _CCopyWithImpl(this as C<T>, $identity, $identity);
  @override
  String toString() => CMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CMapper.container.isEqual(this, other));
  @override
  int get hashCode => CMapper.container.hash(this);
}

extension CValueCopy<$R, $Out extends A, T> on ObjectCopyWith<$R, C<T>, $Out> {
  CCopyWith<$R, C<T>, $Out, T> get asC =>
      base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

typedef CCopyWithBound = A;

abstract class CCopyWith<$R, $In extends C<T>, $Out extends A, T>
    implements ACopyWith<$R, $In, $Out, T> {
  CCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends A>(
      Then<C<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _CCopyWithImpl<$R, $Out extends A, T> extends CopyWithBase<$R, C<T>, $Out>
    implements CCopyWith<$R, C<T>, $Out, T> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override
  CCopyWith<$R2, C<T>, $Out2, T> chain<$R2, $Out2 extends A>(
          Then<C<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _CCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(C());
}

class BMapper extends MapperBase<B> {
  static MapperContainer container = MapperContainer(
    mappers: {BMapper()},
  )..linkAll({AMapper.container});

  @override
  BMapperElement createElement(MapperContainer container) {
    return BMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<B>;
  static final fromJson = container.fromJson<B>;
}

class BMapperElement extends MapperElementBase<B> {
  BMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  B decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  B fromMap(Map<String, dynamic> map) =>
      B(container.$get(map, 'list'), container.$getOpt(map, 'a'));

  @override
  Function get encoder => encode;
  dynamic encode(B v) => toMap(v);
  Map<String, dynamic> toMap(B b) =>
      {'list': container.$enc(b.list, 'list'), 'a': container.$enc(b.a, 'a')};

  @override
  String stringify(B self) =>
      'B(list: ${container.asString(self.list)}, a: ${container.asString(self.a)})';
  @override
  int hash(B self) => container.hash(self.list) ^ container.hash(self.a);
  @override
  bool equals(B self, B other) =>
      container.isEqual(self.list, other.list) &&
      container.isEqual(self.a, other.a);
}

mixin BMappable {
  String toJson() => BMapper.container.toJson(this as B);
  Map<String, dynamic> toMap() => BMapper.container.toMap(this as B);
  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() => BMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BMapper.container.isEqual(this, other));
  @override
  int get hashCode => BMapper.container.hash(this);
}

extension BValueCopy<$R, $Out extends B> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get asB =>
      base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = B;

abstract class BCopyWith<$R, $In extends B, $Out extends B>
    implements ObjectCopyWith<$R, $In, $Out> {
  BCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends B>(
      Then<B, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, A<dynamic>?, ACopyWith<$R, A<dynamic>, A<dynamic>, dynamic>?>
      get list;
  ACopyWith<$R, A<dynamic>, A<dynamic>, dynamic>? get a;
  $R call({List<A<dynamic>?>? list, A<dynamic>? a});
}

class _BCopyWithImpl<$R, $Out extends B> extends CopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override
  BCopyWith<$R2, B, $Out2> chain<$R2, $Out2 extends B>(
          Then<B, $Out2> t, Then<$Out2, $R2> t2) =>
      _BCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, A<dynamic>?, ACopyWith<$R, A<dynamic>, A<dynamic>, dynamic>?>
      get list => ListCopyWith($value.list,
          (v, t) => v?.copyWith.chain($identity, t), (v) => call(list: v));
  @override
  ACopyWith<$R, A<dynamic>, A<dynamic>, dynamic>? get a =>
      $value.a?.copyWith.chain($identity, (v) => call(a: v));
  @override
  $R call({List<A<dynamic>?>? list, Object? a = $none}) =>
      $then(B(list ?? $value.list, or(a, $value.a)));
}
