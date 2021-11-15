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
