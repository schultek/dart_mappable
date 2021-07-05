import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.mapper.g.dart';

part 'main.freezed.dart';

@freezed
@MappableClass(discriminatorKey: 'type')
class Union with _$Union {
  @MappableClass(discriminatorValue: 'data')
  const factory Union.data(@MappableField(key: 'mykey') int value) = Data;
  @MappableClass(discriminatorValue: 'loading')
  const factory Union.loading() = Loading;
  @MappableClass(discriminatorValue: 'error')
  const factory Union.error([String? message]) = ErrorDetails;
}

void main() {
  var data = Union.data(42);

  var dataJson = data.toJson();
  print(dataJson); // {"mykey":42,"type":"data"}

  var parsedData = Mapper.fromJson<Union>(dataJson);
  print(parsedData); // Union.data(value: 42)
}
