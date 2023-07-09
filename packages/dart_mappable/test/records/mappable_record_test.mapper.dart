// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'mappable_record_test.dart';

class LocationMapper extends ClassMapperBase<Location> {
  LocationMapper._();

  static LocationMapper? _instance;
  static LocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationMapper._());
      PointMapper.ensureInitialized();
      OffsetMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Location';

  static Point _$point(Location v) => v.point;
  static const Field<Location, Point> _f$point = Field('point', _$point);
  static Offset<dynamic> _$offset(Location v) => v.offset;
  static const Field<Location, Offset<dynamic>> _f$offset =
      Field('offset', _$offset);

  @override
  final Map<Symbol, Field<Location, dynamic>> fields = const {
    #point: _f$point,
    #offset: _f$offset,
  };

  static Location _instantiate(DecodingData data) {
    return Location(data.dec(_f$point), data.dec(_f$offset));
  }

  @override
  final Function instantiate = _instantiate;

  static Location fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Location>(map);
  }

  static Location fromJson(String json) {
    return ensureInitialized().decodeJson<Location>(json);
  }
}

mixin LocationMappable {
  String toJson() {
    return LocationMapper.ensureInitialized()
        .encodeJson<Location>(this as Location);
  }

  Map<String, dynamic> toMap() {
    return LocationMapper.ensureInitialized()
        .encodeMap<Location>(this as Location);
  }

  LocationCopyWith<Location, Location, Location> get copyWith =>
      _LocationCopyWithImpl(this as Location, $identity, $identity);
  @override
  String toString() {
    return LocationMapper.ensureInitialized().stringifyValue(this as Location);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocationMapper.ensureInitialized()
                .isValueEqual(this as Location, other));
  }

  @override
  int get hashCode {
    return LocationMapper.ensureInitialized().hashValue(this as Location);
  }
}

extension LocationValueCopy<$R, $Out> on ObjectCopyWith<$R, Location, $Out> {
  LocationCopyWith<$R, Location, $Out> get $asLocation =>
      $base.as((v, t, t2) => _LocationCopyWithImpl(v, t, t2));
}

abstract class LocationCopyWith<$R, $In extends Location, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Point? point, Offset<dynamic>? offset});
  LocationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Location, $Out>
    implements LocationCopyWith<$R, Location, $Out> {
  _LocationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Location> $mapper =
      LocationMapper.ensureInitialized();
  @override
  $R call({Point? point, Offset<dynamic>? offset}) => $apply(FieldCopyWithData(
      {if (point != null) #point: point, if (offset != null) #offset: offset}));
  @override
  Location $make(CopyWithData data) => Location(
      data.get(#point, or: $value.point), data.get(#offset, or: $value.offset));

  @override
  LocationCopyWith<$R2, Location, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocationCopyWithImpl($value, $cast, t);
}

class PointMapper extends RecordMapperBase<Point> {
  static PointMapper? _instance;
  PointMapper._();

  static PointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PointMapper._());
      MapperBase.addType(<A, B>(f) => f<({A x, B y})>());
    }
    return _instance!;
  }

  static double _$x(Point v) => v.x;
  static const Field<Point, double> _f$x = Field('x', _$x, key: 'a');
  static double _$y(Point v) => v.y;
  static const Field<Point, double> _f$y = Field('y', _$y);

  @override
  final Map<Symbol, Field<Point, dynamic>> fields = const {
    #x: _f$x,
    #y: _f$y,
  };

  @override
  Function get typeFactory => (f) => f<Point>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  static Point _instantiate(DecodingData<Point> data) {
    return (x: data.dec(_f$x), y: data.dec(_f$y));
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

extension PointMappable on Point {
  Map<String, dynamic> toMap() {
    return PointMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return PointMapper.ensureInitialized().encodeJson(this);
  }
}

class OffsetMapper extends RecordMapperBase<Offset> {
  static OffsetMapper? _instance;
  OffsetMapper._();

  static OffsetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OffsetMapper._());
      MapperBase.addType(<A, B>(f) => f<({A x, B y})>());
    }
    return _instance!;
  }

  static double _$x(Offset v) => v.x;
  static const Field<Offset, double> _f$x = Field('x', _$x);
  static dynamic _$y(Offset v) => v.y;
  static dynamic _arg$y<T>(f) => f<T>();
  static const Field<Offset, dynamic> _f$y = Field('y', _$y, arg: _arg$y);

  @override
  final Map<Symbol, Field<Offset, dynamic>> fields = const {
    #x: _f$x,
    #y: _f$y,
  };

  @override
  Function get typeFactory => <T>(f) => f<Offset<T>>();

  @override
  List<Type> apply(MappingContext context) {
    return [context.arg(1)];
  }

  static Offset<T> _instantiate<T>(DecodingData<Offset> data) {
    return (x: data.dec(_f$x), y: data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static Offset<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Offset<T>>(map);
  }

  static Offset<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Offset<T>>(json);
  }
}

extension OffsetMappable<T> on Offset<T> {
  Map<String, dynamic> toMap() {
    return OffsetMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return OffsetMapper.ensureInitialized().encodeJson(this);
  }
}
