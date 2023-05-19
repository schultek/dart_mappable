import 'package:dart_mappable/dart_mappable.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'xx') double x, double y});

typedef Offset = ({double x, double y});

extension PointMappable on Point {
  Map<String, dynamic> toMap() => PointMapper().encodeMap<Point>(this);
}

extension OffsetMappable on Offset {
  String toMap2() => 'offset';
}

class PointMapper extends RecordMapperBase<({dynamic x, dynamic y})> {
  static final _$x = Field<Point, dynamic>('x', (r) => r.x, key: 'xx');
  static final _$y = Field<Point, dynamic>('y', (r) => r.y);

  @override
  Map<Symbol, Field<Point, dynamic>> get fields => {#x: _$x, #y: _$y};

  ({A x, B y}) _instantiate<A, B>(DecodingData<({dynamic x, dynamic y})> data) {
    return (x: data.dec(_$x), y: data.dec(_$y));
  }

  @override
  Function get instantiate => _instantiate;

  @override
  Function get typeFactory => <A, B>(f) => f<({A x, B y})>();
}

class OffsetMapper extends PointMapper {

}

void main() {
  var p = (x: 1.0, y: 2.0);

  MapperContainer.globals.use(PointMapper());

  var map = p.toMap();
  print(map);
  print(MapperContainer.globals.fromMap<Point>(map));
}
//
// abstract class PointCopyWith<$R, $In extends Point, $Out>
//     implements ClassCopyWith<$R, $In, $Out> {
//   $R call({double? x, double? y});
//   PointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
// }
//
// class _PointCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, Point, $Out>
//     implements PointCopyWith<$R, Point, $Out> {
//   _PointCopyWithImpl(super.value, super.then, super.then2);
//
//   @override
//   $R call({double? x, double? y}) =>
//       $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));
//
//   @override
//   Point $make(CopyWithData data) =>
//       (x: data.get(#a, or: $value.x), y: data.get(#r, or: $value.y));
//
//   @override
//   PointCopyWith<$R2, Point, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
//       _PointCopyWithImpl($value, $cast, t);
// }
