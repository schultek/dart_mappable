// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'clothes.dart';

class ClothesMapper extends ClassMapperBase<Clothes> {
  ClothesMapper._();

  static ClothesMapper? _instance;
  static ClothesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClothesMapper._());
      PantsMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Clothes';

  static String _$shirt(Clothes v) => v.shirt;
  static const Field<Clothes, String> _f$shirt = Field('shirt', _$shirt);
  static List<Pants> _$pants(Clothes v) => v.pants;
  static const Field<Clothes, List<Pants>> _f$pants = Field('pants', _$pants);

  @override
  final Map<Symbol, Field<Clothes, dynamic>> fields = const {
    #shirt: _f$shirt,
    #pants: _f$pants,
  };

  static Clothes _instantiate(DecodingData data) {
    return Clothes(shirt: data.dec(_f$shirt), pants: data.dec(_f$pants));
  }

  @override
  final Function instantiate = _instantiate;

  static Clothes fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Clothes>(map));
  }

  static Clothes fromJson(String json) {
    return _guard((c) => c.fromJson<Clothes>(json));
  }
}

mixin ClothesMappable {
  String toJson() {
    return ClothesMapper._guard((c) => c.toJson(this as Clothes));
  }

  Map<String, dynamic> toMap() {
    return ClothesMapper._guard((c) => c.toMap(this as Clothes));
  }

  ClothesCopyWith<Clothes, Clothes, Clothes> get copyWith =>
      _ClothesCopyWithImpl(this as Clothes, $identity, $identity);
  @override
  String toString() {
    return ClothesMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ClothesMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ClothesMapper._guard((c) => c.hash(this));
  }
}

extension ClothesValueCopy<$R, $Out extends Clothes>
    on ObjectCopyWith<$R, Clothes, $Out> {
  ClothesCopyWith<$R, Clothes, $Out> get $asClothes =>
      $base.as((v, t, t2) => _ClothesCopyWithImpl(v, t, t2));
}

abstract class ClothesCopyWith<$R, $In extends Clothes, $Out extends Clothes>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Pants, PantsCopyWith<$R, Pants, Pants>> get pants;
  $R call({String? shirt, List<Pants>? pants});
  ClothesCopyWith<$R2, $In, $Out> $chain<$R2>(Then<$Out, $R2> t);
}

class _ClothesCopyWithImpl<$R, $Out extends Clothes>
    extends ClassCopyWithBase<$R, Clothes, $Out>
    implements ClothesCopyWith<$R, Clothes, $Out> {
  _ClothesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Clothes> $mapper =
      ClothesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Pants, PantsCopyWith<$R, Pants, Pants>> get pants =>
      ListCopyWith($value.pants, (v, t) => v.copyWith.$chain<$R>(t),
          (v) => call(pants: v));
  @override
  $R call({String? shirt, List<Pants>? pants}) => $apply(FieldCopyWithData(
      {if (shirt != null) #shirt: shirt, if (pants != null) #pants: pants}));
  @override
  Clothes $make(CopyWithData data) => Clothes(
      shirt: data.get(#shirt, or: $value.shirt),
      pants: data.get(#pants, or: $value.pants));

  @override
  ClothesCopyWith<$R2, Clothes, $Out> $chain<$R2>(Then<$Out, $R2> t) =>
      _ClothesCopyWithImpl($value, $cast, t);
}
