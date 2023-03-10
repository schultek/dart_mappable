import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';
part 'main.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'type')
class Union with _$Union {
  @MappableClass(discriminatorValue: 'data')
  const factory Union.data(@MappableField(key: 'mykey') int value) = Data;
  @MappableClass(discriminatorValue: 'loading')
  const factory Union.loading(int value) = Loading;
  @MappableClass(discriminatorValue: 'error')
  const factory Union.error(int value, [String? message]) = ErrorDetails;
}

void main() {
  var data = Union.data(42);

  var dataJson = data.toJson();
  print(dataJson);
  assert(dataJson == '{"mykey":42,"type":"data"}');

  var parsedData = UnionMapper.fromJson(dataJson);

  print(parsedData);
  assert(parsedData.toString() == 'Union.data(value: 42)');
}
