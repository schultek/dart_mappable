import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'zoo.mapper.dart';

@MappableClass()
class Zoo<T extends Animal> with ZooMappable<T> {
  List<T> animals;

  Zoo(this.animals);
}

/*

abstract class ZooCopyWith<$R, $In extends Zoo<T>, $Out extends Zoo,
    T extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends Zoo>(
      Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals;
  $R call({List<T>? animals});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo, T extends Animal>
    extends CopyWithBase<$R, Zoo<T>, $Out>
    implements ZooCopyWith<$R, Zoo<T>, $Out, T> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override
  ZooCopyWith<$R2, Zoo<T>, $Out2, T> chain<$R2, $Out2 extends Zoo>(
          Then<Zoo<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ZooCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, AnimalCopyWith<$R, T, T>> get animals => ListCopyWith(
      $value.animals,
      (v, t) => v.copyWith.chain<$R, T>((v) => v as T, t) as AnimalCopyWith<$R, T, T>,
      (v) => call(animals: v));
  @override
  $R call({List<T>? animals}) => $then(Zoo(animals ?? $value.animals));
}

 */