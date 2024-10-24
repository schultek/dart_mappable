import 'dart:convert';

abstract interface class RawEncodable {
  Map<String, dynamic> toMapRaw();
}

extension JsonEncodableRaw on RawEncodable {
  String toJsonRaw() {
    return jsonEncode(toMapRaw());
  }
}
