// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'pants.dart';

class PantsMapper extends ClassMapperBase<Pants> {
  PantsMapper._();

  static PantsMapper? _instance;
  static PantsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PantsMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Pants';

  static String _$material(Pants v) => v.material;
  static const Field<Pants, String> _f$material = Field('material', _$material);

  @override
  final Map<Symbol, Field<Pants, dynamic>> fields = const {
    #material: _f$material,
  };

  static Pants _instantiate(DecodingData data) {
    return Pants(material: data.dec(_f$material));
  }

  @override
  final Function instantiate = _instantiate;

  static Pants fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Pants>(map));
  }

  static Pants fromJson(String json) {
    return _guard((c) => c.fromJson<Pants>(json));
  }
}

mixin PantsMappable {
  String toJson() {
    return PantsMapper._guard((c) => c.toJson(this as Pants));
  }

  Map<String, dynamic> toMap() {
    return PantsMapper._guard((c) => c.toMap(this as Pants));
  }

  PantsCopyWith<Pants, Pants, Pants> get copyWith =>
      _PantsCopyWithImpl(this as Pants, $identity, $identity);
  @override
  String toString() {
    return PantsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PantsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PantsMapper._guard((c) => c.hash(this));
  }
}

extension PantsValueCopy<$R, $Out extends Pants>
    on ObjectCopyWith<$R, Pants, $Out> {
  PantsCopyWith<$R, Pants, $Out> get $asPants =>
      $base.as((v, t, t2) => _PantsCopyWithImpl(v, t, t2));
}

abstract class PantsCopyWith<$R, $In extends Pants, $Out extends Pants>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? material});
  PantsCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _PantsCopyWithImpl<$R, $Out extends Pants>
    extends ClassCopyWithBase<$R, Pants, $Out>
    implements PantsCopyWith<$R, Pants, $Out> {
  _PantsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Pants> $mapper = PantsMapper.ensureInitialized();
  @override
  $R call({String? material}) =>
      $apply(FieldCopyWithData({if (material != null) #material: material}));
  @override
  Pants $make(CopyWithData data) =>
      Pants(material: data.get(#material, or: $value.material));

  @override
  PantsCopyWith<$R2, Pants, $Out> $chain<$R2>(Then<$Out, $R2> t) =>
      _PantsCopyWithImpl($value, $cast, t);
}
