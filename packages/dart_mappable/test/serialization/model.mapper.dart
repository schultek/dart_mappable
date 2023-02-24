// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'model.dart';

class BMapper extends EnumMapper<B> {
  BMapper._();
  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
    }
    return _instance!;
  }

  static B fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  B decode(dynamic value) {
    switch (value) {
      case 'a':
        return B.a;
      case 'bB':
        return B.bB;
      case 'ccCc':
        return B.ccCc;
      default:
        return B.values[0];
    }
  }

  @override
  dynamic encode(B self) {
    switch (self) {
      case B.a:
        return 'a';
      case B.bB:
        return 'bB';
      case B.ccCc:
        return 'ccCc';
    }
  }
}

extension BMapperExtension on B {
  String toValue() {
    BMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
