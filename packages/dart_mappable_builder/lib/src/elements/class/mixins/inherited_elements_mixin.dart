import 'package:analyzer/dart/element/element2.dart';

import '../../../utils.dart';
import '../../mapper_element.dart';
import '../class_mapper_element.dart';

mixin InheritedElementsMixin on MapperElement<ClassElement2> {
  List<ClassMapperElement> subElements = [];
  ClassMapperElement? extendsElement;
  List<ClassMapperElement> interfaceElements = [];

  ClassMapperElement? get superElement =>
      extendsElement ?? interfaceElements.firstOrNull;

  late bool isDiscriminatingSubclass = () {
    if (discriminatorKey == null && discriminatorValueCode == null) {
      return false;
    }
    return isSubclass;
  }();

  late bool isSubclass = () {
    if (superElement == null) {
      return false;
    }
    return true;
  }();

  late String? discriminatorKey =
      annotation.value?.read('discriminatorKey')?.toStringValue() ??
          options.discriminatorKey ??
          superElement?.discriminatorKey;

  late String? discriminatorValueCode =
      annotation.getPropertyNode('discriminatorValue')?.toSource();

  List<ClassElement2> getSubClasses() {
    return annotation.value
            ?.read('includeSubClasses')
            ?.toTypeList()
            ?.map((t) => t.element3)
            .whereType<ClassElement2>()
            .toList() ??
        [];
  }
}
