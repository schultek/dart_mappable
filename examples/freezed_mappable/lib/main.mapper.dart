// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'main.dart';

class UnionMapper extends ClassMapperBase<Union> {
  UnionMapper._();

  static UnionMapper? _instance;
  static UnionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnionMapper._());
      DataMapper.ensureInitialized();
      LoadingMapper.ensureInitialized();
      ErrorDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Union';

  @override
  final Map<Symbol, Field<Union, dynamic>> fields = const {};

  static Union _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Union', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Union fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Union>(map));
  }

  static Union fromJson(String json) {
    return _guard((c) => c.fromJson<Union>(json));
  }
}

extension UnionMapperExtension on Union {
  String toJson() {
    return UnionMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return UnionMapper._guard((c) => c.toMap(this));
  }
}

typedef UnionCopyWithBound = Union;

abstract class UnionCopyWith<$R, $In extends Union, $Out extends Union>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UnionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Union>(
      Then<Union, $Out2> t, Then<$Out2, $R2> t2);
}

class DataMapper extends SubClassMapperBase<Data> {
  DataMapper._();

  static DataMapper? _instance;
  static DataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataMapper._());
      UnionMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Data';

  static int _$value(Data v) => v.value;
  static const Field<Data, int> _f$value =
      Field('value', _$value, key: 'mykey');

  @override
  final Map<Symbol, Field<Data, dynamic>> fields = const {
    #value: _f$value,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'data';
  @override
  late final ClassMapperBase superMapper = UnionMapper.ensureInitialized();

  static Data _instantiate(DecodingData data) {
    return Data(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Data fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Data>(map));
  }

  static Data fromJson(String json) {
    return _guard((c) => c.fromJson<Data>(json));
  }
}

extension DataMapperExtension on Data {
  String toJson() {
    return DataMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return DataMapper._guard((c) => c.toMap(this));
  }
}

class LoadingMapper extends SubClassMapperBase<Loading> {
  LoadingMapper._();

  static LoadingMapper? _instance;
  static LoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadingMapper._());
      UnionMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Loading';

  static int _$value(Loading v) => v.value;
  static const Field<Loading, int> _f$value = Field('value', _$value);

  @override
  final Map<Symbol, Field<Loading, dynamic>> fields = const {
    #value: _f$value,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'loading';
  @override
  late final ClassMapperBase superMapper = UnionMapper.ensureInitialized();

  static Loading _instantiate(DecodingData data) {
    return Loading(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Loading fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Loading>(map));
  }

  static Loading fromJson(String json) {
    return _guard((c) => c.fromJson<Loading>(json));
  }
}

extension LoadingMapperExtension on Loading {
  String toJson() {
    return LoadingMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return LoadingMapper._guard((c) => c.toMap(this));
  }
}

class ErrorDetailsMapper extends SubClassMapperBase<ErrorDetails> {
  ErrorDetailsMapper._();

  static ErrorDetailsMapper? _instance;
  static ErrorDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorDetailsMapper._());
      UnionMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ErrorDetails';

  static int _$value(ErrorDetails v) => v.value;
  static const Field<ErrorDetails, int> _f$value = Field('value', _$value);
  static String? _$message(ErrorDetails v) => v.message;
  static const Field<ErrorDetails, String?> _f$message =
      Field('message', _$message, opt: true);

  @override
  final Map<Symbol, Field<ErrorDetails, dynamic>> fields = const {
    #value: _f$value,
    #message: _f$message,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'error';
  @override
  late final ClassMapperBase superMapper = UnionMapper.ensureInitialized();

  static ErrorDetails _instantiate(DecodingData data) {
    return ErrorDetails(data.dec(_f$value), data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorDetails fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ErrorDetails>(map));
  }

  static ErrorDetails fromJson(String json) {
    return _guard((c) => c.fromJson<ErrorDetails>(json));
  }
}

extension ErrorDetailsMapperExtension on ErrorDetails {
  String toJson() {
    return ErrorDetailsMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return ErrorDetailsMapper._guard((c) => c.toMap(this));
  }
}
