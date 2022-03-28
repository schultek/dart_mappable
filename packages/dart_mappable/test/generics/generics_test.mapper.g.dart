import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'generics_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  BoxMapper._(),
  ConfettiMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class BoxMapper extends BaseMapper<Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  Box<T> decode<T extends Object>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T extends Object>(Map<String, dynamic> map) => Box(Mapper.i.$get(map, 'size'), contents: Mapper.i.$get(map, 'contents'));

  @override Function get encoder => (Box v) => encode(v);
  dynamic encode(Box v) => toMap(v);
  Map<String, dynamic> toMap(Box b) => {'size': Mapper.i.$enc(b.size, 'size'), 'contents': Mapper.i.$enc(b.contents, 'contents')};

  @override String stringify(Box self) => 'Box(size: ${Mapper.asString(self.size)}, contents: ${Mapper.asString(self.contents)})';
  @override int hash(Box self) => Mapper.hash(self.size) ^ Mapper.hash(self.contents);
  @override bool equals(Box self, Box other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.contents, other.contents);

  @override Function get typeFactory => <T extends Object>(f) => f<Box<T>>();
}

extension BoxMapperExtension <T extends Object> on Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BoxCopyWith<Box<T>, T> get copyWith => BoxCopyWith(this, $identity);
}

abstract class BoxCopyWith<$R, T extends Object> {
  factory BoxCopyWith(Box<T> value, Then<Box<T>, $R> then) = _BoxCopyWithImpl<$R, T>;
  $R call({int? size, List<T>? contents});
  $R apply(Box<T> Function(Box<T>) transform);
}

class _BoxCopyWithImpl<$R, T extends Object> extends BaseCopyWith<Box<T>, $R> implements BoxCopyWith<$R, T> {
  _BoxCopyWithImpl(Box<T> value, Then<Box<T>, $R> then) : super(value, then);

  @override $R call({int? size, List<T>? contents}) => $then(Box(size ?? $value.size, contents: contents ?? $value.contents));
}

class ConfettiMapper extends BaseMapper<Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  Confetti decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) => Confetti(Mapper.i.$get(map, 'color'));

  @override Function get encoder => (Confetti v) => encode(v);
  dynamic encode(Confetti v) => toMap(v);
  Map<String, dynamic> toMap(Confetti c) => {'color': Mapper.i.$enc(c.color, 'color')};

  @override String stringify(Confetti self) => 'Confetti(color: ${Mapper.asString(self.color)})';
  @override int hash(Confetti self) => Mapper.hash(self.color);
  @override bool equals(Confetti self, Confetti other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<Confetti>();
}

extension ConfettiMapperExtension  on Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ConfettiCopyWith<Confetti> get copyWith => ConfettiCopyWith(this, $identity);
}

abstract class ConfettiCopyWith<$R> {
  factory ConfettiCopyWith(Confetti value, Then<Confetti, $R> then) = _ConfettiCopyWithImpl<$R>;
  $R call({String? color});
  $R apply(Confetti Function(Confetti) transform);
}

class _ConfettiCopyWithImpl<$R> extends BaseCopyWith<Confetti, $R> implements ConfettiCopyWith<$R> {
  _ConfettiCopyWithImpl(Confetti value, Then<Confetti, $R> then) : super(value, then);

  @override $R call({String? color}) => $then(Confetti(color ?? $value.color));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static late MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupported()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
