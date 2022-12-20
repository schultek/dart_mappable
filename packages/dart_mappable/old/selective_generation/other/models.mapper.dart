// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'models.dart';

class CarMapper extends MapperBase<Car> {
  static MapperContainer container = MapperContainer(
    mappers: {CarMapper()},
  );

  @override
  CarMapperElement createElement(MapperContainer container) {
    return CarMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Car>;
  static final fromJson = container.fromJson<Car>;
}

class CarMapperElement extends MapperElementBase<Car> {
  CarMapperElement._(super.mapper, super.container);

  @override String stringify(Car self) => 'Car(brand: ${container.asString(self.brand)})';
  @override int hash(Car self) => container.hash(self.brand);
  @override bool equals(Car self, Car other) => container.isEqual(self.brand, other.brand);
}

mixin CarMappable {
  @override String toString() => CarMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CarMapper.container.isEqual(this, other));
  @override int get hashCode => CarMapper.container.hash(this);
}
