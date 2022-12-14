// ignore_for_file: unused_element
part of 'package:v2_test/models/person.dart';
// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<p0.Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  p0.Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Person fromMap(Map<String, dynamic> map) => p0.Person(Mapper.i.$get(map, 'name'));

  @override Function get encoder => encode;
  dynamic encode(p0.Person v) => toMap(v);
  Map<String, dynamic> toMap(p0.Person p) => {'name': Mapper.i.$enc(p.name, 'name')};

  @override String stringify(p0.Person self) => 'Person(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.Person self) => Mapper.hash(self.name);
  @override bool equals(p0.Person self, p0.Person other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.Person>();
}

mixin PersonMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Person);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Person);
  PersonCopyWith<p0.Person> get copyWith => _PersonCopyWithImpl(this as p0.Person, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension PersonObjectCopy<$R> on ObjectCopyWith<$R, p0.Person, p0.Person> {
  PersonCopyWith<$R> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R> implements ObjectCopyWith<$R, p0.Person, p0.Person> {
  PersonCopyWith<$R2> _chain<$R2>(Then<p0.Person, p0.Person> t, Then<p0.Person, $R2> t2);
  $R call({String? name});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Person, p0.Person> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2> _chain<$R2>(Then<p0.Person, p0.Person> t, Then<p0.Person, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(p0.Person(name ?? $value.name));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
