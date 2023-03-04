import 'dart:typed_data';

import 'package:crimson/crimson.dart';

import '../copywith/copywith_base.dart';
import '../mapper_exception.dart';

abstract class JsonObject {
  Object? get(String key);
  JsonObjectIterator get iterator;

  factory JsonObject.from(Object? value) {
    if (value is JsonObject) {
      return value;
    } else if (value is Map<String, dynamic>) {
      return MapJsonObject(value);
    } else if (value is Uint8List) {
      return BytesJsonObject(Crimson(value));
    } else {
      throw MapperException.unexpectedType(
          value.runtimeType, (JsonObject).toString());
    }
  }
}

abstract class JsonObjectIterator {
  int nextKey();
  Object? get current;
}

class MapJsonObject implements JsonObject {
  MapJsonObject(this.value);

  final Map<String, dynamic> value;

  @override
  JsonObjectIterator get iterator => MapJsonObjectIterator(value);

  @override
  Object? get(String key) {
    return value[key];
  }
}

class MapJsonObjectIterator extends JsonObjectIterator {
  MapJsonObjectIterator(this.value) : keys = value.keys.iterator;

  final Map<String, dynamic> value;
  final Iterator<String> keys;

  @override
  Object? get current => value[keys.current];

  @override
  int nextKey() {
    if (keys.moveNext()) {
      return Crimson.hash(keys.current);
    }
    return -1;
  }
}

class BytesJsonObject implements JsonObject {
  BytesJsonObject(this.reader, [this.depth = 0]);

  final Crimson reader;
  final int depth;

  @override
  JsonObjectIterator get iterator => BytesJsonObjectIterator(reader, depth);

  @override
  Object? get(String key) {
    throw UnimplementedError();
  }

  static Object? read(Crimson reader, [int depth = 0]) {
    var type = reader.whatIsNext();

    //String prefix = ''.padRight(depth, '-');
    //print('$prefix READ VALUE $type');

    if (type == JsonType.object) {
      return BytesJsonObject(reader, depth + 1);
    } else if (type == JsonType.array) {
      return BytesJsonListIterable(reader, depth + 1);
    } else {
      return reader.read();
    }
  }
}

class BytesJsonObjectIterator extends JsonObjectIterator {
  BytesJsonObjectIterator(this.reader, this.depth);

  final Crimson reader;
  final int depth;

  Object? _current;

  @override
  Object? get current {
    if (_current == $none) {
      _current = BytesJsonObject.read(reader, depth);
    }
    return _current;
  }

  @override
  int nextKey() {
    if (_current == $none) {
      reader.skip();
    } else {
      _current = $none;
    }
    return reader.iterObjectHash();
  }
}

class BytesJsonListIterable extends Iterable<Object?> {
  BytesJsonListIterable(this.reader, this.depth);

  final Crimson reader;
  final int depth;

  @override
  Iterator<Object?> get iterator => BytesJsonListIterator(reader, depth);
}

class BytesJsonListIterator extends Iterator<Object?> {
  BytesJsonListIterator(this.reader, this.depth);

  final Crimson reader;
  final int depth;

  Object? _current;

  @override
  Object? get current {
    if (_current == $none) {
      _current = BytesJsonObject.read(reader, depth);
    }
    return _current;
  }

  @override
  bool moveNext() {
    if (_current == $none) {
      reader.skip();
    } else {
      _current = $none;
    }
    return reader.iterArray();
  }
}
