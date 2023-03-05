import 'dart:collection';
import 'dart:typed_data';

import 'package:crimson/crimson.dart';

import '../copywith/copywith_base.dart';
import '../mapper_exception.dart';
import '../mappers/class_mapper.dart';
import 'mapping_context.dart';

abstract class DecodingReader {
  factory DecodingReader.from(Object? value) {
    if (value is DecodingReader) {
      return value;
    } else if (value is Map<String, dynamic>) {
      return MapReader(value);
    } else if (value is Uint8List) {
      return BytesJsonReader(Crimson(value));
    } else {
      throw MapperException.unexpectedType(
          value.runtimeType, (DecodingReader).toString());
    }
  }

  dynamic peek(String key);

  DecodingObject read(
      DecodingContext<DecodingReader> context, ClassMapperBase mapper);
}

abstract class DecodingObject implements DecodingReader {
  V get<V>(Symbol name);
}

class MapReader with MapMixin<String, dynamic> implements DecodingReader {
  MapReader(this.value);

  final Map<String, dynamic> value;

  @override
  peek(String key) => value[key];

  @override
  MapObject read(DecodingContext<DecodingReader> context,
          ClassMapperBase<Object> mapper) =>
      MapObject(value, mapper, context);

  @override
  operator [](Object? key) => value[key];

  @override
  void operator []=(String key, value) => this.value[key] = value;

  @override
  void clear() => value.clear();

  @override
  Iterable<String> get keys => value.keys;

  @override
  remove(Object? key) => value.remove(key);
}

class MapObject extends MapReader implements DecodingObject {
  MapObject(super.value, this.mapper, this.context);

  final ClassMapperBase<Object> mapper;
  final DecodingContext<DecodingReader> context;

  @override
  V get<V>(Symbol name) {
    var f = mapper.fields[name]!;
    return f.decodeValue(context, peek(f.key)) as V;
  }
}

class BytesJsonReader implements DecodingReader {
  BytesJsonReader(this.reader, [this.depth = 0]);

  final Crimson reader;
  final int depth;

  @override
  dynamic peek(String key) {
    // TODO: implement peek
    throw UnimplementedError();
  }

  @override
  BytesJsonObject read(
      DecodingContext<DecodingReader> context, ClassMapperBase mapper) {
    Map<Symbol, dynamic> values = {};

    Object? current;

    while (true) {
      if (current == $none) {
        reader.skip();
      }
      current = $none;

      int key = reader.iterObjectHash();

      if (key == -1) {
        break;
      }

      var f = mapper.fieldsByKey[key];
      if (f == null || f.mode == FieldMode.member) continue;

      current = BytesJsonReader.next(reader, depth);

      values[Symbol(f.name)] = f.decodeValue(context, current);
    }

    return BytesJsonObject(values, reader, context, mapper, depth);
  }

  static Object? next(Crimson reader, [int depth = 0]) {
    var type = reader.whatIsNext();

    if (type == JsonType.object) {
      return BytesJsonReader(reader, depth + 1);
    } else if (type == JsonType.array) {
      return BytesJsonListIterable(reader, depth + 1);
    } else {
      return reader.read();
    }
  }
}

class BytesJsonObject extends BytesJsonReader implements DecodingObject {
  BytesJsonObject(this.values, super.reader, this.context, this.mapper,
      [super.depth = 0]);

  final Map<Symbol, dynamic> values;
  final ClassMapperBase mapper;
  final DecodingContext<DecodingReader> context;

  @override
  V get<V>(Symbol name) {
    if (values.containsKey(name)) {
      return values[name] as V;
    } else {
      return mapper.fields[name]!.decodeValue(context, null) as V;
    }
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
      _current = BytesJsonReader.next(reader, depth);
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
