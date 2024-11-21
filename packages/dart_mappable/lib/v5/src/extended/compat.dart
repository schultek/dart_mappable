part of 'extended.dart';

class CompatMappedDecoder implements MappedDecoder {
  CompatMappedDecoder._(this.decoder);

  static T apply<T>(DecodeMapped<T> decode, KeyedDecoder decoder) {
    final d = CompatMappedDecoder._(decoder);
    try {
      return decode.decodeMapped(d);
    } finally {
      if (!d._done) {
        d.decoder.skipRemainingKeys();
      }
    }
  }

  static MappedDecoder get<T>(DecodeMapped<T> decode, KeyedDecoder decoder) {
    try {
      return CompatMappedDecoder._(decoder.clone());
    } finally {
      decoder.skipCurrentValue();
    }
  }

  final KeyedDecoder decoder;

  bool _done = false;
  final Map<Object, KeyedDecoder> _values = {};

  bool skipTo(String key, [int? id]) {
    if (_done) return false;
    while (true) {
      var k = decoder.nextKey();
      if (k == null) {
        _done = true;
        return false;
      } else if (k == key || k == id) {
        return true;
      } else {
        _values[k] = decoder.clone();
        decoder.skipCurrentValue();
      }
    }
  }

  @override
  Object? decodeDynamic(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeDynamic();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeDynamic();
  }

  @override
  String decodeString(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeString();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeString();
  }

  @override
  String? decodeStringOrNull(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeStringOrNull();
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeStringOrNull();
  }

  @override
  bool decodeBool(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeBool();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeBool();
  }

  @override
  bool? decodeBoolOrNull(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeBoolOrNull();
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeBoolOrNull();
  }

  @override
  double decodeDouble(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeDouble();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeDouble();
  }

  @override
  double? decodeDoubleOrNull(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeDoubleOrNull();
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeDoubleOrNull();
  }

  @override
  int decodeInt(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeInt();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeInt();
  }

  @override
  int? decodeIntOrNull(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeIntOrNull();
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeIntOrNull();
  }

  @override
  T decodeObject<T>(String key, Decode<T> decode, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeObject(decode);
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeObject(decode);
  }

  @override
  T? decodeObjectOrNull<T>(String key, Decode<T> decode, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeObjectOrNull(decode);
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeObjectOrNull(decode);
  }

  @override
  List<T> decodeList<T>(String key, [int? id, Decode<T>? decodeElement]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeList(decodeElement);
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeList(decodeElement);
  }

  @override
  List<T>? decodeListOrNull<T>(String key, [int? id, Decode<T>? decodeElement]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeListOrNull(decodeElement);
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeListOrNull(decodeElement);
    
  }
  
  @override
  Map<K, V> decodeMap<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeDynamic]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeMap(decodeKey, decodeDynamic);
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeMap(decodeKey, decodeDynamic);
  }
  
  @override
  Map<K, V>? decodeMapOrNull<K, V>(String key, [int? id, Decode<K>? decodeKey, Decode<V>? decodeDynamic]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeMapOrNull(decodeKey, decodeDynamic);
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeMapOrNull(decodeKey, decodeDynamic);
  }
  
  @override
  num decodeNum(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeNum();
    }
    final hasKey = skipTo(key, id);
    assert(hasKey);
    return decoder.decodeNum();
  }
  
  @override
  num? decodeNumOrNull(String key, [int? id]) {
    if (_values[key] ?? _values[id] case final d?) {
      return d.decodeNumOrNull();
    }
    final hasKey = skipTo(key, id);
    if (!hasKey) return null;
    return decoder.decodeNumOrNull();
  }
}