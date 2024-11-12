import 'dart:async';

// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart';

import '../extended/extended.dart';
import '../protocol/protocol.dart';
import 'inheritance.dart';
import 'mapper.dart';

Decoder<T> findDecoderFor<T>() {
  if (T == List || isBounded<T, List>()) {
    final decoder = T.args.call1<ListDecoder>(<E>() {
      return ListDecoder<E>(findDecoderFor<E>());
    });
    if (decoder is Decoder<T>) {
      return decoder as Decoder<T>;
    }
  }
  final mapper = MapperContainer.current.findByType<T>();
  return getDecoderOf<T>(mapper!)!;
}

Decoder<T>? getDecoderOf<T>(Mapper mapper) {
  final decodable = switch (mapper) {
    CodableMapper m => m.codable(),
    CodableMapper1 m => T.args.call1<Codable>(<A>() => m.codable<A>()),
    CodableMapper2 m => T.args.call2<Codable>(<A, B>() => m.codable<A, B>()),
    _ => null,
  } as Decodable<T>?;
  return decodable?.decoder();
}

Encoder<T> findEncoderFor<T>(T value) {
  if (value is Encodable<T>) return value.encoder();
  final mapper = MapperContainer.current.findByValue<T>(value);
  final encodable = switch (mapper) {
    CodableMapper m => m.codable(),
    CodableMapper1 m => T.args.call1<Codable>(<A>() => m.codable<A>()),
    CodableMapper2 m => T.args.call2<Codable>(<A, B>() => m.codable<A, B>()),
    _ => throw 'Not a CodableMapper',
  } as Encodable<T>;
  return encodable.encoder();
}

extension on List<Type> {
  R call1<R>(R Function<A>() fn) {
    return first.provideTo(fn);
  }

  R call2<R>(R Function<A, B>() fn) {
    return first.provideTo(<A>() => this[1].provideTo(<B>() => fn<A, B>()));
  }
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
