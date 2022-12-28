import 'package:dart_mappable/dart_mappable.dart';

class CardPlayerHooks extends MappingHooks {
  const CardPlayerHooks();

  @override
  beforeDecode(value) {
    return value is Map<String, dynamic>
        ? {'id': value['id'] + '-card'}
        : value;
  }
}
