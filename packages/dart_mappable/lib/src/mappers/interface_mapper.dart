import 'dart:convert';

import '../annotations.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';

class DecodingData<T extends Object> {
  DecodingData(this.context, this.mapper);

  final DecodingContext<Map<String, dynamic>> context;
  final InterfaceMapperBase<T> mapper;

  Map<String, dynamic> get value => context.value;

  V get<V>(Symbol name) {
    return mapper.fields[name]!.decode(context);
  }
}

abstract class DiscriminatorSubClassMapperBase<T extends Object>
    extends SubClassMapperBase<T> {
  String get discriminatorKey;
  dynamic get discriminatorValue;

  @override
  bool canDecode(DecodingContext<Map<String, dynamic>> context) {
    var value = discriminatorValue;
    if (identical(value, MappingFlags.useAsDefault)) {
      return true;
    } else if (value is Function) {
      if (value is bool Function(Map<String, dynamic>)) {
        if (value(context.value)) {
          return true;
        }
      } else {
        throw AssertionError(
            'Discriminator function must be of type "bool Function(Map<String, dynamic>)".');
      }
    } else if (value == context.value[discriminatorKey]) {
      return true;
    }
    return false;
  }

  late final bool shouldEncodeDiscriminatorParam = () {
    return _params.every((p) => p.key != discriminatorKey) &&
        !identical(discriminatorValue, MappingFlags.useAsDefault) &&
        discriminatorValue is! Function;
  }();
}

abstract class SubClassMapperBase<T extends Object> extends ClassMapperBase<T> {
  bool canDecode(DecodingContext<Map<String, dynamic>> context) {
    return false;
  }
}

abstract class InterfaceMapperBase<T extends Object> extends MapperBase<T> {
  Map<Symbol, Field<T, dynamic>> get fields;
}

abstract class ClassMapperBase<T extends Object> extends InterfaceMapperBase<T> {
  @override
  Map<Symbol, Field<T, dynamic>> get fields;

  bool get ignoreNull => false;
  MappingHook? get hook => null;
  MappingHook? get superHook => null;

  SubClassMapperBase<T>? _defaultSubMapper;
  final Set<SubClassMapperBase<T>> _subMappers = {};

  void addSubMapper(SubClassMapperBase<T> mapper) {
    if (mapper is DiscriminatorSubClassMapperBase<T> &&
        identical(mapper.discriminatorValue, MappingFlags.useAsDefault)) {
      assert(_defaultSubMapper == null,
          'Cannot have multiple default mappers for a polymorphic class.');
      _defaultSubMapper = mapper;
    } else {
      _subMappers.add(mapper);
    }
  }

  late final List<Field<T, dynamic>> _members =
      fields.values.where((f) => f.mode != FieldMode.param).toList();
  late final List<Field<T, dynamic>> _params =
      fields.values.where((f) => f.mode != FieldMode.member).toList();

  Function get instantiate;

  @override
  T decoder(DecodingContext<Object> context) {
    return context.wrap(hook: superHook, skipInherited: true, (c) {
      return c.wrap(hook: hook, (c) {
        var c2 = c.checked<Map<String, dynamic>>();
        if (_subMappers.isNotEmpty) {
          for (var m in _subMappers) {
            if (m.canDecode(c2)) {
              return m.decoder(c2.inherit());
            }
          }
        }
        if (_defaultSubMapper != null) {
          return _defaultSubMapper!.decoder(c2.inherit());
        }
        return c.callWith(instantiate, DecodingData<T>(c.checked(), this));
      });
    });
  }

  @override
  Object? encoder(EncodingContext<Object> context) {
    return context.checked<T>().wrap(hook: superHook, (c) {
      return c.wrap(hook: hook, (c) {
        var $this = this;
        return {
          for (var f in _params)
            if (!ignoreNull || f.get(c.value) != null) f.key: f.encode(c),
          if ($this is DiscriminatorSubClassMapperBase<T> &&
              $this.shouldEncodeDiscriminatorParam)
            $this.discriminatorKey: $this.discriminatorValue
        };
      });
    });
  }

  @override
  String stringify(MappingContext<Object> context) {
    var value = context.checked<T>().value;
    return '$id(${_members.map((f) {
      return '${f.name}: ${context.container.asString(f.get(value))}';
    }).join(', ')})';
  }

  @override
  int hash(MappingContext<Object> context) {
    var value = context.checked<T>().value;
    return Object.hashAll(_members.map((f) {
      return context.container.hash(f.get(value));
    }));
  }

  @override
  bool equals(MappingContext<Object> context, T other) {
    var value = context.checked<T>().value;
    return _members.every((f) {
      return context.container.isEqual(f.get(value), f.get(other));
    });
  }
}

enum FieldMode {
  field,
  member,
  param;
}

class Field<T extends Object, V> {
  final String name;
  final V Function(T) get;
  final String key;
  final FieldMode mode;
  final Function? arg;
  final bool opt;
  final V? def;
  final MappingHook? hook;

  const Field(this.name, this.get,
      {String? key,
      this.mode = FieldMode.field,
      this.arg,
      this.opt = false,
      this.def,
      this.hook})
      : key = key ?? name;

  dynamic encode(EncodingContext<T> context) {
    var container = context.container;
    if (arg == null) {
      return container.$enc<V>(get(context.value), name, hook);
    } else {
      return context.callWith(arg!,
          <U>() => container.$enc<U>(get(context.value) as U, name, hook));
    }
  }

  R decode<R>(DecodingContext<Map<String, dynamic>> context) {
    var value = opt || def != null
        ? context.container.$dec<R?>(context.value[key], key, hook)
        : context.container.$dec<R>(context.value[key], key, hook);
    return value ?? (def as R);
  }
}
