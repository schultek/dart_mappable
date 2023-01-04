// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'main.dart';

class UnionMapper extends MapperBase<Union> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {UnionMapper()},
      ))
        ..linkAll({
          DataMapper.container,
          LoadingMapper.container,
          ErrorDetailsMapper.container,
        }));

  @override
  UnionMapperElement createElement(MapperContainer container) {
    return UnionMapperElement._(this, container);
  }

  @override
  String get id => 'Union';

  static final fromMap = container.fromMap<Union>;
  static final fromJson = container.fromJson<Union>;
}

class UnionMapperElement extends MapperElementBase<Union> {
  UnionMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Union decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'data':
            return DataMapper().createElement(container).decode(map);
          case 'error':
            return ErrorDetailsMapper().createElement(container).decode(map);
          case 'loading':
            return LoadingMapper().createElement(container).decode(map);
          default:
            return fromMap(map);
        }
      });
  Union fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass('Union', 'type', '${map['type']}');

  @override
  Function get encoder => encode;
  dynamic encode(Union v) => toMap(v);
  Map<String, dynamic> toMap(Union u) => {};

  @override
  String stringify(Union self) => 'Union()';
  @override
  int hash(Union self) => 0;
  @override
  bool equals(Union self, Union other) => true;
}

extension UnionMapperExtension on Union {
  String toJson() => UnionMapper.container.toJson(this);
  Map<String, dynamic> toMap() => UnionMapper.container.toMap(this);
}

typedef UnionCopyWithBound = Union;

abstract class UnionCopyWith<$R, $In extends Union, $Out extends Union>
    implements ObjectCopyWith<$R, $In, $Out> {
  UnionCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Union>(
      Then<Union, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class DataMapper extends MapperBase<Data> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DataMapper()},
      ))
        ..linkAll({UnionMapper.container}));

  @override
  DataMapperElement createElement(MapperContainer container) {
    return DataMapperElement._(this, container);
  }

  @override
  String get id => 'Data';

  static final fromMap = container.fromMap<Data>;
  static final fromJson = container.fromJson<Data>;
}

class DataMapperElement extends MapperElementBase<Data> {
  DataMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Data decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Data fromMap(Map<String, dynamic> map) => Data(container.$get(map, 'mykey'));

  @override
  Function get encoder => encode;
  dynamic encode(Data v) => toMap(v);
  Map<String, dynamic> toMap(Data d) =>
      {'mykey': container.$enc(d.value, 'value'), 'type': 'data'};

  @override
  String stringify(Data self) => 'Data()';
  @override
  int hash(Data self) => 0;
  @override
  bool equals(Data self, Data other) => true;
}

extension DataMapperExtension on Data {
  String toJson() => DataMapper.container.toJson(this);
  Map<String, dynamic> toMap() => DataMapper.container.toMap(this);
}

class LoadingMapper extends MapperBase<Loading> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {LoadingMapper()},
      ))
        ..linkAll({UnionMapper.container}));

  @override
  LoadingMapperElement createElement(MapperContainer container) {
    return LoadingMapperElement._(this, container);
  }

  @override
  String get id => 'Loading';

  static final fromMap = container.fromMap<Loading>;
  static final fromJson = container.fromJson<Loading>;
}

class LoadingMapperElement extends MapperElementBase<Loading> {
  LoadingMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Loading decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Loading fromMap(Map<String, dynamic> map) =>
      Loading(container.$get(map, 'value'));

  @override
  Function get encoder => encode;
  dynamic encode(Loading v) => toMap(v);
  Map<String, dynamic> toMap(Loading l) =>
      {'value': container.$enc(l.value, 'value'), 'type': 'loading'};

  @override
  String stringify(Loading self) => 'Loading()';
  @override
  int hash(Loading self) => 0;
  @override
  bool equals(Loading self, Loading other) => true;
}

extension LoadingMapperExtension on Loading {
  String toJson() => LoadingMapper.container.toJson(this);
  Map<String, dynamic> toMap() => LoadingMapper.container.toMap(this);
}

class ErrorDetailsMapper extends MapperBase<ErrorDetails> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {ErrorDetailsMapper()},
      ))
        ..linkAll({UnionMapper.container}));

  @override
  ErrorDetailsMapperElement createElement(MapperContainer container) {
    return ErrorDetailsMapperElement._(this, container);
  }

  @override
  String get id => 'ErrorDetails';

  static final fromMap = container.fromMap<ErrorDetails>;
  static final fromJson = container.fromJson<ErrorDetails>;
}

class ErrorDetailsMapperElement extends MapperElementBase<ErrorDetails> {
  ErrorDetailsMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ErrorDetails decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ErrorDetails fromMap(Map<String, dynamic> map) => ErrorDetails(
      container.$get(map, 'value'), container.$getOpt(map, 'message'));

  @override
  Function get encoder => encode;
  dynamic encode(ErrorDetails v) => toMap(v);
  Map<String, dynamic> toMap(ErrorDetails e) => {
        'value': container.$enc(e.value, 'value'),
        'message': container.$enc(e.message, 'message'),
        'type': 'error'
      };

  @override
  String stringify(ErrorDetails self) => 'ErrorDetails()';
  @override
  int hash(ErrorDetails self) => 0;
  @override
  bool equals(ErrorDetails self, ErrorDetails other) => true;
}

extension ErrorDetailsMapperExtension on ErrorDetails {
  String toJson() => ErrorDetailsMapper.container.toJson(this);
  Map<String, dynamic> toMap() => ErrorDetailsMapper.container.toMap(this);
}
