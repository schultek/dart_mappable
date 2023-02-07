import 'dart:convert';

import '../annotations.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';

class DecodingData<T extends Object> {
  DecodingData(this.options, this.mapper);

  final DecodingOptions<Map<String, dynamic>> options;
  final ClassMapperBase<T> mapper;

  Map<String, dynamic> get value => options.value;

  V get<V>(Symbol name) {
    return mapper.fields[name]!.decode(options);
  }
}

abstract class DiscriminatorSubClassMapperBase<T extends Object>
    extends SubClassMapperBase<T> {
  String get discriminatorKey;
  dynamic get discriminatorValue;

  @override
  bool canDecode(DecodingOptions<Map<String, dynamic>> options) {
    var value = discriminatorValue;
    if (identical(value, MappingFlags.useAsDefault)) {
      return true;
    } else if (value is Function) {
      if (value is bool Function(Map<String, dynamic>)) {
        if (value(options.value)) {
          return true;
        }
      } else {
        throw AssertionError(
            'Discriminator function must be of type "bool Function(Map<String, dynamic>)".');
      }
    } else if (value == options.value[discriminatorKey]) {
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
  bool canDecode(DecodingOptions<Map<String, dynamic>> options) {
    return false;
  }
}

abstract class ClassMapperBase<T extends Object> extends MapperBase<T> {
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
  T decoder(DecodingOptions<Object> options) {
    return options.wrap(hook: superHook, skipInherited: true, (c) {
      return c.wrap(hook: hook, (c) {
        var context = c.checked<Map<String, dynamic>>();
        if (_subMappers.isNotEmpty) {
          for (var m in _subMappers) {
            if (m.canDecode(context)) {
              return m.decoder(context.inherit());
            }
          }
        }
        if (_defaultSubMapper != null) {
          return _defaultSubMapper!.decoder(context.inherit());
        }
        return c.callWith(instantiate, DecodingData<T>(c.checked(), this));
      });
    });
  }

  T jsonDecoder(DecodingOptions<String> options) {
    return decoder(options.change(jsonDecode(options.value) as Object));
  }

  @override
  Object? encoder(EncodingOptions<Object> options) {
    return options.checked<T>().wrap(hook: superHook, (c) {
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

  String jsonEncoder(EncodingOptions<Object> options) {
    return jsonEncode(encoder(options));
  }

  @override
  String stringify(MappingOptions<Object> options) {
    var value = options.checked<T>().value;
    return '$id(${_members.map((f) {
      return '${f.name}: ${options.container.asString(f.get(value))}';
    }).join(', ')})';
  }

  @override
  int hash(MappingOptions<Object> options) {
    var value = options.checked<T>().value;
    return Object.hashAll(_members.map((f) {
      return options.container.hash(f.get(value));
    }));
  }

  @override
  bool equals(MappingOptions<Object> options, T other) {
    var value = options.checked<T>().value;
    return _members.every((f) {
      return options.container.isEqual(f.get(value), f.get(other));
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

  dynamic encode(EncodingOptions<T> options) {
    var container = options.container;
    if (arg == null) {
      return container.$enc<V>(get(options.value), name, hook);
    } else {
      return options.callWith(arg!,
          <U>() => container.$enc<U>(get(options.value) as U, name, hook));
    }
  }

  R decode<R>(DecodingOptions<Map<String, dynamic>> options) {
    var value = opt || def != null
        ? options.container.$dec<R?>(options.value[key], key, hook)
        : options.container.$dec<R>(options.value[key], key, hook);
    return value ?? (def as R);
  }
}
