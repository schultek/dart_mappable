import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'unknown_interface.mapper.dart';

abstract class BaseToken {
  String get token;
}

class BaseTokenParser<T> {
  final Map<BaseToken, T> data;
  final T fallback;

  const BaseTokenParser({required this.data, required this.fallback});
}

@MappableClass()
class DSOpacityData extends BaseTokenParser<double> with DSOpacityDataMappable {
  const DSOpacityData({
    super.data = const {HOpacity.bzOpacityIntense: 0.4},
    super.fallback = 0.0,
  });
}

@MappableEnum()
enum HOpacity implements BaseToken {
  bzOpacityIntense(token: 'bz-opacity-intense');

  @override
  final String token;

  const HOpacity({required this.token});
}

void main() {
  HOpacityMapper.ensureInitialized();

  group('unknown interface', () {
    test('finds mapper for unknown interface', () {
      final data = const DSOpacityData().toJson();
      expect(data, equals('{"data":{"bzOpacityIntense":0.4},"fallback":0.0}'));
    });
  });
}
