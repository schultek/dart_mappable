// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'implements_mixin_test.dart';

class VehicleMapper extends ClassMapperBase<Vehicle> {
  VehicleMapper._();

  static VehicleMapper? _instance;
  static VehicleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VehicleMapper._());
      CarMapper.ensureInitialized();
      BikeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Vehicle';

  static String _$name(Vehicle v) => v.name;
  static const Field<Vehicle, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Vehicle> fields = const {#name: _f$name};

  static Vehicle _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Vehicle',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Vehicle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Vehicle>(map);
  }

  static Vehicle fromJson(String json) {
    return ensureInitialized().decodeJson<Vehicle>(json);
  }
}

mixin VehicleMappable {
  String toJson();
  Map<String, dynamic> toMap();
  VehicleCopyWith<Vehicle, Vehicle, Vehicle> get copyWith;
}

abstract class VehicleCopyWith<$R, $In extends Vehicle, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  VehicleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CarMapper extends SubClassMapperBase<Car> {
  CarMapper._();

  static CarMapper? _instance;
  static CarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarMapper._());
      VehicleMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Car';

  static String _$name(Car v) => v.name;
  static const Field<Car, String> _f$name = Field('name', _$name);
  static int _$doors(Car v) => v.doors;
  static const Field<Car, int> _f$doors = Field('doors', _$doors);

  @override
  final MappableFields<Car> fields = const {#name: _f$name, #doors: _f$doors};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Car';
  @override
  late final ClassMapperBase superMapper = VehicleMapper.ensureInitialized();

  static Car _instantiate(DecodingData data) {
    return Car(data.dec(_f$name), data.dec(_f$doors));
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
      _CarCopyWithImpl<Car, Car>(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper.ensureInitialized().stringifyValue(this as Car);
  }

  @override
  bool operator ==(Object other) {
    return CarMapper.ensureInitialized().equalsValue(this as Car, other);
  }

  @override
  int get hashCode {
    return CarMapper.ensureInitialized().hashValue(this as Car);
  }
}

extension CarValueCopy<$R, $Out> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get $asCar =>
      $base.as((v, t, t2) => _CarCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CarCopyWith<$R, $In extends Car, $Out>
    implements VehicleCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, int? doors});
  CarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CarCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Car> $mapper = CarMapper.ensureInitialized();
  @override
  $R call({String? name, int? doors}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (doors != null) #doors: doors,
    }),
  );
  @override
  Car $make(CopyWithData data) =>
      Car(data.get(#name, or: $value.name), data.get(#doors, or: $value.doors));

  @override
  CarCopyWith<$R2, Car, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CarCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BikeMapper extends SubClassMapperBase<Bike> {
  BikeMapper._();

  static BikeMapper? _instance;
  static BikeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BikeMapper._());
      VehicleMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Bike';

  static String _$name(Bike v) => v.name;
  static const Field<Bike, String> _f$name = Field('name', _$name);
  static int _$gears(Bike v) => v.gears;
  static const Field<Bike, int> _f$gears = Field('gears', _$gears);

  @override
  final MappableFields<Bike> fields = const {#name: _f$name, #gears: _f$gears};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'bike';
  @override
  late final ClassMapperBase superMapper = VehicleMapper.ensureInitialized();

  static Bike _instantiate(DecodingData data) {
    return Bike(data.dec(_f$name), data.dec(_f$gears));
  }

  @override
  final Function instantiate = _instantiate;

  static Bike fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Bike>(map);
  }

  static Bike fromJson(String json) {
    return ensureInitialized().decodeJson<Bike>(json);
  }
}

mixin BikeMappable {
  String toJson() {
    return BikeMapper.ensureInitialized().encodeJson<Bike>(this as Bike);
  }

  Map<String, dynamic> toMap() {
    return BikeMapper.ensureInitialized().encodeMap<Bike>(this as Bike);
  }

  BikeCopyWith<Bike, Bike, Bike> get copyWith =>
      _BikeCopyWithImpl<Bike, Bike>(this as Bike, $identity, $identity);
  @override
  String toString() {
    return BikeMapper.ensureInitialized().stringifyValue(this as Bike);
  }

  @override
  bool operator ==(Object other) {
    return BikeMapper.ensureInitialized().equalsValue(this as Bike, other);
  }

  @override
  int get hashCode {
    return BikeMapper.ensureInitialized().hashValue(this as Bike);
  }
}

extension BikeValueCopy<$R, $Out> on ObjectCopyWith<$R, Bike, $Out> {
  BikeCopyWith<$R, Bike, $Out> get $asBike =>
      $base.as((v, t, t2) => _BikeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BikeCopyWith<$R, $In extends Bike, $Out>
    implements VehicleCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, int? gears});
  BikeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BikeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Bike, $Out>
    implements BikeCopyWith<$R, Bike, $Out> {
  _BikeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Bike> $mapper = BikeMapper.ensureInitialized();
  @override
  $R call({String? name, int? gears}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (gears != null) #gears: gears,
    }),
  );
  @override
  Bike $make(CopyWithData data) => Bike(
    data.get(#name, or: $value.name),
    data.get(#gears, or: $value.gears),
  );

  @override
  BikeCopyWith<$R2, Bike, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BikeCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

  static String _$tag(Box v) => v.tag;
  static const Field<Box, String> _f$tag = Field('tag', _$tag);
  static int _$size(Box v) => v.size;
  static const Field<Box, int> _f$size = Field('size', _$size);

  @override
  final MappableFields<Box> fields = const {#tag: _f$tag, #size: _f$size};

  static Box _instantiate(DecodingData data) {
    return Box(data.dec(_f$tag), data.dec(_f$size));
  }

  @override
  final Function instantiate = _instantiate;

  static Box fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Box>(map);
  }

  static Box fromJson(String json) {
    return ensureInitialized().decodeJson<Box>(json);
  }
}

mixin BoxMappable {
  String toJson() {
    return BoxMapper.ensureInitialized().encodeJson<Box>(this as Box);
  }

  Map<String, dynamic> toMap() {
    return BoxMapper.ensureInitialized().encodeMap<Box>(this as Box);
  }

  BoxCopyWith<Box, Box, Box> get copyWith =>
      _BoxCopyWithImpl<Box, Box>(this as Box, $identity, $identity);
  @override
  String toString() {
    return BoxMapper.ensureInitialized().stringifyValue(this as Box);
  }

  @override
  bool operator ==(Object other) {
    return BoxMapper.ensureInitialized().equalsValue(this as Box, other);
  }

  @override
  int get hashCode {
    return BoxMapper.ensureInitialized().hashValue(this as Box);
  }
}

extension BoxValueCopy<$R, $Out> on ObjectCopyWith<$R, Box, $Out> {
  BoxCopyWith<$R, Box, $Out> get $asBox =>
      $base.as((v, t, t2) => _BoxCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BoxCopyWith<$R, $In extends Box, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? tag, int? size});
  BoxCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoxCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Box, $Out>
    implements BoxCopyWith<$R, Box, $Out> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Box> $mapper = BoxMapper.ensureInitialized();
  @override
  $R call({String? tag, int? size}) => $apply(
    FieldCopyWithData({
      if (tag != null) #tag: tag,
      if (size != null) #size: size,
    }),
  );
  @override
  Box $make(CopyWithData data) =>
      Box(data.get(#tag, or: $value.tag), data.get(#size, or: $value.size));

  @override
  BoxCopyWith<$R2, Box, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoxCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ShapeMapper extends ClassMapperBase<Shape> {
  ShapeMapper._();

  static ShapeMapper? _instance;
  static ShapeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShapeMapper._());
      CircleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Shape';

  @override
  final MappableFields<Shape> fields = const {};

  static Shape _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Shape',
      'kind',
      '${data.value['kind']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Shape fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Shape>(map);
  }

  static Shape fromJson(String json) {
    return ensureInitialized().decodeJson<Shape>(json);
  }
}

mixin ShapeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ShapeCopyWith<Shape, Shape, Shape> get copyWith;
}

abstract class ShapeCopyWith<$R, $In extends Shape, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ShapeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CircleMapper extends SubClassMapperBase<Circle> {
  CircleMapper._();

  static CircleMapper? _instance;
  static CircleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CircleMapper._());
      ShapeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Circle';

  static String _$id(Circle v) => v.id;
  static const Field<Circle, String> _f$id = Field('id', _$id);
  static String _$tag(Circle v) => v.tag;
  static const Field<Circle, String> _f$tag = Field('tag', _$tag);
  static double _$radius(Circle v) => v.radius;
  static const Field<Circle, double> _f$radius = Field('radius', _$radius);

  @override
  final MappableFields<Circle> fields = const {
    #id: _f$id,
    #tag: _f$tag,
    #radius: _f$radius,
  };

  @override
  final String discriminatorKey = 'kind';
  @override
  final dynamic discriminatorValue = 'Circle';
  @override
  late final ClassMapperBase superMapper = ShapeMapper.ensureInitialized();

  static Circle _instantiate(DecodingData data) {
    return Circle(data.dec(_f$id), data.dec(_f$tag), data.dec(_f$radius));
  }

  @override
  final Function instantiate = _instantiate;

  static Circle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Circle>(map);
  }

  static Circle fromJson(String json) {
    return ensureInitialized().decodeJson<Circle>(json);
  }
}

mixin CircleMappable {
  String toJson() {
    return CircleMapper.ensureInitialized().encodeJson<Circle>(this as Circle);
  }

  Map<String, dynamic> toMap() {
    return CircleMapper.ensureInitialized().encodeMap<Circle>(this as Circle);
  }

  CircleCopyWith<Circle, Circle, Circle> get copyWith =>
      _CircleCopyWithImpl<Circle, Circle>(this as Circle, $identity, $identity);
  @override
  String toString() {
    return CircleMapper.ensureInitialized().stringifyValue(this as Circle);
  }

  @override
  bool operator ==(Object other) {
    return CircleMapper.ensureInitialized().equalsValue(this as Circle, other);
  }

  @override
  int get hashCode {
    return CircleMapper.ensureInitialized().hashValue(this as Circle);
  }
}

extension CircleValueCopy<$R, $Out> on ObjectCopyWith<$R, Circle, $Out> {
  CircleCopyWith<$R, Circle, $Out> get $asCircle =>
      $base.as((v, t, t2) => _CircleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CircleCopyWith<$R, $In extends Circle, $Out>
    implements ShapeCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? tag, double? radius});
  CircleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CircleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Circle, $Out>
    implements CircleCopyWith<$R, Circle, $Out> {
  _CircleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Circle> $mapper = CircleMapper.ensureInitialized();
  @override
  $R call({String? id, String? tag, double? radius}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (tag != null) #tag: tag,
      if (radius != null) #radius: radius,
    }),
  );
  @override
  Circle $make(CopyWithData data) => Circle(
    data.get(#id, or: $value.id),
    data.get(#tag, or: $value.tag),
    data.get(#radius, or: $value.radius),
  );

  @override
  CircleCopyWith<$R2, Circle, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CircleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

