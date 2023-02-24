// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic.dart';

class PersonCMapper extends ClassMapperBase<PersonC> {
  PersonCMapper._();
  static PersonCMapper? _instance;
  static PersonCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonCMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PersonC';

  static String _$name(PersonC v) => v.name;

  @override
  final Map<Symbol, Field<PersonC, dynamic>> fields = const {
    #name: Field<PersonC, String>('name', _$name),
  };

  static PersonC _instantiate(DecodingData data) {
    return PersonC(name: data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static PersonC fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PersonC>(map));
  }

  static PersonC fromJson(String json) {
    return _guard((c) => c.fromJson<PersonC>(json));
  }
}

mixin PersonCMappable {
  String toJson() {
    return PersonCMapper._guard((c) => c.toJson(this as PersonC));
  }

  Map<String, dynamic> toMap() {
    return PersonCMapper._guard((c) => c.toMap(this as PersonC));
  }

  PersonCCopyWith<PersonC, PersonC, PersonC> get copyWith =>
      _PersonCCopyWithImpl(this as PersonC, $identity, $identity);
  @override
  String toString() {
    return PersonCMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonCMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PersonCMapper._guard((c) => c.hash(this));
  }
}

extension PersonCValueCopy<$R, $Out extends PersonC>
    on ObjectCopyWith<$R, PersonC, $Out> {
  PersonCCopyWith<$R, PersonC, $Out> get asPersonC =>
      base.as((v, t, t2) => _PersonCCopyWithImpl(v, t, t2));
}

typedef PersonCCopyWithBound = PersonC;

abstract class PersonCCopyWith<$R, $In extends PersonC, $Out extends PersonC>
    implements ObjectCopyWith<$R, $In, $Out> {
  PersonCCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PersonC>(
      Then<PersonC, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonCCopyWithImpl<$R, $Out extends PersonC>
    extends CopyWithBase<$R, PersonC, $Out>
    implements PersonCCopyWith<$R, PersonC, $Out> {
  _PersonCCopyWithImpl(super.value, super.then, super.then2);
  @override
  PersonCCopyWith<$R2, PersonC, $Out2> chain<$R2, $Out2 extends PersonC>(
          Then<PersonC, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(PersonC(name: name ?? $value.name));
}
