import 'package:dart_mappable/dart_mappable.dart';

import '../test.mapper.g.dart';

class MyPrivateClass {
  MyPrivateClass._();
}

@CustomMapper()
class PrivateClassMapper extends SimpleMapper<MyPrivateClass> {
  @override
  MyPrivateClass decode(dynamic value) {
    return MyPrivateClass._();
  }

  @override
  dynamic encode(MyPrivateClass self) {
    return '__private__';
  }
}

class GenericBox<T> {
  T content;
  GenericBox(this.content);
}

@CustomMapper()
class CustomGenericMapper extends BaseMapper<GenericBox> {
  // only use the base type here

  @override
  Function decoder = <T>(dynamic value) {
    // specify the decoder as a generic function
    return GenericBox<T>(Mapper.fromValue<T>(
        value)); // use the type parameter in your decoding logic
  };

  @override
  Function encoder = (GenericBox self) {
    // no need for type parameters here
    return Mapper.toValue(self.content);
  };

  // in case of generic types, we also must specify a type factory. This is a special type of
  // function used internally to construct generic instances of your type.
  // specify any type arguments in alignment to the decoder function
  @override
  Function get typeFactory => <T>(f) => f<GenericBox<T>>();
}
