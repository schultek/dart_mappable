// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'food.dart';

class AppleMapper extends MapperBase<Apple> {
  static MapperContainer container = MapperContainer(
    mappers: {AppleMapper()},
  );

  @override
  AppleMapperElement createElement(MapperContainer container) {
    return AppleMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Apple>;
  static final fromJson = container.fromJson<Apple>;
}

class AppleMapperElement extends MapperElementBase<Apple> {
  AppleMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Apple decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Apple fromMap(Map<String, dynamic> map) => Apple(container.$get(map, 'isRed'));

  @override Function get encoder => encode;
  dynamic encode(Apple v) => toMap(v);
  Map<String, dynamic> toMap(Apple a) => {'isRed': container.$enc(a.isRed, 'isRed')};

  @override String stringify(Apple self) => 'Apple(isRed: ${container.asString(self.isRed)})';
  @override int hash(Apple self) => container.hash(self.isRed);
  @override bool equals(Apple self, Apple other) => container.isEqual(self.isRed, other.isRed);
}

mixin AppleMappable {
  String toJson() => AppleMapper.container.toJson(this as Apple);
  Map<String, dynamic> toMap() => AppleMapper.container.toMap(this as Apple);
  AppleCopyWith<Apple, Apple, Apple> get copyWith => _AppleCopyWithImpl(this as Apple, $identity, $identity);
  @override String toString() => AppleMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && AppleMapper.container.isEqual(this, other));
  @override int get hashCode => AppleMapper.container.hash(this);
}

extension AppleValueCopy<$R, $Out extends Apple> on ObjectCopyWith<$R, Apple, $Out> {
  AppleCopyWith<$R, Apple, $Out> get asApple => base.as((v, t, t2) => _AppleCopyWithImpl(v, t, t2));
}

typedef AppleCopyWithBound = Apple;
abstract class AppleCopyWith<$R, $In extends Apple, $Out extends Apple> implements ObjectCopyWith<$R, $In, $Out> {
  AppleCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Apple>(Then<Apple, $Out2> t, Then<$Out2, $R2> t2);
  $R call({bool? isRed});
}

class _AppleCopyWithImpl<$R, $Out extends Apple> extends CopyWithBase<$R, Apple, $Out> implements AppleCopyWith<$R, Apple, $Out> {
  _AppleCopyWithImpl(super.value, super.then, super.then2);
  @override AppleCopyWith<$R2, Apple, $Out2> chain<$R2, $Out2 extends Apple>(Then<Apple, $Out2> t, Then<$Out2, $R2> t2) => _AppleCopyWithImpl($value, t, t2);

  @override $R call({bool? isRed}) => $then(Apple(isRed ?? $value.isRed));
}
