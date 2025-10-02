import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:type_plus/type_plus.dart';

import '../annotations.dart';
import '../mapper_container.dart';
import '../mapper_utils.dart';
import 'interface_mapper.dart';
import 'mapper_base.dart';
import 'mapping_context.dart';

abstract class SubClassMapperBase<T extends Object> extends ClassMapperBase<T> {
  String get discriminatorKey;
  dynamic get discriminatorValue;
  ClassMapperBase get superMapper;

  bool canDecode(Map<String, dynamic> value) {
    var discriminator = discriminatorValue;
    if (identical(discriminator, MappingFlags.useAsDefault)) {
      return true;
    } else if (discriminator is Function) {
      if (discriminator is bool Function(Map<String, dynamic>)) {
        return discriminator(value);
      } else {
        throw AssertionError(
          'Discriminator function must be of type "bool Function(Map<String, dynamic>)".',
        );
      }
    } else if (discriminator == value[discriminatorKey]) {
      return true;
    }

    if (_subMappers.isNotEmpty) {
      for (var m in _subMappers) {
        if (m.discriminatorKey == discriminatorKey && m.canDecode(value)) {
          return true;
        }
      }
    }
    if (_defaultSubMapper != null &&
        _defaultSubMapper!.discriminatorKey == discriminatorKey) {
      return true;
    }

    return false;
  }

  late final bool _shouldEncodeDiscriminatorParam = () {
    return _params.every((p) => p.key != discriminatorKey) &&
        !identical(discriminatorValue, MappingFlags.useAsDefault) &&
        discriminatorValue is! Function;
  }();

  @override
  // ignore: overridden_fields
  late final Map<String, dynamic> _encodedStaticParams = {
    ...?superMapper._encodedStaticParams,
    if (_shouldEncodeDiscriminatorParam) discriminatorKey: discriminatorValue,
  };

  @override
  bool includeTypeId<V>(v) {
    // Skip type id for non-generic poly types.
    if (V.nonNull == superMapper.type) {
      return false;
    }
    return super.includeTypeId<V>(v) && superMapper.includeTypeId<V>(v);
  }
}

/// The mapper interface that all generated class mappers extend.
///
/// Class mappers will be generated for any class annotated with `@MappableClass()`.
abstract class ClassMapperBase<T extends Object>
    extends InterfaceMapperBase<T> {
  /// The optional mapping hook defined for the superclass of this class.
  MappingHook? get superHook => null;

  /// The fallback subclass mapper for this class.
  SubClassMapperBase<T>? _defaultSubMapper;

  /// The set of subclass mappers for this class.
  final Set<SubClassMapperBase<T>> _subMappers = {};

  /// Whether to encode nested objects or just one level deep.
  final bool shallowEncoding = false;

  /// This will inherit the decoding context when giving over decoding to a
  /// subclass.
  ///
  /// Mappers may override this method to modify the type arguments used for
  /// decoding.
  DecodingContext inherit(DecodingContext context) {
    return context.inherit();
  }

  /// Adds a subclass mapper to this mapper.
  @protected
  void addSubMapper(SubClassMapperBase<T> mapper) {
    assert(identical(mapper.superMapper, this));
    if (identical(mapper.discriminatorValue, MappingFlags.useAsDefault)) {
      assert(
        _defaultSubMapper == null,
        'Cannot have multiple default mappers for a polymorphic class.',
      );
      _defaultSubMapper = mapper;
    } else {
      _subMappers.add(mapper);
    }
  }

  @override
  Object? encodeValue<V>(
    V value, [
    EncodingOptions? options,
    MapperContainer? container,
  ]) {
    var m = subOrSelfFor(value);
    if (m != null) {
      return m.encodeValue<V>(value, options, container);
    }
    return super.encodeValue<V>(value, options, container);
  }

  MapperBase<Object>? subOrSelfFor(dynamic value) {
    MapperBase<Object>? m;
    if (_subMappers.isNotEmpty) {
      m = _subMappers.where((m) => m.isFor(value)).firstOrNull;
    }
    if (m == null &&
        _defaultSubMapper != null &&
        _defaultSubMapper!.isFor(value)) {
      m = _defaultSubMapper;
    }
    return m;
  }

  /// The set of class members this class defines.
  ///
  /// This excludes constructor parameters that are not assigned to a field.
  /// See [FieldMode] for more.
  late final List<Field<T, dynamic>> _members =
      fields.values.where((f) => f.mode != FieldMode.param).toList();

  /// The set of constructor parameters of this class.
  ///
  /// See [FieldMode] for more.
  late final List<Field<T, dynamic>> _params =
      fields.values
          .where(
            (f) =>
                f.mode != FieldMode.member &&
                f.getter != null &&
                f.includeFromJson,
          )
          .toList();

  /// The set of fields to include during encoding.
  late final List<Field<T, dynamic>> _encodingParams =
      fields.values
          .where((f) => f.mode != FieldMode.member && f.getter != null)
          .toList();

  @override
  T decoder(Object? value, DecodingContext context) {
    if (superHook != null && !context.inherited) {
      value = superHook!.beforeDecode(value);

      if (value is T) {
        return superHook!.afterDecode(value) as T;
      }
    }

    var result = super.decoder(value, context);

    if (superHook != null && !context.inherited) {
      result = superHook!.afterDecode(result) as T;
    }

    return result;
  }

  @override
  T decode(Object? value, DecodingContext context) {
    var map = value.checked<Map<String, dynamic>>();
    if (_subMappers.isNotEmpty) {
      for (var m in _subMappers) {
        if (m.canDecode(map)) {
          return m.decoder(map, m.inherit(context));
        }
      }
    }
    if (_defaultSubMapper != null) {
      return _defaultSubMapper!.decoder(
        map,
        _defaultSubMapper!.inherit(context),
      );
    }
    return super.decode(map, context);
  }

  final Map<String, dynamic>? _encodedStaticParams = null;

  @override
  Object? encoder(T value, EncodingContext context) {
    if (superHook != null) {
      var result = superHook!.beforeEncode(value);

      if (result is! T) {
        return superHook!.afterEncode(result);
      }
      value = result;
    }

    var result = super.encoder(value, context);

    if (superHook != null) {
      result = superHook!.afterEncode(result);
    }

    return result;
  }

  @override
  Object? encode(T value, EncodingContext context) {
    var result = InterfaceMapperBase.encodeFields(
      value,
      _encodingParams,
      ignoreNull,
      context,
      context.options?.shallow ?? shallowEncoding,
    );
    if (_encodedStaticParams != null) {
      return {...result, ..._encodedStaticParams};
    }
    return result;
  }

  @override
  String stringify(T value, MappingContext context) {
    return '$id(${_members.map((f) {
      return '${f.name}: ${context.container.asString(f.get(value))}';
    }).join(', ')})';
  }

  @override
  int hash(T value, MappingContext context) {
    return Object.hashAll(
      _members.map((f) {
        return context.container.hash(f.get(value));
      }),
    );
  }

  @override
  bool equals(T value, T other, MappingContext context) {
    if (value.runtimeType.base != other.runtimeType.base) {
      return false;
    }
    return _members.every((f) {
      return context.container.isEqual(f.get(value), f.get(other));
    });
  }
}
