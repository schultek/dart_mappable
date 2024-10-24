import 'dart:async';

import 'decoder.dart';
import 'encoder.dart';
import 'serial_encoder.dart';
import 'structured_encoder.dart';

abstract class Mapper<T> {
  T decode(Decoder decoder);
  Object? encodeStructured(StructuredEncoder encoder, T value);
  void encodeSerial(SerialEncoder encoder, T value);
}

T Function(Decoder) findDecodeFor<T>() {
  return findMapperFor<T>().decode;
}

Encodable findEncodableFor<T>(T value) {
  if (value is Encodable) return value;
  return EncodableWithMapper(value, findMapperFor<T>());
}

class EncodableWithMapper<T> implements Encodable {
  EncodableWithMapper(this.value, this.mapper);

  final T value;
  final Mapper<T> mapper;

  @override
  Object? encodeStructured(StructuredEncoder encoder) {
    return mapper.encodeStructured(encoder, value);
  }

  @override
  void encodeSerial(SerialEncoder encoder) {
    mapper.encodeSerial(encoder, value);
  }
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
