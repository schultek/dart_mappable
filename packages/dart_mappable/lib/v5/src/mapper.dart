import 'dart:async';

// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart';

import 'decoding/decoding.dart';
import 'encoding/encoding.dart';

abstract class Mapper<T> {
  const Mapper();

  /// A unique id for this type, defaults to the name of the type.
  ///
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  /// A getter for the type of this mapper.
  Type get type => T;

  bool isFor(dynamic v) => v is T;
  bool isForType(Type type) => type.base == T;
}

abstract interface class DecoderOf<T> implements Mapper<T> {
  Decoder<T> decoder();
}

abstract interface class DecoderOf1<T> implements Mapper<T> {
  Decoder<T> decoder<A>([Decoder<A>? d1]);
}

abstract interface class DecoderOf2<T> implements Mapper<T> {
  Decoder<T> decoder<A, B>([Decoder<A>? d1, Decoder<B>? d2]);
}

abstract interface class EncoderOf<T> implements Mapper<T> {
  Encoder<T> encoder();
}

abstract interface class EncoderOf1<T> implements Mapper<T> {
  Encoder<T> encoder<A>([Encoder<A>? e1]);
}

abstract interface class EncoderOf2<T> implements Mapper<T> {
  Encoder<T> encoder<A, B>([Encoder<A>? e1, Encoder<B>? e2]);
}

Decoder<T> findDecoderFor<T>() {
  var mapper = MapperContainer.current.findByType<T>();
  return _decoderOf<T>(mapper!)!;
}

Decoder<T>? _decoderOf<T>(Mapper mapper) {
  return switch (mapper) {
    DecoderOf d => d.decoder(),
    DecoderOf1 d => T.args.call1(<A>() {
        return d.decoder<A>(findDecoderFor<A>());
      }),
    DecoderOf2 d => T.args.call2(<A, B>() {
        return d.decoder<A, B>(findDecoderFor<A>(), findDecoderFor<B>());
      }),
    _ => null,
  } as Decoder<T>?;
}

Encoder<T> findEncoderFor<T>(T value) {
  if (value is Encodable<T>) return value.encoder();
  var mapper = MapperContainer.current.findByValue<T>(value);
  return switch (mapper) {
    EncoderOf e => e.encoder(),
    EncoderOf1 e => T.args.call1(<A>() => e.encoder<A>()),
    EncoderOf2 e => T.args.call2(<A, B>() => e.encoder<A, B>()),
    _ => throw "",
  } as Encoder<T>;
}

extension on List<Type> {
  R call1<R>(R Function<A>() fn) {
    return first.provideTo(fn);
  }

  R call2<R>(R Function<A, B>() fn) {
    return first.provideTo(<A>() => this[1].provideTo(<B>() => fn<A, B>()));
  }
}

List<SubDecoderMixin<T>> findSubDecodersFor<T>() {
  var mappers = MapperContainer.current.findAll<T>();
  return mappers
      .map((m) => _decoderOf<T>(m))
      .whereType<SubDecoderMixin<T>>()
      .toList();
}

R useMappers<R>(R Function() callback, {List<Mapper>? mappers}) {
  return runZoned(callback, zoneValues: {
    MapperContainer._containerKey: MapperContainer._inherit(mappers: mappers),
  });
}

class MapperContainer implements TypeProvider {
  static final _containerKey = Object();
  static final _root = MapperContainer._({});

  static MapperContainer get current =>
      Zone.current[_containerKey] as MapperContainer? ?? _root;

  static MapperContainer _inherit({List<Mapper>? mappers}) {
    var parent = current;
    if (mappers == null) {
      return parent;
    }

    return MapperContainer._({
      ...parent._mappers,
      for (final m in mappers) m.type: m,
    });
  }

  MapperContainer._(this._mappers) {
    TypeRegistry.instance.register(this);
  }

  final Map<Type, Mapper> _mappers;

  final Map<Type, Mapper?> _cachedMappers = {};
  final Map<Type, Mapper?> _cachedTypeMappers = {};

  final Map<Object, dynamic> _cachedObjects = {};

  Mapper? findByType<T>([Type? type]) {
    return _mapperForType(type ?? T);
  }

  Mapper? findByValue<T>(T value) {
    return _mapperForValue(value);
  }

  List<Mapper<T>> findAll<T>() {
    return _mappers.values.whereType<Mapper<T>>().toList();
  }

  Mapper? _mapperForValue(dynamic value) {
    var type = value.runtimeType;
    if (_cachedMappers[type] != null) {
      return _cachedMappers[type];
    }
    var baseType = type.base;
    if (baseType == UnresolvedType) {
      baseType = type;
    }
    if (_cachedMappers[baseType] != null) {
      return _cachedMappers[baseType];
    }

    var mapper = //
        // direct type
        _mappers[baseType] ??
            // indirect type ie. subtype
            _mappers.values.where((m) => m.isFor(value)).firstOrNull;

    if (mapper != null) {
      // if (mapper is ClassMapperBase) {
      //   mapper = mapper.subOrSelfFor(value) ?? mapper;
      // }
      if (baseType == mapper.type) {
        _cachedMappers[baseType] = mapper;
      } else {
        _cachedMappers[type] = mapper;
      }
    }

    return mapper;
  }

  Mapper? _mapperForType(Type type) {
    if (_cachedTypeMappers[type] case var m?) {
      return m;
    }
    var baseType = type.base;
    if (baseType == UnresolvedType) {
      baseType = type;
    }
    if (_cachedTypeMappers[baseType] case var m?) {
      return m;
    }
    var mapper = _mappers[baseType] ??
        _mappers.values.where((m) => m.isForType(type)).firstOrNull;

    if (mapper != null) {
      if (baseType == mapper.type) {
        _cachedTypeMappers[baseType] = mapper;
      } else {
        _cachedTypeMappers[type] = mapper;
      }
    }
    return mapper;
  }

  @override
  Function? getFactoryById(String id) {
    return _mappers.values.where((m) => m.id == id).firstOrNull?.typeFactory;
  }

  @override
  List<Function> getFactoriesByName(String name) {
    return [
      ..._mappers.values
          .where((m) => m.type.name == name)
          .map((m) => m.typeFactory),
    ];
  }

  @override
  String? idOf(Type type) {
    return _mappers[type]?.id;
  }

  T? getCached<T>(Object key) {
    return _cachedObjects[key] as T?;
  }

  void setCached<T>(Object key, T value) {
    _cachedObjects[key] = value;
  }
}
