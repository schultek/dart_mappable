import 'dart:convert';

abstract interface class RawEncodable {
  Map<String, dynamic> toMapRaw();
}

final jsonBytes = json.fuse(utf8);

extension JsonEncodableRaw on RawEncodable {
  String toJsonRaw() {
    return jsonEncode(toMapRaw());
  }

  List<int> toJsonBytesRaw() {
    return jsonBytes.encode(toMapRaw());
  }
}
