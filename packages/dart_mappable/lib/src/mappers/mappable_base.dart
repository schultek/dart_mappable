import '../../dart_mappable.dart';

mixin MappableBase<T> {
  String toJson();

  Map<String, dynamic> toMap();

  @override
  String toString();

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;

  ClassCopyWith<T, T, T> get copyWith;
}
