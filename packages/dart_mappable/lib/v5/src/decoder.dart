import 'package:crimson/crimson.dart';

abstract interface class DecodingDelegate {
  Object? operator [](Object? key);
}

abstract interface class Decoder {
  factory Decoder.raw(Object? value) => _RawDecoder(value);
  factory Decoder.json(List<int> buffer) => _JsonDecoder(Crimson(buffer));

  String? decodeString();

  bool? decodeBool();

  int? decodeInt();

  double? decodeDouble();

  T? decodeDecodable<T>(T Function(Decoder) decode);

  KeyedDecoder<Key> decodeKeyed<Key>();
}

abstract interface class KeyedDecoder<Key> {
  String? decodeString(Key key);

  bool? decodeBool(Key key);

  int? decodeInt(Key key);

  double? decodeDouble(Key key);

  T? decodeDecodable<T>(Key key, T Function(Decoder) decode);

  List<T>? decodeList<T>(Key key);

  List<T>? decodeListDecodable<T>(Key key, T Function(Decoder) decode);
}

mixin SerialKeyedDecoder<Key> implements KeyedDecoder<Key> {
  Key? nextKey();

  void skipNext();

  String? decodeNextString();

  bool? decodeNextBool();

  int? decodeNextInt();

  double? decodeNextDouble();

  T? decodeNextDecodable<T>(T Function(Decoder) decode);

  List<T>? decodeNextList<T>();

  List<T>? decodeNextListDecodable<T>(T Function(Decoder) decode);
}

class _RawDecoder implements Decoder {
  _RawDecoder(this._value);
  final Object? _value;

  @override
  String? decodeString() {
    return _value as String?;
  }

  @override
  bool? decodeBool() {
    return _value as bool?;
  }

  @override
  int? decodeInt() {
    return (_value as num?)?.toInt();
  }

  @override
  double? decodeDouble() {
    return (_value as num?)?.toDouble();
  }

  @override
  T decodeDecodable<T>(T Function(Decoder) decode) {
    return decode(this);
  }

  @override
  KeyedDecoder<Key> decodeKeyed<Key>() {
    return _RawKeyedDecoder(_value as Map<Key, dynamic>);
  }
}

class _RawKeyedDecoder<Key> implements KeyedDecoder<Key> {
  _RawKeyedDecoder(this._value);
  final Map<dynamic, dynamic> _value;

  @override
  String? decodeString(Key key) {
    return _value[key] as String?;
  }

  @override
  bool? decodeBool(Key key) {
    return _value[key] as bool?;
  }

  @override
  int? decodeInt(Key key) {
    return (_value[key] as num?)?.toInt();
  }

  @override
  double? decodeDouble(Key key) {
    return (_value[key] as num?)?.toDouble();
  }

  @override
  T? decodeDecodable<T>(Key key, T Function(Decoder) decode) {
    var v = _value[key];
    if (v == null) {
      return null;
    }
    return decode(_RawDecoder(v));
  }

  @override
  List<T>? decodeList<T>(Key key) {
    var v = _value[key] as List?;
    return v?.cast<T>();
  }

  @override
  List<T>? decodeListDecodable<T>(Key key, T Function(Decoder) decode) {
    var v = _value[key] as List?;
    return v?.map((e) => decode(_RawDecoder(e))).toList();
  }
}

// extension type Decoders._(Object? _value) {
//
//   @pragma('vm:prefer-inline')
//   List<T> decodeList<T>(Object? key, [T Function(Decoder)? decode]) {
//     if (decode == null) {
//       return (_unsafeValue[key] as List).cast<T>();
//     }
//     return (_unsafeValue[key] as List)
//         .map((i) => decode(Decoder._(i)))
//         .toList();
//   }
//
//   @pragma('vm:prefer-inline')
//   Map<K, V> decodeMap<K, V>(
//     Object? key, [
//     V Function(Decoder)? decodeValue,
//     K Function(Decoder)? decodeKey,
//   ]) {
//     if (decodeValue == null && decodeKey == null) {
//       return (_unsafeValue[key] as Map).cast<K, V>();
//     }
//     return (_unsafeValue[key] as Map).map((k, v) => MapEntry(
//           decodeKey != null ? decodeKey(Decoder._(k)) : k as K,
//           decodeValue != null ? decodeValue(Decoder._(v)) : v as V,
//         ));
//   }
// }

class _JsonDecoder implements Decoder {
  _JsonDecoder(this._reader);

  final Crimson _reader;

  @override
  String? decodeString() {
    return _reader.readStringOrNull();
  }

  @override
  bool? decodeBool() {
    return _reader.read() as bool?;
  }

  @override
  int? decodeInt() {
    return _reader.readIntOrNull();
  }

  @override
  double? decodeDouble() {
    return _reader.readDoubleOrNull();
  }

  @override
  T? decodeDecodable<T>(T Function(Decoder) decode) {
    return decode(this);
  }

  _JsonKeyedDecoder? _keyed;

  @override
  KeyedDecoder<Key> decodeKeyed<Key>() {
    _keyed ??= _JsonKeyedDecoder<Key>(_reader);
    return _keyed! as KeyedDecoder<Key>;
  }
}

class _JsonKeyedDecoder<Key>
    with SerialKeyedDecoder<Key>
    implements KeyedDecoder<Key> {
  _JsonKeyedDecoder(this._reader);

  final Crimson _reader;

  bool _done = false;
  final Map<Key, int> _offsets = {};

  bool skipTo(Key key) {
    if (_done) return false;
    while (true) {
      var k = _reader.iterObject();
      if (k == null) {
        _done = true;
        return false;
      } else if (k == key) {
        return true;
      } else {
        print("ADD OFFSET $k (LOOKING FOR $key)");
        _offsets[k as Key] = _reader.offset;
        _reader.skip();
      }
    }
  }

  @override
  String? decodeString(Key key) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      return Crimson(_reader.buffer, o).readStringOrNull();
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      return _reader.readStringOrNull();
    }
    return null;
  }

  @override
  bool? decodeBool(Key key) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      return Crimson(_reader.buffer, o).read() as bool?;
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      return _reader.read() as bool?;
    }
    return null;
  }

  @override
  double? decodeDouble(Key key) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      return Crimson(_reader.buffer, o).readDoubleOrNull();
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      return _reader.readDoubleOrNull();
    }
    return null;
  }

  @override
  int? decodeInt(Key key) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      return Crimson(_reader.buffer, o).readIntOrNull();
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      return _reader.readIntOrNull();
    }
    return null;
  }

  @override
  T? decodeDecodable<T>(Key key, T Function(Decoder) decode) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      var r = Crimson(_reader.buffer, o);
      if (r.skipNull()) {
        return null;
      }
      return decode(_JsonDecoder(r));
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      if (_reader.skipNull()) {
        return null;
      }
      final d = _JsonDecoder(_reader);
      try {
        return decode(d);
      } finally {
        if (d._keyed != null && !d._keyed!._done) {
          _reader.skipPartialObject();
        }
      }
    }
    return null;
  }

  @override
  List<T>? decodeList<T>(Key key) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      var r = Crimson(_reader.buffer, o);
      if (r.skipNull()) {
        return null;
      }
      return r.readArray().cast<T>();
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      if (_reader.skipNull()) {
        return null;
      }
      return _reader.readArray().cast<T>();
    }
    return null;
  }

  @override
  List<T>? decodeListDecodable<T>(Key key, T Function(Decoder) decode) {
    if (_offsets.containsKey(key)) {
      var o = _offsets[key]!;
      var r = Crimson(_reader.buffer, o);
      if (r.skipNull()) {
        return null;
      }
      return r.readArray().map((e) => decode(_RawDecoder(e))).toList();
    }
    final hasKey = skipTo(key);
    if (hasKey) {
      if (_reader.skipNull()) {
        return null;
      }
      return _reader.readArray().map((e) => decode(_RawDecoder(e))).toList();
    }
    return null;
  }

  @override
  Key? nextKey() {
    var next = _reader.iterObject() as Key?;
    if (next == null) _done = true;
    return next;
  }

  @override
  void skipNext() {
    _reader.skip();
  }

  @override
  String? decodeNextString() {
    return _reader.readStringOrNull();
  }

  @override
  bool? decodeNextBool() {
    return _reader.read() as bool?;
  }

  @override
  int? decodeNextInt() {
    return _reader.readIntOrNull();
  }

  @override
  double? decodeNextDouble() {
    return _reader.readDoubleOrNull();
  }

  @override
  T? decodeNextDecodable<T>(T Function(Decoder) decode) {
    if (_reader.skipNull()) {
      return null;
    }
    final d = _JsonDecoder(_reader);
    try {
      return decode(d);
    } finally {
      if (d._keyed != null && !d._keyed!._done) {
        _reader.skipPartialObject();
      }
    }
  }

  @override
  List<T>? decodeNextList<T>() {
    if (_reader.skipNull()) {
      return null;
    }
    return _reader.readArray().cast<T>();
  }

  @override
  List<T>? decodeNextListDecodable<T>(T Function(Decoder) decode) {
    if (_reader.skipNull()) {
      return null;
    }
    var list = <T>[];
    for (; _reader.iterArray();) {
      var d = _JsonDecoder(_reader);
      try {
        list.add(decode(d));
      } finally {
        if (d._keyed != null && !d._keyed!._done) {
          _reader.skipPartialObject();
        }
      }
    }
    return list;
  }
}
