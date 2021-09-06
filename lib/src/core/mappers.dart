import 'package:collection/collection.dart';

export 'package:collection/collection.dart'
    show Equality, IterableEquality, MapEquality;

/// This class needs to be implemented by all mappers
abstract class BaseMapper<T> {
  const BaseMapper();

  Function? get decoder => null;
  Function? get encoder => null;

  Function? get typeFactory => (f) => f<T>();

  bool? equals(T self, T other) => null;
  int? hash(T self) => null;
  String? stringify(T self) => null;

  Type get type => T;
  bool isFor(dynamic v) => v is T;
}

/// Simple wrapper around the [BaseMapper] class that provides direct abstract function declarations
abstract class SimpleMapper<T> extends BaseMapper<T> {
  const SimpleMapper();

  @override
  Function get encoder => encode;
  dynamic encode(T self);

  @override
  Function get decoder => decode;
  T decode(dynamic value);
}

mixin MapperEqualityMixin<T> implements BaseMapper<T> {
  Equality get equality;

  @override
  bool? equals(T self, T other) => equality.equals(self, other);
  @override
  int? hash(T self) => equality.hash(self);
}

class MapperException implements Exception {
  final String message;
  const MapperException(this.message);

  @override
  String toString() => 'MapperException: $message';
}

class TypeInfo {
  String type = '';
  List<TypeInfo> params = [];
  bool isNullable = false;
  TypeInfo? parent;

  @override
  String toString() =>
      '$type${params.isNotEmpty ? '<${params.join(', ')}>${isNullable ? '?' : ''}' : ''}';

  static TypeInfo fromValue(dynamic value) {
    var info = fromType(value.runtimeType.toString());
    if (value is List) {
      return info..type = 'List';
    } else if (value is Set) {
      return info..type = 'Set';
    } else if (value is Map) {
      return info..type = 'Map';
    } else {
      return info;
    }
  }

  static TypeInfo fromType<T>([String? type]) {
    var typeString = type ?? T.toString();
    var curr = TypeInfo();

    for (var i = 0; i < typeString.length; i++) {
      var c = typeString[i];
      if (c == '<') {
        var t = TypeInfo();
        curr.params.add(t..parent = curr);
        curr = t;
      } else if (c == '>') {
        curr = curr.parent!;
      } else if (c == ' ') {
        continue;
      } else if (c == ',') {
        var t = TypeInfo();
        curr = curr.parent!;
        curr.params.add(t..parent = curr);
        curr = t;
      } else if (c == '?') {
        curr.isNullable = true;
      } else {
        curr.type += c;
      }
    }

    return curr;
  }
}
