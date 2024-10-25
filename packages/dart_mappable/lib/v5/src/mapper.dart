import 'dart:async';

import 'decoder.dart';
import 'encoder.dart';

abstract class Mapper<T> {
  Decodable<T> get decodable;
  Encodable encodableOf(T value);
}

Decodable<T> findDecodableFor<T>() {
  return findMapperFor<T>().decodable;
}

Encodable findEncodableFor<T>(T value) {
  if (value is Encodable) return value;
  return findMapperFor<T>().encodableOf(value);
}

final _mappersKey = Object();

Mapper<T> findMapperFor<T>() {
  var mappers = Zone.current[_mappersKey] as List<Mapper>;
  return mappers.whereType<Mapper<T>>().first;
}

R useMappers<R>(R Function() callback, {List<Mapper>? mappers}) {
  return runZoned(callback, zoneValues: {
    if (mappers != null)
      _mappersKey: [...?Zone.current[_mappersKey] as List<Mapper>?, ...mappers]
  });
}
