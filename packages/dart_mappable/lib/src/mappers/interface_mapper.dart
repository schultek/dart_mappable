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

abstract class SubClassMapperBase<T extends Object> extends ClassMapperBase<T> {
  bool canDecode(DecodingOptions<Map<String, dynamic>> options);
  DecodingOptions<Object> inherit(DecodingOptions<Object> options) {
    return options.inherit();
  }
}

abstract class ClassMapperBase<T extends Object> extends MapperBase<T> {
  Map<Symbol, Field<T, dynamic>> get fields;

  bool get ignoreNull => false;
  MappingHook? get hook => null;
  MappingHook? get superHook => null;
  List<SubClassMapperBase<T>> get subMappers => const [];

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
        if (subMappers.isNotEmpty) {
          for (var m in subMappers) {
            if (m.canDecode(context)) {
              return m.decoder(m.inherit(context));
            }
          }
        }
        return c.callWith(instantiate, DecodingData<T>(c.checked(), this));
      });
    });
  }

  @override
  Object? encoder(EncodingOptions<Object> options) {
    return options.checked<T>().wrap(hook: superHook, (c) {
      return c.wrap(hook: hook, (c) {
        return {
          for (var f in _params)
            if (!ignoreNull || f.get(c.value) != null) f.key: f.encode(c)
        };
      });
    });
  }

  @override
  String stringify(MappingOptions<T> options) {
    return '$id(${_members.map((f) {
      return '${f.name}: ${options.container.asString(f.get(options.value))}';
    }).join(', ')})';
  }

  @override
  int hash(MappingOptions<T> options) {
    return Object.hashAll(_members.map((f) {
      return options.container.hash(f.get(options.value));
    }));
  }

  @override
  bool equals(MappingOptions<T> options, T other) {
    return _members.every((f) {
      return options.container.isEqual(f.get(options.value), f.get(other));
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
