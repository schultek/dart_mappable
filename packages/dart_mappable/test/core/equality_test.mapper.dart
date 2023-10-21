// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'equality_test.dart';

class SetWrapperMapper extends ClassMapperBase<SetWrapper> {
  SetWrapperMapper._();

  static SetWrapperMapper? _instance;
  static SetWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SetWrapperMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SetWrapper';

  static Set<String> _$values(SetWrapper v) => v.values;
  static const Field<SetWrapper, Set<String>> _f$values =
      Field('values', _$values);

  @override
  final Map<Symbol, Field<SetWrapper, dynamic>> fields = const {
    #values: _f$values,
  };

  static SetWrapper _instantiate(DecodingData data) {
    return SetWrapper(data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static SetWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SetWrapper>(map);
  }

  static SetWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<SetWrapper>(json);
  }
}

mixin SetWrapperMappable {
  String toJson() {
    return SetWrapperMapper.ensureInitialized()
        .encodeJson<SetWrapper>(this as SetWrapper);
  }

  Map<String, dynamic> toMap() {
    return SetWrapperMapper.ensureInitialized()
        .encodeMap<SetWrapper>(this as SetWrapper);
  }

  SetWrapperCopyWith<SetWrapper, SetWrapper, SetWrapper> get copyWith =>
      _SetWrapperCopyWithImpl(this as SetWrapper, $identity, $identity);
  @override
  String toString() {
    return SetWrapperMapper.ensureInitialized()
        .stringifyValue(this as SetWrapper);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SetWrapperMapper.ensureInitialized()
                .isValueEqual(this as SetWrapper, other));
  }

  @override
  int get hashCode {
    return SetWrapperMapper.ensureInitialized().hashValue(this as SetWrapper);
  }
}

extension SetWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SetWrapper, $Out> {
  SetWrapperCopyWith<$R, SetWrapper, $Out> get $asSetWrapper =>
      $base.as((v, t, t2) => _SetWrapperCopyWithImpl(v, t, t2));
}

abstract class SetWrapperCopyWith<$R, $In extends SetWrapper, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Set<String>? values});
  SetWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SetWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SetWrapper, $Out>
    implements SetWrapperCopyWith<$R, SetWrapper, $Out> {
  _SetWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SetWrapper> $mapper =
      SetWrapperMapper.ensureInitialized();
  @override
  $R call({Set<String>? values}) =>
      $apply(FieldCopyWithData({if (values != null) #values: values}));
  @override
  SetWrapper $make(CopyWithData data) =>
      SetWrapper(data.get(#values, or: $value.values));

  @override
  SetWrapperCopyWith<$R2, SetWrapper, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SetWrapperCopyWithImpl($value, $cast, t);
}

class ListWrapperMapper extends ClassMapperBase<ListWrapper> {
  ListWrapperMapper._();

  static ListWrapperMapper? _instance;
  static ListWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ListWrapperMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ListWrapper';

  static List<String> _$values(ListWrapper v) => v.values;
  static const Field<ListWrapper, List<String>> _f$values =
      Field('values', _$values);

  @override
  final Map<Symbol, Field<ListWrapper, dynamic>> fields = const {
    #values: _f$values,
  };

  static ListWrapper _instantiate(DecodingData data) {
    return ListWrapper(data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static ListWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListWrapper>(map);
  }

  static ListWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<ListWrapper>(json);
  }
}

mixin ListWrapperMappable {
  String toJson() {
    return ListWrapperMapper.ensureInitialized()
        .encodeJson<ListWrapper>(this as ListWrapper);
  }

  Map<String, dynamic> toMap() {
    return ListWrapperMapper.ensureInitialized()
        .encodeMap<ListWrapper>(this as ListWrapper);
  }

  ListWrapperCopyWith<ListWrapper, ListWrapper, ListWrapper> get copyWith =>
      _ListWrapperCopyWithImpl(this as ListWrapper, $identity, $identity);
  @override
  String toString() {
    return ListWrapperMapper.ensureInitialized()
        .stringifyValue(this as ListWrapper);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ListWrapperMapper.ensureInitialized()
                .isValueEqual(this as ListWrapper, other));
  }

  @override
  int get hashCode {
    return ListWrapperMapper.ensureInitialized().hashValue(this as ListWrapper);
  }
}

extension ListWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListWrapper, $Out> {
  ListWrapperCopyWith<$R, ListWrapper, $Out> get $asListWrapper =>
      $base.as((v, t, t2) => _ListWrapperCopyWithImpl(v, t, t2));
}

abstract class ListWrapperCopyWith<$R, $In extends ListWrapper, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values;
  $R call({List<String>? values});
  ListWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ListWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListWrapper, $Out>
    implements ListWrapperCopyWith<$R, ListWrapper, $Out> {
  _ListWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListWrapper> $mapper =
      ListWrapperMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call({List<String>? values}) =>
      $apply(FieldCopyWithData({if (values != null) #values: values}));
  @override
  ListWrapper $make(CopyWithData data) =>
      ListWrapper(data.get(#values, or: $value.values));

  @override
  ListWrapperCopyWith<$R2, ListWrapper, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ListWrapperCopyWithImpl($value, $cast, t);
}

class MapWrapperMapper extends ClassMapperBase<MapWrapper> {
  MapWrapperMapper._();

  static MapWrapperMapper? _instance;
  static MapWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MapWrapperMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MapWrapper';

  static Map<String, dynamic> _$values(MapWrapper v) => v.values;
  static const Field<MapWrapper, Map<String, dynamic>> _f$values =
      Field('values', _$values);

  @override
  final Map<Symbol, Field<MapWrapper, dynamic>> fields = const {
    #values: _f$values,
  };

  static MapWrapper _instantiate(DecodingData data) {
    return MapWrapper(data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static MapWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MapWrapper>(map);
  }

  static MapWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<MapWrapper>(json);
  }
}

mixin MapWrapperMappable {
  String toJson() {
    return MapWrapperMapper.ensureInitialized()
        .encodeJson<MapWrapper>(this as MapWrapper);
  }

  Map<String, dynamic> toMap() {
    return MapWrapperMapper.ensureInitialized()
        .encodeMap<MapWrapper>(this as MapWrapper);
  }

  MapWrapperCopyWith<MapWrapper, MapWrapper, MapWrapper> get copyWith =>
      _MapWrapperCopyWithImpl(this as MapWrapper, $identity, $identity);
  @override
  String toString() {
    return MapWrapperMapper.ensureInitialized()
        .stringifyValue(this as MapWrapper);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MapWrapperMapper.ensureInitialized()
                .isValueEqual(this as MapWrapper, other));
  }

  @override
  int get hashCode {
    return MapWrapperMapper.ensureInitialized().hashValue(this as MapWrapper);
  }
}

extension MapWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MapWrapper, $Out> {
  MapWrapperCopyWith<$R, MapWrapper, $Out> get $asMapWrapper =>
      $base.as((v, t, t2) => _MapWrapperCopyWithImpl(v, t, t2));
}

abstract class MapWrapperCopyWith<$R, $In extends MapWrapper, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get values;
  $R call({Map<String, dynamic>? values});
  MapWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MapWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MapWrapper, $Out>
    implements MapWrapperCopyWith<$R, MapWrapper, $Out> {
  _MapWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MapWrapper> $mapper =
      MapWrapperMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get values => MapCopyWith($value.values,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v));
  @override
  $R call({Map<String, dynamic>? values}) =>
      $apply(FieldCopyWithData({if (values != null) #values: values}));
  @override
  MapWrapper $make(CopyWithData data) =>
      MapWrapper(data.get(#values, or: $value.values));

  @override
  MapWrapperCopyWith<$R2, MapWrapper, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MapWrapperCopyWithImpl($value, $cast, t);
}
