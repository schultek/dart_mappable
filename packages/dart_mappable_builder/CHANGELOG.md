# 4.2.0

- Added custom typedef for mapping fields to resolve naming conflict.
- Deprecated creating and linking custom `MapperContainer`s.
  If you are affected by this see https://github.com/schultek/dart_mappable/issues/159.

# 4.1.0

- Added support for shallow encoding a class:
  - `MyClassMapper.ensureInitialized().encodeMap<MyClass>(myClass, EncodingOptions(shallow: true))`
- Correctly escape `$` in class names.
- Added option to use unordered list equality with iterables:
  - `IterableMapper.equalityMode = IterableEqualityMode.unordered`
- Added [`build_extensions`](https://pub.dev/documentation/dart_mappable/latest/topics/Configuration-topic.html#buildextensions) option to builder configuration.

# 4.0.1

- Added support for generic typed parameters for deep copyWith.
- Added lint ignores for 'unnecessary_cast', 'strict_raw_type' and 'inference_failure_on_untyped_parameter'

# 4.0.0

- Require `sdk: >=3.0.0`.
- Added support for **Records**.

  - Fields of a class can now be any record type.
  - You can annotate toplevel record typedefs:

    ```dart
      @MappableRecord()
      typedef Coordinates = ({double latitude, double longitude});
    ```
    
  For a more detailed usage see the documentation.

# 3.3.0

- Make enum encoding explicitly typed.
- Update analyzer to '>=5.11.0 <7.0.0'

# 3.2.3

- Respect keys and hooks for annotated getters.

# 3.2.2

- Handle even more cases for generic subclassing.

# 3.2.1

- Handle bounded nested type parameters in subclasses.

# 3.2.0

- Added support for annotating getters with `@MappableField`, which will then be included in the encoding,
  equality checks, and stringification of that class.

# 3.1.2

- Fixed bug with broken mapper generation.

# 3.1.1

- Fixed supporting expressions in `@MappableClass.includeCustomMappers`.

# 3.1.0

- Fixed error when using non-literal values in `@MappableValue()`.

- The builder now respects basic initializer expressions of a constructor. This makes it
  possible to do field renaming or assigning to private fields without requiring an additional
  getter matching the parameter.

  The following is now supported out of the box:

  ```dart
  class MyClass {
    MyClass(int value, {String? name}) 
        // Effectively renaming 'value' to 'data'.
      : data = value,
        // Assigning to a private field + having a null fallback.
        _name = name ?? 'Unnamed';

    final int value;
    final String _name;
  ```

- Fixed encoding of a map now returns a `Map<String, dynamic>` where possible
  (instead of a `Map<dynamic, dynamic>`)

# 3.0.2

- Fixed generic decoding when using generic superclass.
- Fixed unknown-type bug for serialized non-constructor fields.

# 3.0.1

- Fixed bug with undetermined `includeSubClasses`.

# 3.0.0

- **Breaking**: Generated mappers no longer have a `.container` property. This was removed in favor
  of the new `MapperContainer.globals` container.

  ```dart
  // Instead of this:
  var value = MyClassMapper.container.fromValue(...);
  // Do this:
  var value = MapperContainer.globals.fromValue(...);
  ```

  Mapper initialization and usage is now simplified to the following:

  1. When used explicitly (e.g. through `MyClassMapper.fromMap` or `myClass.toMap()`) no additional
     initialization is needed.
  2. When used implicitly (through a generic type e.g. `MapperContainer.globals.fromMap<MyClass>()`) the
     mapper needs to be initialized once before being used with `MyClassMapper.ensureInitialized()`.


- **Breaking**: Changed internal mapper implementation which causes any custom mapper to break.
  - Removed `MapperElementBase` class.
  - Added `MappingContext` being passed to mapper methods.

  *See docs on how to use custom mappers in v3.*


- **Breaking**: Removed `@MappableLib.createCombinedContainer` in favor of `@MappableLib.generateInitializerForScope`.

  Instead of generating a new container, v3 generates an initialization function for all mappers. Use it early on in your
  application:

  ```dart
  @MappableLib(generateInitializerForScope: InitializerScope.package)
  library main;
  
  import 'main.init.dart';
  
  void main() {
    initializeMappers();
    ...
  }
  ```


- **Breaking**: Improved support and features for `.copyWith`.

  - Copy-With now supports classes that implement multiple interfaces.
  - Renamed `.copyWith.apply()` method to `.copyWith.$update()`.
  - Added `.copyWith.$merge()` and `.copyWith.$delta()`.

  You can now use `.copyWith` with either an existing instance using `.$merge` or a map of values using `.$delta`.

  ```dart
  @MappableClass()
  class A with AMappable {
    A(this.a, this.b);
    
    int? a;
    int? b;
  }
  
  void main() {
    var a = A(1, null);
    
    var c = a.copyWith.$merge(A(null, 2));
    assert(c == A(1, 2));
  
    var d = a.copyWith.$delta({'b': 2});
    assert(d == A(1, 2));
  }
  ```


- **Breaking**: Removed `CheckTypesHook` in favor of discriminator functions.

  You can now use a custom predicate function as the `discriminatorValue` of a class. This function can check
  whether the encoded value should be decoded to this subclass and return a boolean.

  ```dart
  @MappableClass()
  abstract class A with AMappable {
    A();
  }
  
  @MappableClass(discriminatorValue: B.checkType)
  class B extends A with BMappable {
    B();
    
    /// checks if [value] should be decoded to [B]
    static bool checkType(value) {
      return value is Map && value['isB'] == true;
    }
  }
  
  @MappableClass(discriminatorValue: C.checkType)
  class C extends A with CMappable {
    C();
    
    /// checks if [value] should be decoded to [C]
    static bool checkType(value) {
      return value is Map && value['isWhat'] == 'C';
    }
  }
  ```


- Added support for serializing fields that are not part of the constructor
  when annotated with `@MappableField()`.
- Added `EncodingOptions` to `toValue` method.
- Added support for third-party models by using annotated `typedef`s.
- Added `renameMethods` to build options.
- Improved performance of generated encoding and decoding methods.

For a detailed migration guide, see [this issue](https://github.com/schultek/dart_mappable/issues/71).

# 2.0.2

- Fixed an analysis error when using core interfaces.

# 2.0.1

- Fixed generated container for private libraries.

# 2.0.0

- Mappers are now generated for each file containing annotated classes. This removes the
  need to specify entry points in the `build.yaml`.

  > This is now similar to how packages like `json_serializable` or `freezed` generate code.

  - Generated files are now `part` files and need to be included as such.
  - All annotated classes must now use their respective `<MyClass>Mappable` mixin.
  - Instead of one global `Mapper` each class has its own `<ClassName>Mapper`.
    - A new global container that includes all models can now be generated using 
      `@MappableLib(createCombinedContainer: true)`.
  - Mappers can be linked together to enable working with multiple classes.
  - Removed `@CustomMapper` annotation in favor of `includeCustomMappers` property on `@MappableClass()`.

  For a detailed migration guide, see [this issue](https://github.com/schultek/dart_mappable/issues/46).

- Documentation is now separated from the README using the official pub.dev documentation topics.
  Find the new documentation [here](https://pub.dev/documentation/dart_mappable/latest/topics/Introduction-topic.html)

- Improvements in performance and support for generics and inheritance.

- Added the [CheckTypesHook] to allow for custom discriminator checks on subclasses in a
  polymorphic class structure.

- CopyWith is now more powerful and also works for generic or polymorphic classes, while being 
  completely type-safe.
  
  When called on a superclass, the concrete subtype will be retained through a
  `.copyWith` call, which also respects generics:

  ```dart
    // with `class A` and `class B<T> extends A`
    A a = B<int>(); // static type A, dynamic type B<int>
  
    // signature will be `A copyWith()`, so static type A
    A a2 = a.copyWith(); 
  
    // this will still resolve to a dynamic type of B<int>
    assert(a2 is B<int>);
  ```

  For more checkout the [docs](https://pub.dev/documentation/dart_mappable/latest/topics/Copy-With-topic.html)
  or [example](https://github.com/schultek/dart_mappable/tree/main/examples/polymorph_copywith)

# 1.2.0

- Added support for `2.17` super parameters

# 1.1.3

- Fixed import paths on windows

# 1.1.2

- Improved Readme for constructor utilization
- Fixed missing imports for custom hooks

# 1.1.1

- Updated description

# 1.1.0

- Added support for custom enum values
  - Choose between `ValuesMode.named` and `ValuesMode.indexed` for automatic generation of encoded values
  - Use `@MappableValue(myCustomValue)` on an enum value to specify a custom encoded value
  - Deprecated the `String toStringValue()` extension method in favor of the more general `dynamic toValue()`

# 1.0.2

- Fixed unrecognized type issue for `equals`, `hashCode` and `toString` methods

# 1.0.1

- Improved resolving of constructor parameters, which fixed various issues 
  in `copyWith` and `toMap` methods

# 1.0.0

- Initial release of builder package
