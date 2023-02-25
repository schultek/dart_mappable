import '../../dart_mappable.dart';

abstract class CopyWithData {
  bool has(Symbol name);
  V get<V>(Symbol name, {V or});
}

class FieldCopyWithData extends CopyWithData {
  FieldCopyWithData(this.fields);

  final Map<Symbol, dynamic> fields;

  @override
  bool has(Symbol name) {
    return fields.containsKey(name);
  }

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    if (fields.containsKey(name) || or == $none) {
      return fields[name] as V;
    } else {
      return or as V;
    }
  }
}

class MergeCopyWithData extends CopyWithData {
  MergeCopyWithData(this.mapper, this.value);

  final ClassMapperBase mapper;
  final Object value;

  @override
  bool has(Symbol name) {
    return mapper.fields[name]!.get(value) != null;
  }

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    var v = mapper.fields[name]!.get(value);
    if (v != null || or == $none) {
      return v as V;
    } else {
      return or as V;
    }
  }
}

class DeltaCopyWithData extends CopyWithData {
  DeltaCopyWithData(this.mapper, this.value)
      : context = DecodingContext(value, container: MapperContainer.globals);

  final ClassMapperBase mapper;
  final Map<String, dynamic> value;
  final DecodingContext<Map<String, dynamic>> context;

  @override
  bool has(Symbol name) {
    return value[mapper.fields[name]!.key] != null;
  }

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    if (value[mapper.fields[name]!.key] != null || or == $none) {
      return mapper.fields[name]!.decode(context);
    } else {
      return or as V;
    }
  }
}

class ChainedCopyWithData extends CopyWithData {
  ChainedCopyWithData(this.data);

  List<CopyWithData> data;

  @override
  bool has(Symbol name) {
    return data.any((d) => d.has(name));
  }

  @override
  V get<V>(Symbol name, {Object? or = $none}) {
    for (var d in data) {
      if (d.has(name) || or == $none) {
        try {
          return d.get(name);
        } catch (_) {}
      }
    }
    if (or == $none) {
      throw MapperException.missingParameter(name.toString());
    }
    return or as V;
  }
}

class BatchData<Result, In extends Object, Out> {
  ChainedCopyWithData? _data;

  void apply(CopyWithData data) {
    if (_data == null) {
      _data = ChainedCopyWithData([data]);
    } else {
      _data!.data.add(data);
    }
  }

  Out commit(ClassCopyWithBase<Result, In, Out> copy) {
    if (_data == null) {
      // ignore: invalid_use_of_protected_member
      return copy.$then1(copy.$value);
    }
    return copy.$then1(copy.$make(_data!));
  }
}
