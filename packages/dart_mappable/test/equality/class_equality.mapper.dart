// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'class_equality.dart';

class BMapper extends EnumMapper<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
    }
    return _instance!;
  }

  static B fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  B decode(dynamic value) {
    switch (value) {
      case 'a':
        return B.a;
      case 'bB':
        return B.bB;
      case 'ccCc':
        return B.ccCc;
      default:
        return B.values[0];
    }
  }

  @override
  dynamic encode(B self) {
    switch (self) {
      case B.a:
        return 'a';
      case B.bB:
        return 'bB';
      case B.ccCc:
        return 'ccCc';
    }
  }
}

extension BMapperExtension on B {
  String toValue() {
    BMapper.ensureInitialized();
    return MapperContainer.globals.toValue<B>(this) as String;
  }
}

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'A';

  static String _$a(A v) => v.a;
  static const Field<A, String> _f$a = Field('a', _$a);
  static int _$b(A v) => v.b;
  static const Field<A, int> _f$b = Field('b', _$b, opt: true, def: 0);
  static double? _$c(A v) => v.c;
  static const Field<A, double> _f$c = Field('c', _$c, opt: true);
  static bool _$d(A v) => v.d;
  static const Field<A, bool> _f$d = Field('d', _$d);
  static B? _$e(A v) => v.e;
  static const Field<A, B> _f$e = Field('e', _$e, opt: true);

  @override
  final MappableFields<A> fields = const {
    #a: _f$a,
    #b: _f$b,
    #c: _f$c,
    #d: _f$d,
    #e: _f$e,
  };

  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$a),
        b: data.dec(_f$b),
        c: data.dec(_f$c),
        d: data.dec(_f$d),
        e: data.dec(_f$e));
  }

  @override
  final Function instantiate = _instantiate;

  static A fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A>(map);
  }

  static A fromJson(String json) {
    return ensureInitialized().decodeJson<A>(json);
  }
}

mixin AMappable {
  String toJson() {
    return AMapper.ensureInitialized().encodeJson<A>(this as A);
  }

  Map<String, dynamic> toMap() {
    return AMapper.ensureInitialized().encodeMap<A>(this as A);
  }

  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() {
    return AMapper.ensureInitialized().stringifyValue(this as A);
  }

  @override
  bool operator ==(Object other) {
    return AMapper.ensureInitialized().equalsValue(this as A, other);
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A);
  }
}

extension AValueCopy<$R, $Out> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? a, int? b, double? c, bool? d, B? e});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call({String? a, int? b, Object? c = $none, bool? d, Object? e = $none}) =>
      $apply(FieldCopyWithData({
        if (a != null) #a: a,
        if (b != null) #b: b,
        if (c != $none) #c: c,
        if (d != null) #d: d,
        if (e != $none) #e: e
      }));
  @override
  A $make(CopyWithData data) => A(data.get(#a, or: $value.a),
      b: data.get(#b, or: $value.b),
      c: data.get(#c, or: $value.c),
      d: data.get(#d, or: $value.d),
      e: data.get(#e, or: $value.e));

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class BaseMapper extends ClassMapperBase<Base> {
  BaseMapper._();

  static BaseMapper? _instance;
  static BaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseMapper._());
      SubMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Base';

  static String _$data(Base v) => v.data;
  static const Field<Base, String> _f$data = Field('data', _$data);

  @override
  final MappableFields<Base> fields = const {
    #data: _f$data,
  };

  static Base _instantiate(DecodingData data) {
    return Base(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static Base fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Base>(map);
  }

  static Base fromJson(String json) {
    return ensureInitialized().decodeJson<Base>(json);
  }
}

mixin BaseMappable {
  String toJson() {
    return BaseMapper.ensureInitialized().encodeJson<Base>(this as Base);
  }

  Map<String, dynamic> toMap() {
    return BaseMapper.ensureInitialized().encodeMap<Base>(this as Base);
  }

  BaseCopyWith<Base, Base, Base> get copyWith =>
      _BaseCopyWithImpl(this as Base, $identity, $identity);
  @override
  String toString() {
    return BaseMapper.ensureInitialized().stringifyValue(this as Base);
  }

  @override
  bool operator ==(Object other) {
    return BaseMapper.ensureInitialized().equalsValue(this as Base, other);
  }

  @override
  int get hashCode {
    return BaseMapper.ensureInitialized().hashValue(this as Base);
  }
}

extension BaseValueCopy<$R, $Out> on ObjectCopyWith<$R, Base, $Out> {
  BaseCopyWith<$R, Base, $Out> get $asBase =>
      $base.as((v, t, t2) => _BaseCopyWithImpl(v, t, t2));
}

abstract class BaseCopyWith<$R, $In extends Base, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  BaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Base, $Out>
    implements BaseCopyWith<$R, Base, $Out> {
  _BaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Base> $mapper = BaseMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Base $make(CopyWithData data) => Base(data.get(#data, or: $value.data));

  @override
  BaseCopyWith<$R2, Base, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BaseCopyWithImpl($value, $cast, t);
}

class SubMapper extends ClassMapperBase<Sub> {
  SubMapper._();

  static SubMapper? _instance;
  static SubMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubMapper._());
      BaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Sub';

  static String _$data(Sub v) => v.data;
  static const Field<Sub, String> _f$data = Field('data', _$data);

  @override
  final MappableFields<Sub> fields = const {
    #data: _f$data,
  };

  static Sub _instantiate(DecodingData data) {
    return Sub(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static Sub fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Sub>(map);
  }

  static Sub fromJson(String json) {
    return ensureInitialized().decodeJson<Sub>(json);
  }
}

mixin SubMappable {
  String toJson() {
    return SubMapper.ensureInitialized().encodeJson<Sub>(this as Sub);
  }

  Map<String, dynamic> toMap() {
    return SubMapper.ensureInitialized().encodeMap<Sub>(this as Sub);
  }

  SubCopyWith<Sub, Sub, Sub> get copyWith =>
      _SubCopyWithImpl(this as Sub, $identity, $identity);
  @override
  String toString() {
    return SubMapper.ensureInitialized().stringifyValue(this as Sub);
  }

  @override
  bool operator ==(Object other) {
    return SubMapper.ensureInitialized().equalsValue(this as Sub, other);
  }

  @override
  int get hashCode {
    return SubMapper.ensureInitialized().hashValue(this as Sub);
  }
}

extension SubValueCopy<$R, $Out> on ObjectCopyWith<$R, Sub, $Out> {
  SubCopyWith<$R, Sub, $Out> get $asSub =>
      $base.as((v, t, t2) => _SubCopyWithImpl(v, t, t2));
}

abstract class SubCopyWith<$R, $In extends Sub, $Out>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? data});
  SubCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Sub, $Out>
    implements SubCopyWith<$R, Sub, $Out> {
  _SubCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Sub> $mapper = SubMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Sub $make(CopyWithData data) => Sub(data.get(#data, or: $value.data));

  @override
  SubCopyWith<$R2, Sub, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SubCopyWithImpl($value, $cast, t);
}

class BaseTypeMapper extends ClassMapperBase<BaseType> {
  BaseTypeMapper._();

  static BaseTypeMapper? _instance;
  static BaseTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseTypeMapper._());
      SubTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BaseType';

  static String _$type(BaseType v) => v.type;
  static const Field<BaseType, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<BaseType> fields = const {
    #type: _f$type,
  };

  static BaseType _instantiate(DecodingData data) {
    return BaseType(data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseType fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseType>(map);
  }

  static BaseType fromJson(String json) {
    return ensureInitialized().decodeJson<BaseType>(json);
  }
}

mixin BaseTypeMappable {
  String toJson() {
    return BaseTypeMapper.ensureInitialized()
        .encodeJson<BaseType>(this as BaseType);
  }

  Map<String, dynamic> toMap() {
    return BaseTypeMapper.ensureInitialized()
        .encodeMap<BaseType>(this as BaseType);
  }

  BaseTypeCopyWith<BaseType, BaseType, BaseType> get copyWith =>
      _BaseTypeCopyWithImpl(this as BaseType, $identity, $identity);
  @override
  String toString() {
    return BaseTypeMapper.ensureInitialized().stringifyValue(this as BaseType);
  }

  @override
  bool operator ==(Object other) {
    return BaseTypeMapper.ensureInitialized()
        .equalsValue(this as BaseType, other);
  }

  @override
  int get hashCode {
    return BaseTypeMapper.ensureInitialized().hashValue(this as BaseType);
  }
}

extension BaseTypeValueCopy<$R, $Out> on ObjectCopyWith<$R, BaseType, $Out> {
  BaseTypeCopyWith<$R, BaseType, $Out> get $asBaseType =>
      $base.as((v, t, t2) => _BaseTypeCopyWithImpl(v, t, t2));
}

abstract class BaseTypeCopyWith<$R, $In extends BaseType, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  BaseTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseTypeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BaseType, $Out>
    implements BaseTypeCopyWith<$R, BaseType, $Out> {
  _BaseTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseType> $mapper =
      BaseTypeMapper.ensureInitialized();
  @override
  $R call({String? type}) =>
      $apply(FieldCopyWithData({if (type != null) #type: type}));
  @override
  BaseType $make(CopyWithData data) =>
      BaseType(data.get(#type, or: $value.type));

  @override
  BaseTypeCopyWith<$R2, BaseType, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BaseTypeCopyWithImpl($value, $cast, t);
}

class SubTypeMapper extends SubClassMapperBase<SubType> {
  SubTypeMapper._();

  static SubTypeMapper? _instance;
  static SubTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubTypeMapper._());
      BaseTypeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubType';

  static String _$type(SubType v) => v.type;
  static const Field<SubType, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<SubType> fields = const {
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubType';
  @override
  late final ClassMapperBase superMapper = BaseTypeMapper.ensureInitialized();

  static SubType _instantiate(DecodingData data) {
    return SubType(data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static SubType fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubType>(map);
  }

  static SubType fromJson(String json) {
    return ensureInitialized().decodeJson<SubType>(json);
  }
}

mixin SubTypeMappable {
  String toJson() {
    return SubTypeMapper.ensureInitialized()
        .encodeJson<SubType>(this as SubType);
  }

  Map<String, dynamic> toMap() {
    return SubTypeMapper.ensureInitialized()
        .encodeMap<SubType>(this as SubType);
  }

  SubTypeCopyWith<SubType, SubType, SubType> get copyWith =>
      _SubTypeCopyWithImpl(this as SubType, $identity, $identity);
  @override
  String toString() {
    return SubTypeMapper.ensureInitialized().stringifyValue(this as SubType);
  }

  @override
  bool operator ==(Object other) {
    return SubTypeMapper.ensureInitialized()
        .equalsValue(this as SubType, other);
  }

  @override
  int get hashCode {
    return SubTypeMapper.ensureInitialized().hashValue(this as SubType);
  }
}

extension SubTypeValueCopy<$R, $Out> on ObjectCopyWith<$R, SubType, $Out> {
  SubTypeCopyWith<$R, SubType, $Out> get $asSubType =>
      $base.as((v, t, t2) => _SubTypeCopyWithImpl(v, t, t2));
}

abstract class SubTypeCopyWith<$R, $In extends SubType, $Out>
    implements BaseTypeCopyWith<$R, $In, $Out> {
  @override
  $R call({String? type});
  SubTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubTypeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubType, $Out>
    implements SubTypeCopyWith<$R, SubType, $Out> {
  _SubTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubType> $mapper =
      SubTypeMapper.ensureInitialized();
  @override
  $R call({String? type}) =>
      $apply(FieldCopyWithData({if (type != null) #type: type}));
  @override
  SubType $make(CopyWithData data) => SubType(data.get(#type, or: $value.type));

  @override
  SubTypeCopyWith<$R2, SubType, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SubTypeCopyWithImpl($value, $cast, t);
}

class GenericMapper extends ClassMapperBase<Generic> {
  GenericMapper._();

  static GenericMapper? _instance;
  static GenericMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenericMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Generic';
  @override
  Function get typeFactory => <T>(f) => f<Generic<T>>();

  static dynamic _$data(Generic v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Generic, dynamic> _f$data =
      Field('data', _$data, arg: _arg$data);

  @override
  final MappableFields<Generic> fields = const {
    #data: _f$data,
  };

  static Generic<T> _instantiate<T>(DecodingData data) {
    return Generic(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static Generic<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Generic<T>>(map);
  }

  static Generic<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Generic<T>>(json);
  }
}

mixin GenericMappable<T> {
  String toJson() {
    return GenericMapper.ensureInitialized()
        .encodeJson<Generic<T>>(this as Generic<T>);
  }

  Map<String, dynamic> toMap() {
    return GenericMapper.ensureInitialized()
        .encodeMap<Generic<T>>(this as Generic<T>);
  }

  GenericCopyWith<Generic<T>, Generic<T>, Generic<T>, T> get copyWith =>
      _GenericCopyWithImpl(this as Generic<T>, $identity, $identity);
  @override
  String toString() {
    return GenericMapper.ensureInitialized().stringifyValue(this as Generic<T>);
  }

  @override
  bool operator ==(Object other) {
    return GenericMapper.ensureInitialized()
        .equalsValue(this as Generic<T>, other);
  }

  @override
  int get hashCode {
    return GenericMapper.ensureInitialized().hashValue(this as Generic<T>);
  }
}

extension GenericValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Generic<T>, $Out> {
  GenericCopyWith<$R, Generic<T>, $Out, T> get $asGeneric =>
      $base.as((v, t, t2) => _GenericCopyWithImpl(v, t, t2));
}

abstract class GenericCopyWith<$R, $In extends Generic<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? data});
  GenericCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GenericCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Generic<T>, $Out>
    implements GenericCopyWith<$R, Generic<T>, $Out, T> {
  _GenericCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Generic> $mapper =
      GenericMapper.ensureInitialized();
  @override
  $R call({T? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  Generic<T> $make(CopyWithData data) =>
      Generic(data.get(#data, or: $value.data));

  @override
  GenericCopyWith<$R2, Generic<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GenericCopyWithImpl($value, $cast, t);
}

class WrapperMapper extends ClassMapperBase<Wrapper> {
  WrapperMapper._();

  static WrapperMapper? _instance;
  static WrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WrapperMapper._());
      GenericMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Wrapper';
  @override
  Function get typeFactory => <T>(f) => f<Wrapper<T>>();

  static Generic<dynamic> _$value(Wrapper v) => v.value;
  static dynamic _arg$value<T>(f) => f<Generic<T>>();
  static const Field<Wrapper, Generic<dynamic>> _f$value =
      Field('value', _$value, arg: _arg$value);

  @override
  final MappableFields<Wrapper> fields = const {
    #value: _f$value,
  };

  static Wrapper<T> _instantiate<T>(DecodingData data) {
    return Wrapper(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Wrapper<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Wrapper<T>>(map);
  }

  static Wrapper<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Wrapper<T>>(json);
  }
}

mixin WrapperMappable<T> {
  String toJson() {
    return WrapperMapper.ensureInitialized()
        .encodeJson<Wrapper<T>>(this as Wrapper<T>);
  }

  Map<String, dynamic> toMap() {
    return WrapperMapper.ensureInitialized()
        .encodeMap<Wrapper<T>>(this as Wrapper<T>);
  }

  WrapperCopyWith<Wrapper<T>, Wrapper<T>, Wrapper<T>, T> get copyWith =>
      _WrapperCopyWithImpl(this as Wrapper<T>, $identity, $identity);
  @override
  String toString() {
    return WrapperMapper.ensureInitialized().stringifyValue(this as Wrapper<T>);
  }

  @override
  bool operator ==(Object other) {
    return WrapperMapper.ensureInitialized()
        .equalsValue(this as Wrapper<T>, other);
  }

  @override
  int get hashCode {
    return WrapperMapper.ensureInitialized().hashValue(this as Wrapper<T>);
  }
}

extension WrapperValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Wrapper<T>, $Out> {
  WrapperCopyWith<$R, Wrapper<T>, $Out, T> get $asWrapper =>
      $base.as((v, t, t2) => _WrapperCopyWithImpl(v, t, t2));
}

abstract class WrapperCopyWith<$R, $In extends Wrapper<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  GenericCopyWith<$R, Generic<T>, Generic<T>, T> get value;
  $R call({Generic<T>? value});
  WrapperCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WrapperCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Wrapper<T>, $Out>
    implements WrapperCopyWith<$R, Wrapper<T>, $Out, T> {
  _WrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Wrapper> $mapper =
      WrapperMapper.ensureInitialized();
  @override
  GenericCopyWith<$R, Generic<T>, Generic<T>, T> get value =>
      $value.value.copyWith.$chain((v) => call(value: v));
  @override
  $R call({Generic<T>? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  Wrapper<T> $make(CopyWithData data) =>
      Wrapper(data.get(#value, or: $value.value));

  @override
  WrapperCopyWith<$R2, Wrapper<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WrapperCopyWithImpl($value, $cast, t);
}
