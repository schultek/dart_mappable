// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  static const Field<Location, Offset<dynamic>> _f$offset = Field(
    'offset',
    _$offset,
  );

  @override
  final MappableFields<Location> fields = const {
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
    return LocationMapper.ensureInitialized().encodeJson<Location>(
      this as Location,
    );
  }

  Map<String, dynamic> toMap() {
    return LocationMapper.ensureInitialized().encodeMap<Location>(
      this as Location,
    );
  }

  LocationCopyWith<Location, Location, Location> get copyWith =>
      _LocationCopyWithImpl<Location, Location>(
        this as Location,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LocationMapper.ensureInitialized().stringifyValue(this as Location);
  }

  @override
  bool operator ==(Object other) {
    return LocationMapper.ensureInitialized().equalsValue(
      this as Location,
      other,
    );
  }

  @override
  int get hashCode {
    return LocationMapper.ensureInitialized().hashValue(this as Location);
  }
}

extension LocationValueCopy<$R, $Out> on ObjectCopyWith<$R, Location, $Out> {
  LocationCopyWith<$R, Location, $Out> get $asLocation =>
      $base.as((v, t, t2) => _LocationCopyWithImpl<$R, $Out>(v, t, t2));
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
  $R call({Point? point, Offset<dynamic>? offset}) => $apply(
    FieldCopyWithData({
      if (point != null) #point: point,
      if (offset != null) #offset: offset,
    }),
  );
  @override
  Location $make(CopyWithData data) => Location(
    data.get(#point, or: $value.point),
    data.get(#offset, or: $value.offset),
  );

  @override
  LocationCopyWith<$R2, Location, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LocationCopyWithImpl<$R2, $Out2>($value, $cast, t);
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
  static const Field<Point, double> _f$x = Field(
    'x',
    _$x,
    key: r'a',
    hook: RoundingHook(),
  );
  static double _$y(Point v) => v.y;
  static const Field<Point, double> _f$y = Field('y', _$y);

  @override
  final MappableFields<Point> fields = const {#x: _f$x, #y: _f$y};

  @override
  Function get typeFactory =>
      (f) => f<Point>();

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

  PointCopyWith<Point> get copyWith =>
      _PointCopyWithImpl(this, $identity, $identity);
}

extension PointValueCopy<$R> on ObjectCopyWith<$R, Point, Point> {
  PointCopyWith<$R> get $asPoint =>
      $base.as((v, t, t2) => _PointCopyWithImpl(v, t, t2));
}

abstract class PointCopyWith<$R> implements RecordCopyWith<$R, Point> {
  $R call({double? x, double? y});
  PointCopyWith<$R2> $chain<$R2>(Then<Point, $R2> t);
}

class _PointCopyWithImpl<$R> extends RecordCopyWithBase<$R, Point>
    implements PointCopyWith<$R> {
  _PointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<Point> $mapper = PointMapper.ensureInitialized();
  @override
  $R call({double? x, double? y}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));
  @override
  Point $make(CopyWithData data) =>
      (x: data.get(#x, or: $value.x), y: data.get(#y, or: $value.y));

  @override
  PointCopyWith<$R2> $chain<$R2>(Then<Point, $R2> t) =>
      _PointCopyWithImpl($value, $cast, t);
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
  final MappableFields<Offset> fields = const {#x: _f$x, #y: _f$y};

  @override
  Function get typeFactory =>
      <T>(f) => f<Offset<T>>();

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

  OffsetCopyWith<Offset<T>, T> get copyWith =>
      _OffsetCopyWithImpl(this, $identity, $identity);
}

extension OffsetValueCopy<$R, T> on ObjectCopyWith<$R, Offset<T>, Offset<T>> {
  OffsetCopyWith<$R, T> get $asOffset =>
      $base.as((v, t, t2) => _OffsetCopyWithImpl(v, t, t2));
}

abstract class OffsetCopyWith<$R, T> implements RecordCopyWith<$R, Offset<T>> {
  $R call({double? x, T? y});
  OffsetCopyWith<$R2, T> $chain<$R2>(Then<Offset<T>, $R2> t);
}

class _OffsetCopyWithImpl<$R, T> extends RecordCopyWithBase<$R, Offset<T>>
    implements OffsetCopyWith<$R, T> {
  _OffsetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<Offset> $mapper =
      OffsetMapper.ensureInitialized();
  @override
  $R call({double? x, Object? y = $none}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));
  @override
  Offset<T> $make(CopyWithData data) =>
      (x: data.get(#x, or: $value.x), y: data.get(#y, or: $value.y));

  @override
  OffsetCopyWith<$R2, T> $chain<$R2>(Then<Offset<T>, $R2> t) =>
      _OffsetCopyWithImpl($value, $cast, t);
}

class RectMapper extends RecordMapperBase<Rect> {
  static RectMapper? _instance;
  RectMapper._();

  static RectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RectMapper._());
      MapperBase.addType(<A, B>(f) => f<({A bottomRight, B topLeft})>());
      PointMapper.ensureInitialized();
    }
    return _instance!;
  }

  static Point _$topLeft(Rect v) => v.topLeft;
  static const Field<Rect, Point> _f$topLeft = Field('topLeft', _$topLeft);
  static Point _$bottomRight(Rect v) => v.bottomRight;
  static const Field<Rect, Point> _f$bottomRight = Field(
    'bottomRight',
    _$bottomRight,
  );

  @override
  final MappableFields<Rect> fields = const {
    #topLeft: _f$topLeft,
    #bottomRight: _f$bottomRight,
  };

  @override
  Function get typeFactory =>
      (f) => f<Rect>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  static Rect _instantiate(DecodingData<Rect> data) {
    return (
      topLeft: data.dec(_f$topLeft),
      bottomRight: data.dec(_f$bottomRight),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Rect fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Rect>(map);
  }

  static Rect fromJson(String json) {
    return ensureInitialized().decodeJson<Rect>(json);
  }
}

extension RectMappable on Rect {
  Map<String, dynamic> toMap() {
    return RectMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return RectMapper.ensureInitialized().encodeJson(this);
  }

  RectCopyWith<Rect> get copyWith =>
      _RectCopyWithImpl(this, $identity, $identity);
}

extension RectValueCopy<$R> on ObjectCopyWith<$R, Rect, Rect> {
  RectCopyWith<$R> get $asRect =>
      $base.as((v, t, t2) => _RectCopyWithImpl(v, t, t2));
}

abstract class RectCopyWith<$R> implements RecordCopyWith<$R, Rect> {
  $R call({Point? topLeft, Point? bottomRight});
  RectCopyWith<$R2> $chain<$R2>(Then<Rect, $R2> t);
}

class _RectCopyWithImpl<$R> extends RecordCopyWithBase<$R, Rect>
    implements RectCopyWith<$R> {
  _RectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<Rect> $mapper = RectMapper.ensureInitialized();
  @override
  $R call({Point? topLeft, Point? bottomRight}) => $apply(
    FieldCopyWithData({
      if (topLeft != null) #topLeft: topLeft,
      if (bottomRight != null) #bottomRight: bottomRight,
    }),
  );
  @override
  Rect $make(CopyWithData data) => (
    topLeft: data.get(#topLeft, or: $value.topLeft),
    bottomRight: data.get(#bottomRight, or: $value.bottomRight),
  );

  @override
  RectCopyWith<$R2> $chain<$R2>(Then<Rect, $R2> t) =>
      _RectCopyWithImpl($value, $cast, t);
}

class HypotenuseMapper extends RecordMapperBase<Hypotenuse> {
  static HypotenuseMapper? _instance;
  HypotenuseMapper._();

  static HypotenuseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HypotenuseMapper._());
      MapperBase.addType(<A, B, C>(f) => f<({A hypotenuse, B x, C y})>());
    }
    return _instance!;
  }

  static double _$x(Hypotenuse v) => v.x;
  static const Field<Hypotenuse, double> _f$x = Field('x', _$x);
  static double _$y(Hypotenuse v) => v.y;
  static const Field<Hypotenuse, double> _f$y = Field('y', _$y);
  static double _$hypotenuse(Hypotenuse v) => v.hypotenuse;
  static const Field<Hypotenuse, double> _f$hypotenuse = Field(
    'hypotenuse',
    _$hypotenuse,
  );

  @override
  final MappableFields<Hypotenuse> fields = const {
    #x: _f$x,
    #y: _f$y,
    #hypotenuse: _f$hypotenuse,
  };

  @override
  Function get typeFactory =>
      (f) => f<Hypotenuse>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  @override
  final MappingHook hook = const HypotenuseHook();

  static Hypotenuse _instantiate(DecodingData<Hypotenuse> data) {
    return (
      x: data.dec(_f$x),
      y: data.dec(_f$y),
      hypotenuse: data.dec(_f$hypotenuse),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Hypotenuse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Hypotenuse>(map);
  }

  static Hypotenuse fromJson(String json) {
    return ensureInitialized().decodeJson<Hypotenuse>(json);
  }
}

extension HypotenuseMappable on Hypotenuse {
  Map<String, dynamic> toMap() {
    return HypotenuseMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return HypotenuseMapper.ensureInitialized().encodeJson(this);
  }

  HypotenuseCopyWith<Hypotenuse> get copyWith =>
      _HypotenuseCopyWithImpl(this, $identity, $identity);
}

extension HypotenuseValueCopy<$R>
    on ObjectCopyWith<$R, Hypotenuse, Hypotenuse> {
  HypotenuseCopyWith<$R> get $asHypotenuse =>
      $base.as((v, t, t2) => _HypotenuseCopyWithImpl(v, t, t2));
}

abstract class HypotenuseCopyWith<$R>
    implements RecordCopyWith<$R, Hypotenuse> {
  $R call({double? x, double? y, double? hypotenuse});
  HypotenuseCopyWith<$R2> $chain<$R2>(Then<Hypotenuse, $R2> t);
}

class _HypotenuseCopyWithImpl<$R> extends RecordCopyWithBase<$R, Hypotenuse>
    implements HypotenuseCopyWith<$R> {
  _HypotenuseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<Hypotenuse> $mapper =
      HypotenuseMapper.ensureInitialized();
  @override
  $R call({double? x, double? y, double? hypotenuse}) => $apply(
    FieldCopyWithData({
      if (x != null) #x: x,
      if (y != null) #y: y,
      if (hypotenuse != null) #hypotenuse: hypotenuse,
    }),
  );
  @override
  Hypotenuse $make(CopyWithData data) => (
    x: data.get(#x, or: $value.x),
    y: data.get(#y, or: $value.y),
    hypotenuse: data.get(#hypotenuse, or: $value.hypotenuse),
  );

  @override
  HypotenuseCopyWith<$R2> $chain<$R2>(Then<Hypotenuse, $R2> t) =>
      _HypotenuseCopyWithImpl($value, $cast, t);
}

