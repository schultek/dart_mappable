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

mixin DecoderMapper<T> implements Mapper<T> {
  Decoder<T> decoder();
}

mixin DecoderMapper1<T> implements Mapper<T> {
  Decoder<T> decoder<A>([Decoder<A>? d1]);
}

mixin DecoderMapper2<T> implements Mapper<T> {
  Decoder<T> decoder<A, B>([Decoder<A>? d1, Decoder<B>? d2]);
}

mixin EncoderMapper<T> implements Mapper<T> {
  Encoder<T> encoder();
}

mixin EncoderMapper1<T> implements Mapper<T> {
  Encoder<T> encoder<A>([Encoder<A>? e1]);
}

Decoder<T> findDecoderFor<T>() {
  var mapper = MapperContainer.current?.findByType<T>();
  return switch (mapper!) {
    DecoderMapper2 d => T.args.call2(<A, B>() {
        return d.decoder<A, B>(findDecoderFor<A>(), findDecoderFor<B>());
      }),
    DecoderMapper1 d => T.args.call1(<A>() {
        return d.decoder<A>(findDecoderFor<A>());
      }),
    DecoderMapper m => m.decoder(),
    _ => throw "",
  } as Decoder<T>;
}

extension on List<Type> {
  R call1<R>(R Function<A>() fn) {
    return first.provideTo(fn);
  }

  R call2<R>(R Function<A, B>() fn) {
    return first.provideTo(<A>() => this[1].provideTo(<B>() => fn<A, B>()));
  }
}

Encoder<T> findEncoderFor<T>(T value) {
  if (value is Encodable) return value.encoder() as Encoder<T>;
  var mapper = MapperContainer.current?.findByValue<T>(value);
  return switch (mapper) {
    EncoderMapper e => e.encoder(),
    _ => throw "",
  } as Encoder<T>;
}

R useMappers<R>(R Function() callback, {List<Mapper>? mappers}) {
  return runZoned(callback, zoneValues: {
    MapperContainer._containerKey: MapperContainer._inherit(mappers: mappers),
  });
}

class MapperContainer implements TypeProvider {
  static final _containerKey = Object();
  static MapperContainer? get current =>
      Zone.current[_containerKey] as MapperContainer?;

  static MapperContainer _inherit({List<Mapper>? mappers}) {
    var parent = current ?? MapperContainer._({});

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

  Mapper? findByType<T>([Type? type]) {
    return _mapperForType(type ?? T);
  }

  Mapper? findByValue<T>(T value) {
    return _mapperForValue(value);
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
}
