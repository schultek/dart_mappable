import '../annotations.dart';
import '../mapper_container.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';

typedef DecodingData<T extends Object>
    = DecodingContext<Map<String, dynamic>, ClassMapperBase<T>, T>;
typedef EncodingData<T extends Object>
    = EncodingContext<T, ClassMapperBase<T>, T>;

extension DecodingDataGet on DecodingData {
  T get<T>(Symbol name) => context.mapper.fields[name]!.decode(this);
}

abstract class SubClassMapperBase<T extends Object>
    implements ClassMapperBase<T> {
  bool canDecode(
      DecodingContext<Map<String, dynamic>, ClassMapperBase<T>, T> context);
  DecodingContext<Object, MapperBase, Object> inherit(
          DecodingContext<Object, MapperBase, Object> context) =>
      context.inherit();
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
  T decode(DecodingData<T> data) {
    return data.callWith(instantiate, data);
  }

  @override
  ClassMapperElement<T> createElement(MapperContainer container) {
    return ClassMapperElement(this, container);
  }
}

class ClassMapperElement<T extends Object>
    extends MapperElementBase<ClassMapperBase<T>, T> {
  ClassMapperElement(super.mapper, super.container);

  @override
  T decoder(DecodingOptions<Object> options) {
    return options.apply(this).wrap(hook: mapper.superHook, skipInherited: true,
        (c) {
      return c.wrap(hook: mapper.hook, (c) {
        var context = c.checked<Map<String, dynamic>>();
        if (mapper.subMappers.isNotEmpty) {
          for (var m in mapper.subMappers) {
            if (m.canDecode(context)) {
              return m.createElement(container).decoder(m.inherit(context));
            }
          }
        }
        return mapper.decode(c.checked());
      });
    });
  }

  @override
  Object? encoder(EncodingOptions<Object> options) {
    return options.apply(this).checked<T>().wrap(hook: mapper.superHook, (c) {
      return c.wrap(hook: mapper.hook, (c) {
        return {
          for (var f in mapper._params)
            if (!mapper.ignoreNull || f.get(c.value) != null) f.key: f.encode(c)
        };
      });
    });
  }

  @override
  String stringify(T self) {
    return '${mapper.id}(${mapper._members.map((f) {
      return '${f.name}: ${container.asString(f.get(self))}';
    }).join(', ')})';
  }

  @override
  int hash(T self) {
    return Object.hashAll(mapper._members.map((f) {
      return container.hash(f.get(self));
    }));
  }

  @override
  bool equals(T self, T other) {
    return mapper._members.every((f) {
      return container.isEqual(f.get(self), f.get(other));
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

  dynamic encode(EncodingData<T> context) {
    var container = context.context.container;
    if (arg == null) {
      return container.$enc<V>(get(context.value), name, hook);
    } else {
      return context.callWith(arg!, <U>() => container.$enc<U>(get(context.value) as U, name, hook));
    }
  }

  R decode<R>(DecodingData<T> context) {
    var value = opt || def != null
        ? context.context.container.$dec<R?>(context.value[key], key, hook)
        : context.context.container.$dec<R>(context.value[key], key, hook);
    return value ?? (def as R);
  }
}
