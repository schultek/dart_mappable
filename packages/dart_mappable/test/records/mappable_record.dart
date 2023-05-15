import 'package:dart_mappable/dart_mappable.dart';

@MappableRecord()
typedef Point = ({@MappableField(key: 'xx') double x, double y});

typedef Offset = ({double x, double y});

extension PointMappable on Point {
  String toMap() => 'point';
}

extension OffsetMappable on Offset {
  String toMap() => 'offset';
}

void main() {
  var p = (x: 1.0, y: 2.0);

  p.toMap();
}

abstract class PointCopyWith<$R, $In extends Point, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? x, double? y});
  PointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PointCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, Point, $Out>
    implements PointCopyWith<$R, Point, $Out> {
  _PointCopyWithImpl(super.value, super.then, super.then2);

  @override
  $R call({double? x, double? y}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));

  @override
  Point $make(CopyWithData data) =>
      (x: data.get(#a, or: $value.x), y: data.get(#r, or: $value.y));

  @override
  PointCopyWith<$R2, Point, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PointCopyWithImpl($value, $cast, t);
}
