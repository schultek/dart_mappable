import '../protocol/common.dart';
import 'json.dart';
import 'lazy.dart';

extension UtilEncodable on Encodable {
  Map<String, dynamic> toMap() {
    return StructEncoding.encode(this, encoder()) as Map<String, dynamic>;
  }

  Map<String, dynamic> toLazyMap() {
    return LazyEncoding.encode(this, encoder()) as Map<String, dynamic>;
  }

  String toJson() {
    return JsonEncoding.encode(this, encoder());
  }

  List<int> toJsonBytes() {
    return JsonEncoding.encodeBytes(this, encoder());
  }
}

extension UtilEncodable1<T extends Encodable<T>, A> on Encodable1<T, A> {
  Map<String, dynamic> toMap([Encoder<A>? e1]) {
    return StructEncoding.encode(this, encoder(e1)) as Map<String, dynamic>;
  }

  Map<String, dynamic> toLazyMap([Encoder<A>? e1]) {
    return LazyEncoding.encode(this, encoder(e1)) as Map<String, dynamic>;
  }

  String toJson([Encoder<A>? e1]) {
    return JsonEncoding.encode(this, encoder(e1));
  }

  List<int> toJsonBytes([Encoder<A>? e1]) {
    return JsonEncoding.encodeBytes(this, encoder(e1));
  }
}
