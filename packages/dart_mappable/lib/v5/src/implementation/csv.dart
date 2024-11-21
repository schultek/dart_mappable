/// CSV reference implementation.
///
/// This is limited to simple values only, no nested objects or lists.
/// Values are separated by ",".

import 'package:crimson/src/consts.dart';
import '../protocol/protocol.dart';
/*
class CsvDecoding implements SerialDecoding {
  CsvDecoding._(
    this.buffer, [
    this._offset = 0,
    this._key = -1,
    List<String>? keys,
  ]) {
    this.keys = keys ?? [];
    if (keys == null) {
      _readKeys();
    }
  }

  static List<T> decode<T>(String value, Decoder<T> decoder) {
    final decoding = CsvDecoding._(value.codeUnits);
    return [
      for (;decoding.nextItem();) decoding.decodeObject(decoder),
    ];
  }

  final List<int> buffer;
  int _offset;

  late final List<String> keys;
  int _key;

  void _readKeys() {
    while (true) {
      keys.add(_readString());
      if (_offset >= buffer.length) {
        break;
      } else if (buffer[_offset] == tokenComma) {
        _offset++;
        continue;
      } else if (_skipWhitespace()) {
        break;
      } else {
        _error(_offset, expected: '\\n or ,');
      }
    }
  }

  Never _error(int offset, {String? expected}) {
    throw FormatException(
      'Unexpected token: '
      '${expected != null ? 'expected $expected actual: ' : ''}'
      '${String.fromCharCodes(buffer, offset, offset + 5)}',
      buffer,
      offset,
    );
  }

  bool _skipWhitespace() {
    var i = _offset;
    while (i < buffer.length) {
      if (buffer[i] > tokenSpace) {
        break;
      } else if (buffer[i] == tokenLineFeed) {
        _offset = i;
        return true;
      }
      i++;
    }
    _offset = i;
    return false;
  }

  @pragma('vm:prefer-inline')
  @override
  Object? decodeValue() {
    return decodeStringOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  String decodeString() {
    return _readString();
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull() {
    if (skipNull()) {
      return null;
    }
    return _readString();
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool() {
    return decodeString() == 'true';
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull() {
    if (skipNull()) {
      return null;
    }
    return decodeBool();
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt() {
    return int.parse(decodeString());
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull() {
    if (skipNull()) {
      return null;
    }
    return int.tryParse(decodeString());
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble() {
    return double.parse(decodeString());
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull() {
    if (skipNull()) {
      return null;
    }
    return double.parse(decodeString());
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeObject<T>(Decoder<T> decoder) {
    return decoder.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
    if (skipNull()) {
      return null;
    }
    return decoder.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  bool nextItem() {
    if (_offset >= buffer.length) {
      return false;
    }
    if (buffer[_offset] != tokenLineFeed) {
      _error(_offset, expected: '\\n');
    }
    _offset++;
    _key = -1;
    return _offset < buffer.length;
  }

  @pragma('vm:prefer-inline')
  @override
  Object? nextKey() {
    if (_offset >= buffer.length) {
      return null;
    }
    _key++;
    if (_key >= keys.length) {
      if (buffer[_offset] != tokenLineFeed) {
        _error(_offset, expected: '\\n');
      }
      return null;
    }
    if (_key > 0) {
      if (buffer[_offset] != tokenComma) {
        _error(_offset, expected: ',');
      }
      _offset++;
    }
    return keys[_key];
  }

  @pragma('vm:prefer-inline')
  @override
  void skipNext() {
    _skip();
  }

  @pragma('vm:prefer-inline')
  @override
  bool skipNull() {
    switch (buffer[_offset]) {
      case tokenComma:
      case tokenLineFeed:
        return true;
      default:
        return false;
    }
  }

  @override
  void skipRemainingKeys() {
    var i = _offset;
    while (i < buffer.length) {
      if (buffer[i] == tokenLineFeed) {
        _offset = i;
        return;
      }
      i++;
    }
    _offset = i;
  }

  @override
  void skipRemainingItems() {
    _offset = buffer.length;
  }

  String _readString() {
    if (_skipWhitespace()) {
      return '';
    }
    if (buffer[_offset] == tokenDoubleQuote) {
      return _readQuotedString();
    }
    return _readUnquotedString();
  }

  String _readQuotedString() {
    if (buffer[_offset] != tokenDoubleQuote) {
      _error(_offset, expected: '"');
    }
    final start = _offset + 1;
    var i = start;
    while (true) {
      final c = buffer[i++];
      if (c == tokenDoubleQuote) {
        _offset = i;
        return String.fromCharCodes(buffer, start, i - 1);
      }
    }
  }

  String _readUnquotedString() {
    if (_offset >= buffer.length) {
      return '';
    }
    final start = _offset;
    var i = start;
    while (true) {
      final c = buffer[i];
      if (c == tokenLineFeed || c == tokenComma) {
        _offset = i;
        return String.fromCharCodes(buffer, start, i);
      }
      i++;
      if (i >= buffer.length) {
        _offset = i;
        return String.fromCharCodes(buffer, start, i);
      }
    }
  }

  void _skip() {
    var i = _offset;
    var quoted = false;
    while (i < buffer.length) {
      if (buffer[i] == tokenDoubleQuote) {
        quoted = !quoted;
      } else if (!quoted && buffer[i] == tokenComma) {
        _offset = i++;
        return;
      }
      i++;
    }
    _offset = i;
  }

  @override
  SerialDecoding clone() {
    return CsvDecoding._(buffer, _offset, _key, keys);
  }
}


class CsvEncoding implements SerialEncoding {
  CsvEncoding._();

  final List<String> keys = [];
  final StringBuffer writer = StringBuffer();

  static String encode<T>(Iterable<T> value, Encoder<T> Function(T) encoder) {
    final encoding = CsvEncoding._();
    for (final e in value) {
      encoding.encodeObject(e, encoder(e));
    }
    return '${encoding.keys.join(',')}\n${encoding.writer}';
  }

  int key = -1;

  @override
  void encodeString(String value) {
    assert(key >= 0);
    if (key > 0) writer.write(',');
  writer.write(value);
  key++;
  }

  @override
  void encodeBool(bool value) {assert(key >= 0);
    if (key > 0) writer.write(',');
    writer.write(value);
    key++;
  }

  @override
  void encodeDouble(double value) {assert(key >= 0);
    if (key > 0) writer.write(',');
    writer.write(value);key++;
  }

  @override
  void encodeInt(int value) {assert(key >= 0);
    if (key > 0) writer.write(',');
    writer.write(value);key++;
  }

  @override
  void encodeNull() {assert(key >= 0);
    if (key > 0) writer.write(',');key++;
  }

  @override
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoder.encodeSerial(value, this);
  }

  @override
  void startArray<E>() {
    throw UnsupportedError('Lists not supported');
  }


  @override
  void endArray() {
    throw UnsupportedError('Lists not supported');
  }

  @override
  void startObject<Key>() {
    assert(key == -1);
    key = 0;
  }

  @override
  void endObject() {
    writer.writeln();
    key = -1;
  }


  @override
  void encodeKey(Object? k) {
    assert(key >= 0);
    assert(k is String);
    if (key < keys.length) {
      assert(k == keys[key]);
    } else {
      keys.add(k as String);
    }
  }
}

extension CsvDecodable<T> on Decodable<T> {
  List<T> fromCsv(String csv) {
    return CsvDecoding.decode(csv, decoder());
  }
}

extension CsvEncodable<T> on Encodable<T> {
  String toCsv(Iterable<T> value) {
    final e = encoder();
    return CsvEncoding.encode(value, (_) => e);
  }
}

extension CsvEncodableSelf<T extends Encodable<T>> on Iterable<T> {
  String toCsv() {
    return CsvEncoding.encode(this, (v) => v.encoder());
  }
}*/