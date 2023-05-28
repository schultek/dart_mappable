import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:type_plus/type_plus.dart';

import '../annotations.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';

/// The decoding data passed to a class mappers `instantiate` method.
///
/// This should not be used in non-generated code.
class DecodingData<T extends Object> {
  DecodingData(this.value, this.context);

  final Map<String, dynamic> value;
  final DecodingContext context;

  V dec<V>(Field f) {
    return f.decode(value, context);
  }
}

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
            'Discriminator function must be of type "bool Function(Map<String, dynamic>)".');
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
    if (_shouldEncodeDiscriminatorParam) discriminatorKey: discriminatorValue
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
abstract class ClassMapperBase<T extends Object> extends MapperBase<T> {
  /// The set of fields this class defines.
  Map<Symbol, Field<T, dynamic>> get fields;

  /// Whether to ignore null values when encoding the fields of this class.
  bool get ignoreNull => false;

  /// The optional mapping hook defined for this class.
  MappingHook? get hook => null;

  /// The optional mapping hook defined for the superclass of this class.
  MappingHook? get superHook => null;

  /// The fallback subclass mapper for this class.
  SubClassMapperBase<T>? _defaultSubMapper;

  /// The set of subclass mappers for this class.
  final Set<SubClassMapperBase<T>> _subMappers = {};

  @override
  bool includeTypeId<V>(v) => MapperBase.checkStaticType<V>(v);

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
      assert(_defaultSubMapper == null,
          'Cannot have multiple default mappers for a polymorphic class.');
      _defaultSubMapper = mapper;
    } else {
      _subMappers.add(mapper);
    }
  }

  MapperBase<Object>? subOrSelfFor(dynamic value) {
    var m = _defaultSubMapper ?? this;
    if (_subMappers.isNotEmpty) {
      m = _subMappers.where((m) => m.isFor(value)).firstOrNull ?? m;
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
      fields.values.where((f) => f.mode != FieldMode.member).toList();

  /// The instantiate method to create a new instance of this class.
  ///
  /// Must be implemented by the generated mapper.
  Function get instantiate;

  @override
  T decoder(Object? value, DecodingContext context) {
    if (superHook != null && !context.inherited) {
      value = superHook!.beforeDecode(value);

      if (value is T) {
        return superHook!.afterDecode(value) as T;
      }
    }

    if (hook != null) {
      value = hook!.beforeDecode(value);

      if (value is T) {
        return hook!.afterDecode(value) as T;
      }
    }

    var result = _decode(value, context);

    if (hook != null) {
      result = hook!.afterDecode(result) as T;
    }

    if (superHook != null && !context.inherited) {
      result = superHook!.afterDecode(result) as T;
    }

    return result;
  }

  T _decode(Object? value, DecodingContext context) {
    var map = value.checked<Map<String, dynamic>>();
    if (_subMappers.isNotEmpty) {
      for (var m in _subMappers) {
        if (m.canDecode(map)) {
          return m.decoder(map, m.inherit(context));
        }
      }
    }
    if (_defaultSubMapper != null) {
      return _defaultSubMapper!
          .decoder(map, _defaultSubMapper!.inherit(context));
    }
    var d = DecodingData<T>(map, context);
    if (context.args.isEmpty) {
      return instantiate(d) as T;
    } else {
      return context.callWith(instantiate, d);
    }
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

    if (hook != null) {
      var result = hook!.beforeEncode(value);

      if (result is! T) {
        return hook!.afterEncode(result);
      }
      value = result;
    }

    Object? result = {
      for (var f in _params)
        if (f.getter != null && (!ignoreNull || f.get(value) != null))
          f.key: f.encode(value, context),
      ...?_encodedStaticParams,
    };

    if (hook != null) {
      result = hook!.afterEncode(result);
    }

    if (superHook != null) {
      result = superHook!.afterEncode(result);
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
    return Object.hashAll(_members.map((f) {
      return context.container.hash(f.get(value));
    }));
  }

  @override
  bool equals(T value, T other, MappingContext context) {
    return _members.every((f) {
      return context.container.isEqual(f.get(value), f.get(other));
    });
  }
}

/// The mode of a field defined in a class.
enum FieldMode {
  /// A field that is only defined as a constructor parameter.
  param,

  /// A field that is only defined as a class member (e.g. getter).
  member,

  /// A field that is both a constructor parameter and class member.
  field;
}

/// A field defined in a class that is relevant for its mapping.
class Field<T extends Object, V> {
  /// The name of the field.
  final String name;

  /// The getter returns the fields value for a given instance.
  final Object? Function(T)? getter;

  /// The mapping key of the field, or the name by default.
  final String key;

  /// The mode of the field.
  final FieldMode mode;

  /// An optional type factory when this field is of a generic type.
  final Function? arg;

  /// Whether this field is optional in the class constructor.
  final bool opt;

  /// An optional default value for this field.
  final V? def;

  /// The optional mapping hook for this field.
  final MappingHook? hook;

  const Field(
    this.name,
    this.getter, {
    String? key,
    this.mode = FieldMode.field,
    this.arg,
    this.opt = false,
    this.def,
    this.hook,
  }) : key = key ?? name;

  Object? get(T value) {
    return getter?.call(value);
  }

  dynamic encode(T value, EncodingContext context) {
    var container = context.container;
    var options = context.options;
    if (arg == null) {
      return container.$enc<V>(get(value), name, options, hook);
    } else {
      return context.callWith(
        arg!,
        <U>() => container.$enc<U>(get(value), name, options, hook),
      );
    }
  }

  R decode<R>(Map<String, dynamic> value, DecodingContext context) {
    var result = opt || def != null
        ? context.container.$dec<R?>(value[key], key, hook)
        : context.container.$dec<R>(value[key], key, hook);
    return result ?? (def as R);
  }
}
