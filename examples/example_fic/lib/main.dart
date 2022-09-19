import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'main.mapper.g.dart';

@CustomMapper()
class IMapMapper extends BaseMapper<IMap> {
  @override
  Function decoder = <Key, Val>(value) {
    IMap.from
    return IMap<Key, Val>(Mapper.fromValue(value));
  };

  @override
  Function encoder = (IMap self) {
    self.toJson((p0) => null, (p0) => null)
    return Mapper.toValue(self.unlock);
  };

  @override
  Function get typeFactory => <Key, Val>(f) => f<IMap<Key, Val>>();
}

void main() {
}
