import 'package:crimson/crimson.dart';

import 'package:crimson/src/consts.dart';
import '../protocol/common.dart';

const csvCoding = CsvCoding();

extension CsvEncodable on Encodable {
  String toCsv() {
    return csvCoding.encode(this, encoder());
  }
}

extension JsonEncodable1<T extends Encodable<T>, A> on Encodable1<T, A> {
  String toCsv([Encoder<A>? e1]) {
    return csvCoding.encode(this, encoder(e1));
  }
}

class CsvCoding implements Coding<String> {
  const CsvCoding();

  @override
  T decode<T>(String value, Decoder<T> decoder) {
    return CsvDecoding._(value.codeUnits).decodeObject(decoder);
  }

  @override
  String encode<T>(T value, Encoder<T> encoder) {
    return '';
    // var encoding = CsvEncoding._();
    // encoder.encodeSerial(value, encoding);
    // return encoding.write();
  }
}

class CsvDecoding implements SerialDecoding {
  CsvDecoding._(this.buffer,
      [this._offset = 0, this._key = -1, List<String>? keys]) {

    this.keys = keys ?? [];
    if (keys == null) {
      _readKeys();
    }
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

class JsonEncoding implements SerialEncoding {
  JsonEncoding._(this._writer);

  final CrimsonWriter _writer;

  @pragma('vm:prefer-inline')
  @override
  void encodeNull() {
    _writer.writeNull();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeString(String value) {
    _writer.writeString(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeBool(bool value) {
    _writer.writeBool(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeInt(int value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeDouble(double value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoder.encodeSerial(value, this);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeKey(Object? key) {
    _writer.writeObjectKey(key.toString());
  }

  @pragma('vm:prefer-inline')
  @override
  void startObject<Key>() {
    assert(Key == String);
    _writer.writeObjectStart();
  }

  @pragma('vm:prefer-inline')
  @override
  void endObject() {
    _writer.writeObjectEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  void startArray<E>() {
    _writer.writeArrayStart();
  }

  @pragma('vm:prefer-inline')
  @override
  void endArray() {
    _writer.writeArrayEnd();
  }
}
