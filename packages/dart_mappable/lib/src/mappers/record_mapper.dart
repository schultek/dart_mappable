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

class EncodingRecordData<T extends Record> extends RecordData<T> {
  EncodingRecordData(this.value, this.context);

  T value;
  @override
  EncodingContext context;
  Map<String, dynamic> result = {};

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

    var f = Field<T, V>(key, get);
    result[key] = f.encode(value, context);
    return f.get(value) as V;
  }
}

class DecodingRecordData<T extends Record> extends RecordData<T> {
  DecodingRecordData(this.value, this.context);

  Map<String, dynamic> value;
  @override
  DecodingContext context;

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

typedef _R1 = (dynamic,);
typedef _R2 = (dynamic, dynamic);
typedef _R3 = (dynamic, dynamic, dynamic);
typedef _R4 = (dynamic, dynamic, dynamic, dynamic);
typedef _R5 = (dynamic, dynamic, dynamic, dynamic, dynamic);

class RecordMapper<T extends Record> extends MapperBase<T> {
  RecordMapper(this.create, this.typeFactory);

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
    return context.callWith(create, DecodingRecordData<T>(v, context));
  }

  @override
  Object? encoder(T value, EncodingContext context) {
    var data = EncodingRecordData<T>(value, context);
    context.callWith(create, data);
    return data.result;
  }
}
