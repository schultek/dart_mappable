import 'dart:convert';

import 'package:meta/meta.dart';

import '../annotations.dart';
import '../mapper_exception.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';
import 'mapping_context.dart';

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
  final Object? Function(T) getter;

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

  final MapperBase Function()? map;

  const Field(
    this.name,
    this.getter, {
    String? key,
    this.mode = FieldMode.field,
    this.arg,
    this.opt = false,
    this.def,
    this.hook,
    this.map,
  }) : key = key ?? name;

  Object? get(T value) {
    return getter(value);
  }

  dynamic encode(T value, EncodingContext context) {
    var options = context.options;
    if (arg == null) {
      return context.$enc<V>(get(value), name, options, hook, map?.call());
    } else {
      return context.callWith(
        arg!,
        <U>() => context.$enc<U>(get(value), name, options, hook, map?.call()),
      );
    }
  }

  R decode<R>(Map<String, dynamic> value, DecodingContext context) {
    var result = opt || def != null
        ? context.$dec<R?>(value[key], key, hook, map?.call())
        : context.$dec<R>(value[key], key, hook, map?.call());
    return result ?? (def as R);
  }
}

/// The decoding data passed to a class mappers `instantiate` method.
///
/// This should not be used in non-generated code.
class DecodingData<T extends Object> {
  DecodingData(this.value, this.context);

  final Map<String, dynamic> value;
  final DecodingContext context;

  V dec<V>(Field f) => f.decode(value, context);
}

/// The common mapper interface for class and record mappers.
///
/// See also [ClassMapperBase] and [RecordMapperBase].
abstract class InterfaceMapperBase<T extends Object> extends MapperBase<T> {
  const InterfaceMapperBase();

  /// The set of fields this interface defines.
  Map<Symbol, Field<T, dynamic>> get fields;

  /// Whether to ignore null values when encoding the fields of this interface.
  bool get ignoreNull => false;

  /// The optional mapping hook defined for this interface.
  MappingHook? get hook => null;

  @override
  bool includeTypeId<V>(v) => MapperBase.checkStaticType<V>(v);

  /// The instantiate method to create a new instance of this interface.
  ///
  /// Must be implemented by the generated mapper.
  Function get instantiate;

  @override
  T decoder(Object? value, DecodingContext context) {
    if (hook != null) {
      value = hook!.beforeDecode(value);

      if (value is T) {
        return hook!.afterDecode(value) as T;
      }
    }

    var result = decode(value, context);

    if (hook != null) {
      result = hook!.afterDecode(result) as T;
    }

    return result;
  }

  @protected
  T decode(Object? value, DecodingContext context) {
    var map = value.checked<Map<String, dynamic>>();

    var d = DecodingData<T>(map, context);
    if (context.args.isEmpty) {
      return instantiate(d) as T;
    } else {
      return context.callWith(instantiate, d);
    }
  }

  @override
  Object? encoder(T value, EncodingContext context) {
    if (hook != null) {
      var result = hook!.beforeEncode(value);

      if (result is! T) {
        return hook!.afterEncode(result);
      }
      value = result;
    }

    var result = encode(value, context);

    if (hook != null) {
      result = hook!.afterEncode(result);
    }

    return result;
  }

  @protected
  Object? encode(T value, EncodingContext context) {
    return {
      for (var f in fields.values)
        if (!ignoreNull || f.get(value) != null)
          f.key: f.encode(value, context),
    };
  }

  V decodeMap<V>(Map<String, dynamic> map) => decodeValue<V>(map);

  Map<String, dynamic> encodeMap<V>(V object) {
    var value = encodeValue<V>(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException.incorrectEncoding(
          object.runtimeType, 'Map', value.runtimeType);
    }
  }

  V decodeJson<V>(String json) => decodeValue<V>(jsonDecode(json));

  String encodeJson<V>(V object) => jsonEncode(encodeValue<V>(object));
}
