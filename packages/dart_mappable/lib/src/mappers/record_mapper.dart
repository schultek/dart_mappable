import '../mapper_container.dart';
import '../mapper_utils.dart';
import 'class_mapper.dart';
import 'mapper_base.dart';

typedef RecordSchema = Record;

extension JsonRecord on Record {
  Map<String, dynamic> toMap({RecordSchema? schema}) {
    return MapperContainer.globals
            .toValue(this, EncodingOptions(includeTypeId: false, data: schema))
        as Map<String, dynamic>;
  }

  static T fromMap<T extends Record>(Map<String, dynamic> map,
      {RecordSchema? schema}) {
    return MapperContainer.globals
        .fromValue(map, DecodingOptions(data: schema));
  }
}

abstract class RecordData<T extends Record> {
  MappingContext get context;
  V call<V>(String key, Object? Function(T) get);
}

class EncodingRecordData<T extends Record> extends TransformingRecordData<T> {
  EncodingRecordData(super.value, EncodingContext super.context);

  Map<String, dynamic> result = {};

  @override
  V call<V>(String key, Object? Function(T p1) get) {
    var c = context as EncodingContext;
    if (c.options?.data is T) {
      var schemaKey = get(c.options!.data as T);
      assert(
        schemaKey is String,
        'Record schema must contain only strings, '
        'but found ${schemaKey.runtimeType} in ${c.options!.data}.',
      );
      key = schemaKey as String;
    }
    return super.call(key, get);
  }

  @override
  void apply(Field f) {
    result[f.key] = f.encode(value, context as EncodingContext);
  }
}

class DecodingRecordData<T extends Record> extends RecordData<T> {
  DecodingRecordData(this.value, this.context);

  final Map<String, dynamic> value;
  @override
  final DecodingContext context;

  @override
  V call<V>(String key, Object? Function(T p1) get) {
    if (context.options?.data is T) {
      var schemaKey = get(context.options!.data as T);
      assert(
        schemaKey is String,
        'Record schema must contain only strings, '
        'but found ${schemaKey.runtimeType} in ${context.options!.data}.',
      );
      key = schemaKey as String;
    }

    var f = Field(key, get);
    return f.decode(value, context);
  }
}

abstract class TransformingRecordData<T extends Record> extends RecordData<T> {
  TransformingRecordData(this.value, this.context);

  final T value;
  @override
  final MappingContext context;

  @override
  V call<V>(String key, Object? Function(T p1) get) {
    var f = Field<T, V>(key, get);
    apply(f);
    return f.get(value) as V;
  }

  void apply(Field f);
}

class EqualsRecordData<T extends Record> extends TransformingRecordData<T> {
  EqualsRecordData(super.value, this.other, super.context);

  final T other;
  bool result = true;

  @override
  void apply(Field f) {
    result &= context.container.isEqual(f.get(value), f.get(other));
  }
}

class HashRecordData<T extends Record> extends TransformingRecordData<T> {
  HashRecordData(super.value, super.context);

  List<int> hashes = [];

  int get result => Object.hashAllUnordered(hashes);

  @override
  void apply(Field f) {
    hashes.add(context.container.hash(f.get(value)));
  }
}

class StringifyRecordData<T extends Record> extends TransformingRecordData<T> {
  StringifyRecordData(super.value, super.context);

  List<String> fields = [];

  @override
  void apply(Field f) {
    fields.add('${int.tryParse(f.key) != null ? '' : '${f.key}: '}'
        '${context.container.asString(f.get(value))}');
  }

  String get result => '(${fields.join(', ')})';
}

typedef _R1 = (dynamic,);
typedef _R2 = (dynamic, dynamic);
typedef _R3 = (dynamic, dynamic, dynamic);
typedef _R4 = (dynamic, dynamic, dynamic, dynamic);
typedef _R5 = (dynamic, dynamic, dynamic, dynamic, dynamic);

class RecordMapper<T extends Record> extends MapperBase<T> {
  RecordMapper(this.create, this.typeFactory);

  bool _initialized = false;
  void ensureInitialized() {
    if (_initialized) return;
    MapperContainer.globals.use(this);
    _initialized = true;
  }

  static final List<RecordMapper> defaults = List.unmodifiable([
    // one positioned parameter
    RecordMapper<_R1>(
      <A>(RecordData<_R1> d) => (d<A>('1', (r) => r.$1),),
      <A>(f) => f<(A,)>(),
    ),
    // two positioned parameters
    RecordMapper<_R2>(
      <A, B>(RecordData<_R2> d) => (
        d<A>('1', (r) => r.$1),
        d<B>('2', (r) => r.$2),
      ),
      <A, B>(f) => f<(A, B)>(),
    ),
    // three positioned parameters
    RecordMapper<_R3>(
      <A, B, C>(RecordData<_R3> d) => (
        d<A>('1', (r) => r.$1),
        d<B>('2', (r) => r.$2),
        d<C>('3', (r) => r.$3),
      ),
      <A, B, C>(f) => f<(A, B, C)>(),
    ),
    // four positioned parameters
    RecordMapper<_R4>(
      <A, B, C, D>(RecordData<_R4> d) => (
        d<A>('1', (r) => r.$1),
        d<B>('2', (r) => r.$2),
        d<C>('3', (r) => r.$3),
        d<D>('4', (r) => r.$4),
      ),
      <A, B, C, D>(f) => f<(A, B, C, D)>(),
    ),
    // five positioned parameters
    RecordMapper<_R5>(
      <A, B, C, D, E>(RecordData<_R5> d) => (
        d<A>('1', (r) => r.$1),
        d<B>('2', (r) => r.$2),
        d<C>('3', (r) => r.$3),
        d<D>('4', (r) => r.$4),
        d<E>('5', (r) => r.$5),
      ),
      <A, B, C, D, E>(f) => f<(A, B, C, D, E)>(),
    ),
  ]);

  Function create;

  @override
  final Function typeFactory;

  @override
  T decoder(Object value, DecodingContext context) {
    var v = value.checked<Map<String, dynamic>>();
    return _apply(DecodingRecordData<T>(v, context)).value;
  }

  @override
  Object? encoder(T value, EncodingContext context) {
    return _apply(EncodingRecordData<T>(value, context)).data.result;
  }

  @override
  bool equals(T value, T other, MappingContext context) {
    return _apply(EqualsRecordData<T>(value, other, context)).data.result;
  }

  @override
  int hash(T value, MappingContext context) {
    return _apply(HashRecordData<T>(value, context)).data.result;
  }

  @override
  String stringify(T value, MappingContext context) {
    return _apply(StringifyRecordData<T>(value, context)).data.result;
  }

  ({T value, D data}) _apply<D extends RecordData<T>>(D data) {
    return (value: data.context.callWith(create, data), data: data);
  }
}
