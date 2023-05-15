import 'interface_mapper.dart';
import 'mapper_mixins.dart';

typedef _R1<A> = (A,);
typedef _R2<A, B> = (A, B);
typedef _R3<A, B, C> = (A, B, C);
typedef _R4<A, B, C, D> = (A, B, C, D);
typedef _R5<A, B, C, D, E> = (A, B, C, D, E);

abstract class RecordMapperBase<T extends Record> extends InterfaceMapperBase<T>
    with PrimitiveMethodsMixin<T> {
  static final List<RecordMapperBase> defaults = List.unmodifiable([
    // one positioned parameter
    _R1Mapper(),
    // two positioned parameters
    _R2Mapper(),
    // three positioned parameters
    _R3Mapper(),
  ]);
}

class _R1Mapper extends RecordMapperBase<_R1> {
  static dynamic _$1(_R1 v) => v.$1;
  static const Field<_R1, dynamic> _f$1 = Field('1', _$1);

  @override
  final Map<Symbol, Field<_R1, dynamic>> fields = const {
    #$1: _f$1,
  };

  static _R1<A> _instantiate<A>(DecodingData data) {
    return (data.dec(_f$1));
  }

  @override
  final Function instantiate = _instantiate;

  @override
  Function get typeFactory => <A>(f) => f<_R1<A>>();
}

class _R2Mapper extends RecordMapperBase<_R2> {
  static dynamic _$1(_R2 v) => v.$1;
  static const Field<_R2, dynamic> _f$1 = Field('1', _$1);
  static dynamic _$2(_R2 v) => v.$2;
  static const Field<_R2, dynamic> _f$2 = Field('2', _$2);

  @override
  final Map<Symbol, Field<_R2, dynamic>> fields = const {#$1: _f$1, #$2: _f$2};

  static _R2<A, B> _instantiate<A, B>(DecodingData data) {
    return (data.dec(_f$1), data.dec(_f$2));
  }

  @override
  final Function instantiate = _instantiate;

  @override
  Function get typeFactory => <A, B>(f) => f<_R2<A, B>>();
}

class _R3Mapper extends RecordMapperBase<_R3> {
  static dynamic _$1(_R3 v) => v.$1;
  static const Field<_R3, dynamic> _f$1 = Field('1', _$1);
  static dynamic _$2(_R3 v) => v.$2;
  static const Field<_R3, dynamic> _f$2 = Field('2', _$2);
  static dynamic _$3(_R3 v) => v.$3;
  static const Field<_R3, dynamic> _f$3 = Field('3', _$3);

  @override
  final Map<Symbol, Field<_R3, dynamic>> fields = const {
    #$1: _f$1,
    #$2: _f$2,
    #$3: _f$3,
  };

  static _R3<A, B, C> _instantiate<A, B, C>(DecodingData data) {
    return (data.dec(_f$1), data.dec(_f$2), data.dec(_f$3));
  }

  @override
  final Function instantiate = _instantiate;

  @override
  Function get typeFactory => <A, B, C>(f) => f<_R3<A, B, C>>();
}
