// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'main.dart';

class BrandMapper extends EnumMapper<Brand> {
  BrandMapper._();

  static BrandMapper? _instance;
  static BrandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrandMapper._());
    }
    return _instance!;
  }

  static Brand fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Brand decode(dynamic value) {
    switch (value) {
      case 'Toyota':
        return Brand.Toyota;
      case 'Audi':
        return Brand.Audi;
      case 'BMW':
        return Brand.BMW;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Brand self) {
    switch (self) {
      case Brand.Toyota:
        return 'Toyota';
      case Brand.Audi:
        return 'Audi';
      case Brand.BMW:
        return 'BMW';
    }
  }
}

extension BrandMapperExtension on Brand {
  String toValue() {
    BrandMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Brand>(this) as String;
  }
}

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();

  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
      CarMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static const Field<Person, String> _f$name = Field('name', _$name);
  static int _$age(Person v) => v.age;
  static const Field<Person, int> _f$age =
      Field('age', _$age, opt: true, def: 18);
  static Car? _$car(Person v) => v.car;
  static const Field<Person, Car> _f$car = Field('car', _$car, opt: true);

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #name: _f$name,
    #age: _f$age,
    #car: _f$car,
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.dec(_f$name),
        age: data.dec(_f$age), car: data.dec(_f$car));
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
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonMapper.ensureInitialized()
                .isValueEqual(this as Person, other));
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CarCopyWith<$R, Car, Car>? get car;
  $R call({String? name, int? age, Car? car});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  CarCopyWith<$R, Car, Car>? get car =>
      $value.car?.copyWith.$chain((v) => call(car: v));
  @override
  $R call({String? name, int? age, Object? car = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (age != null) #age: age,
        if (car != $none) #car: car
      }));
  @override
  Person $make(CopyWithData data) => Person(data.get(#name, or: $value.name),
      age: data.get(#age, or: $value.age), car: data.get(#car, or: $value.car));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl($value, $cast, t);
}

class CarMapper extends ClassMapperBase<Car> {
  CarMapper._();

  static CarMapper? _instance;
  static CarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarMapper._());
      BrandMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Car';

  static double _$miles(Car v) => v.miles;
  static const Field<Car, double> _f$miles = Field('miles', _$miles);
  static Brand _$brand(Car v) => v.brand;
  static const Field<Car, Brand> _f$brand = Field('brand', _$brand);

  @override
  final Map<Symbol, Field<Car, dynamic>> fields = const {
    #miles: _f$miles,
    #brand: _f$brand,
  };

  static Car _instantiate(DecodingData data) {
    return Car(data.dec(_f$miles), data.dec(_f$brand));
  }

  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Car>(map);
  }

  static Car fromJson(String json) {
    return ensureInitialized().decodeJson<Car>(json);
  }
}

mixin CarMappable {
  String toJson() {
    return CarMapper.ensureInitialized().encodeJson<Car>(this as Car);
  }

  Map<String, dynamic> toMap() {
    return CarMapper.ensureInitialized().encodeMap<Car>(this as Car);
  }

  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper.ensureInitialized().stringifyValue(this as Car);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CarMapper.ensureInitialized().isValueEqual(this as Car, other));
  }

  @override
  int get hashCode {
    return CarMapper.ensureInitialized().hashValue(this as Car);
  }
}

extension CarValueCopy<$R, $Out> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get $asCar =>
      $base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

abstract class CarCopyWith<$R, $In extends Car, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? miles, Brand? brand});
  CarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CarCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Car> $mapper = CarMapper.ensureInitialized();
  @override
  $R call({double? miles, Brand? brand}) => $apply(FieldCopyWithData(
      {if (miles != null) #miles: miles, if (brand != null) #brand: brand}));
  @override
  Car $make(CopyWithData data) => Car(
      data.get(#miles, or: $value.miles), data.get(#brand, or: $value.brand));

  @override
  CarCopyWith<$R2, Car, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CarCopyWithImpl($value, $cast, t);
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
  Function get typeFactory => <T>(f) => f<Box<T>>();

  static int _$size(Box v) => v.size;
  static const Field<Box, int> _f$size = Field('size', _$size);
  static dynamic _$content(Box v) => v.content;
  static dynamic _arg$content<T>(f) => f<T>();
  static const Field<Box, dynamic> _f$content =
      Field('content', _$content, arg: _arg$content);

  @override
  final Map<Symbol, Field<Box, dynamic>> fields = const {
    #size: _f$size,
    #content: _f$content,
  };

  static Box<T> _instantiate<T>(DecodingData data) {
    return Box(data.dec(_f$size), content: data.dec(_f$content));
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
      _BoxCopyWithImpl(this as Box<T>, $identity, $identity);
  @override
  String toString() {
    return BoxMapper.ensureInitialized().stringifyValue(this as Box<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BoxMapper.ensureInitialized().isValueEqual(this as Box<T>, other));
  }

  @override
  int get hashCode {
    return BoxMapper.ensureInitialized().hashValue(this as Box<T>);
  }
}

extension BoxValueCopy<$R, $Out, T> on ObjectCopyWith<$R, Box<T>, $Out> {
  BoxCopyWith<$R, Box<T>, $Out, T> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

abstract class BoxCopyWith<$R, $In extends Box<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? size, T? content});
  BoxCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, Box<T>, $Out>
    implements BoxCopyWith<$R, Box<T>, $Out, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  $R call({int? size, T? content}) => $apply(FieldCopyWithData(
      {if (size != null) #size: size, if (content != null) #content: content}));
  @override
  Box<T> $make(CopyWithData data) => Box(data.get(#size, or: $value.size),
      content: data.get(#content, or: $value.content));

  @override
  BoxCopyWith<$R2, Box<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCopyWithImpl($value, $cast, t);
}

class ConfettiMapper extends ClassMapperBase<Confetti> {
  ConfettiMapper._();

  static ConfettiMapper? _instance;
  static ConfettiMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfettiMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Confetti';

  static String _$color(Confetti v) => v.color;
  static const Field<Confetti, String> _f$color = Field('color', _$color);

  @override
  final Map<Symbol, Field<Confetti, dynamic>> fields = const {
    #color: _f$color,
  };

  static Confetti _instantiate(DecodingData data) {
    return Confetti(data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static Confetti fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Confetti>(map);
  }

  static Confetti fromJson(String json) {
    return ensureInitialized().decodeJson<Confetti>(json);
  }
}

mixin ConfettiMappable {
  String toJson() {
    return ConfettiMapper.ensureInitialized()
        .encodeJson<Confetti>(this as Confetti);
  }

  Map<String, dynamic> toMap() {
    return ConfettiMapper.ensureInitialized()
        .encodeMap<Confetti>(this as Confetti);
  }

  ConfettiCopyWith<Confetti, Confetti, Confetti> get copyWith =>
      _ConfettiCopyWithImpl(this as Confetti, $identity, $identity);
  @override
  String toString() {
    return ConfettiMapper.ensureInitialized().stringifyValue(this as Confetti);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfettiMapper.ensureInitialized()
                .isValueEqual(this as Confetti, other));
  }

  @override
  int get hashCode {
    return ConfettiMapper.ensureInitialized().hashValue(this as Confetti);
  }
}

extension ConfettiValueCopy<$R, $Out> on ObjectCopyWith<$R, Confetti, $Out> {
  ConfettiCopyWith<$R, Confetti, $Out> get $asConfetti =>
      $base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

abstract class ConfettiCopyWith<$R, $In extends Confetti, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? color});
  ConfettiCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfettiCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Confetti, $Out>
    implements ConfettiCopyWith<$R, Confetti, $Out> {
  _ConfettiCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Confetti> $mapper =
      ConfettiMapper.ensureInitialized();
  @override
  $R call({String? color}) =>
      $apply(FieldCopyWithData({if (color != null) #color: color}));
  @override
  Confetti $make(CopyWithData data) =>
      Confetti(data.get(#color, or: $value.color));

  @override
  ConfettiCopyWith<$R2, Confetti, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConfettiCopyWithImpl($value, $cast, t);
}
