// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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

  @override
  final String id = 'Union';

  @override
  final MappableFields<Union> fields = const {};

  static Union _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Union',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Union fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Union>(map);
  }

  static Union fromJson(String json) {
    return ensureInitialized().decodeJson<Union>(json);
  }
}

extension UnionMapperExtension on Union {
  String toJson() {
    return UnionMapper.ensureInitialized().encodeJson<Union>(this);
  }

  Map<String, dynamic> toMap() {
    return UnionMapper.ensureInitialized().encodeMap<Union>(this);
  }
}

abstract class UnionCopyWith<$R, $In extends Union, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UnionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
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

  @override
  final String id = 'Data';

  static int _$value(Data v) => v.value;
  static const Field<Data, int> _f$value = Field(
    'value',
    _$value,
    key: r'mykey',
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<Data> fields = const {#value: _f$value};

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
    return ensureInitialized().decodeMap<Data>(map);
  }

  static Data fromJson(String json) {
    return ensureInitialized().decodeJson<Data>(json);
  }
}

extension DataMapperExtension on Data {
  String toJson() {
    return DataMapper.ensureInitialized().encodeJson<Data>(this);
  }

  Map<String, dynamic> toMap() {
    return DataMapper.ensureInitialized().encodeMap<Data>(this);
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

  @override
  final String id = 'Loading';

  static int _$value(Loading v) => v.value;
  static const Field<Loading, int> _f$value = Field(
    'value',
    _$value,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<Loading> fields = const {#value: _f$value};

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
    return ensureInitialized().decodeMap<Loading>(map);
  }

  static Loading fromJson(String json) {
    return ensureInitialized().decodeJson<Loading>(json);
  }
}

extension LoadingMapperExtension on Loading {
  String toJson() {
    return LoadingMapper.ensureInitialized().encodeJson<Loading>(this);
  }

  Map<String, dynamic> toMap() {
    return LoadingMapper.ensureInitialized().encodeMap<Loading>(this);
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

  @override
  final String id = 'ErrorDetails';

  static int _$value(ErrorDetails v) => v.value;
  static const Field<ErrorDetails, int> _f$value = Field(
    'value',
    _$value,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static String? _$message(ErrorDetails v) => v.message;
  static const Field<ErrorDetails, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<ErrorDetails> fields = const {
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
    return ensureInitialized().decodeMap<ErrorDetails>(map);
  }

  static ErrorDetails fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorDetails>(json);
  }
}

extension ErrorDetailsMapperExtension on ErrorDetails {
  String toJson() {
    return ErrorDetailsMapper.ensureInitialized().encodeJson<ErrorDetails>(
      this,
    );
  }

  Map<String, dynamic> toMap() {
    return ErrorDetailsMapper.ensureInitialized().encodeMap<ErrorDetails>(this);
  }
}

