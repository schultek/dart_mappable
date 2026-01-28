// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'function_fields_test.dart';

class ExampleMapper extends ClassMapperBase<Example> {
  ExampleMapper._();

  static ExampleMapper? _instance;
  static ExampleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExampleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Example';

  static Function? _$functionField(Example v) =>
      (v as dynamic).functionField as Function?;
  static dynamic _arg$functionField(f) => f<int Function(int)>();
  static const Field<Example, Function?> _f$functionField = Field(
    'functionField',
    _$functionField,
    arg: _arg$functionField,
  );

  @override
  final MappableFields<Example> fields = const {
    #functionField: _f$functionField,
  };

  static Example _instantiate(DecodingData data) {
    return Example(functionField: data.dec(_f$functionField));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin ExampleMappable {
  ExampleCopyWith<Example, Example, Example> get copyWith =>
      _ExampleCopyWithImpl<Example, Example>(
        this as Example,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExampleMapper.ensureInitialized().stringifyValue(this as Example);
  }

  @override
  bool operator ==(Object other) {
    return ExampleMapper.ensureInitialized().equalsValue(
      this as Example,
      other,
    );
  }

  @override
  int get hashCode {
    return ExampleMapper.ensureInitialized().hashValue(this as Example);
  }
}

extension ExampleValueCopy<$R, $Out> on ObjectCopyWith<$R, Example, $Out> {
  ExampleCopyWith<$R, Example, $Out> get $asExample =>
      $base.as((v, t, t2) => _ExampleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExampleCopyWith<$R, $In extends Example, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int Function(int)? functionField});
  ExampleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExampleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Example, $Out>
    implements ExampleCopyWith<$R, Example, $Out> {
  _ExampleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Example> $mapper =
      ExampleMapper.ensureInitialized();
  @override
  $R call({Object? functionField = $none}) => $apply(
    FieldCopyWithData({
      if (functionField != $none) #functionField: functionField,
    }),
  );
  @override
  Example $make(CopyWithData data) => Example(
    functionField: data.get(#functionField, or: $value.functionField),
  );

  @override
  ExampleCopyWith<$R2, Example, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ExampleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

