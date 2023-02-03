// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'main.dart';

class UnionMapper extends ClassMapperBase<Union> {
  static final UnionMapper instance = UnionMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({
      DataMapper.container,
      LoadingMapper.container,
      ErrorDetailsMapper.container,
    }));

  @override
  String get id => 'Union';


  @override
  final Map<Symbol, Field<Union, dynamic>> fields = const {
  };

  static Union _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('Union', 'type', '${map['type']}');
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Union>;
  static final fromJson = container.fromJson<Union>;
}

extension UnionMapperExtension on Union {
  String toJson() => UnionMapper.container.toJson(this);
  Map<String, dynamic> toMap() => UnionMapper.container.toMap(this);
}

typedef UnionCopyWithBound = Union;
abstract class UnionCopyWith<$R, $In extends Union, $Out extends Union> implements ObjectCopyWith<$R, $In, $Out> {
  UnionCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Union>(Then<Union, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}


class DataMapper extends ClassMapperBase<Data> {
  static final DataMapper instance = DataMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({UnionMapper.container}));

  @override
  String get id => 'Data';

  static int _$value(Data v) => v.value;

  @override
  final Map<Symbol, Field<Data, dynamic>> fields = const {
    #value: Field<Data, int>('value', _$value, key: 'mykey'),
  };

  static Data _instantiate(DecodingData data) {
    return Data(data.get(#value));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Data>;
  static final fromJson = container.fromJson<Data>;
}

extension DataMapperExtension on Data {
  String toJson() => DataMapper.container.toJson(this);
  Map<String, dynamic> toMap() => DataMapper.container.toMap(this);
}

class LoadingMapper extends ClassMapperBase<Loading> {
  static final LoadingMapper instance = LoadingMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({UnionMapper.container}));

  @override
  String get id => 'Loading';

  static int _$value(Loading v) => v.value;

  @override
  final Map<Symbol, Field<Loading, dynamic>> fields = const {
    #value: Field<Loading, int>('value', _$value),
  };

  static Loading _instantiate(DecodingData data) {
    return Loading(data.get(#value));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Loading>;
  static final fromJson = container.fromJson<Loading>;
}

extension LoadingMapperExtension on Loading {
  String toJson() => LoadingMapper.container.toJson(this);
  Map<String, dynamic> toMap() => LoadingMapper.container.toMap(this);
}

class ErrorDetailsMapper extends ClassMapperBase<ErrorDetails> {
  static final ErrorDetailsMapper instance = ErrorDetailsMapper();
  static MapperContainer? _c;
  static final MapperContainer container = _c ?? ((_c = MapperContainer())
  ..use(instance)
  ..linkAll({UnionMapper.container}));

  @override
  String get id => 'ErrorDetails';

  static int _$value(ErrorDetails v) => v.value;
  static String? _$message(ErrorDetails v) => v.message;

  @override
  final Map<Symbol, Field<ErrorDetails, dynamic>> fields = const {
    #value: Field<ErrorDetails, int>('value', _$value),
    #message: Field<ErrorDetails, String?>('message', _$message, opt: true),
  };

  static ErrorDetails _instantiate(DecodingData data) {
    return ErrorDetails(data.get(#value), data.get(#message));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<ErrorDetails>;
  static final fromJson = container.fromJson<ErrorDetails>;
}

extension ErrorDetailsMapperExtension on ErrorDetails {
  String toJson() => ErrorDetailsMapper.container.toJson(this);
  Map<String, dynamic> toMap() => ErrorDetailsMapper.container.toMap(this);
}
