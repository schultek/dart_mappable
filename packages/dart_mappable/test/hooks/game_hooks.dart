import 'package:dart_mappable/dart_mappable.dart';

class GameHook extends MappingHook {
  const GameHook();
}

class CardPlayerHook extends MappingHook {
  const CardPlayerHook();

  @override
  beforeDecode(value) {
    return value is Map<String, dynamic>
        ? {'id': value['id'] + '-card'}
        : value;
  }
}
