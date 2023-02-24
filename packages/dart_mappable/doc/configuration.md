There are different configuration options that control how `dart_mappable` generates code for your
models. Most of the options can be configured on three levels:

- On a **Class Level**, by using its property on the `@MappableClass()` annotation, 
- on a **Library Level**, by using its property on the `@MappableLib()` annotation, or
- on a **Global Level**, by defining its options in the `build.yaml` file (as shown further down).

Class level configurations override library level configurations override global configurations.

## Generation Methods

This package can generate a few different sets of methods, which can be **activated or deactivated**
individually. This makes sure that only code is generated that you actually need.
By default, all methods are generated for each class.

You can set the `generateMethods` property to specify which methods to generate. 
The following methods are supported:

- **decode**: Will generate `fromJson` and `fromMap`.
- **encode**: Will generate `toJson` and `toMap`.
- **copy**: Will generate `copyWith`.
- **stringify**: Will generate the `toString` override.
- **equals**: Will generate the `==` and `hashCode` overrides.

When using **annotations**, you can specify multiple methods using the *bitwise-or* operator like this:
`@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify)`.

## Case Styles

You can specify the `caseStyle` options for the json keys and the `enumCaseStyle` option for your 
stringified enum values. Choose one of the existing styles or specify a custom one.

Currently supported are:

| Option                | Code                   | Example `myFieldName`            |
|-----------------------|------------------------|----------------------------------|
| `none` / `unmodified` | `CaseStyle.none`       | myFieldName (unchanged, default) |
| `camelCase`           | `CaseStyle.camelCase`  | myFieldName (dart style)         |
| `pascalCase`          | `CaseStyle.pascalCase` | MyFieldName                      |
| `snakeCase`           | `CaseStyle.snakeCase`  | my_field_name                    |
| `paramCase`           | `CaseStyle.paramCase`  | my-field-name                    |
| `lowerCase`           | `CaseStyle.lowerCase`  | myfieldname                      |
| `upperCase`           | `CaseStyle.upperCase`  | MYFIELDNAME                      |

You can also specify a **custom case style** using the `custom(ab,c)` syntax or `CaseStyle()` class.

- The letters before the comma define how to transform each word of a field name. They can be either
  `l` for `lowerCase`, `u` for `upperCase`, or `c` for `capitalCase`. When using only one letter,
  it is applied to all words. When using two letters, the first one is applied to only the first word
  and the second one to all remaining words. Respective options `head` and `tail`.
  
- The one letter after the comma defines the separator between each word, like `_` or `-`. This can
  be any character or empty. Respective option `separator`.

Here are some examples that can be achieved using this syntax:

| Option         | Code                                                                                        | Example `myFieldName` |
|----------------|---------------------------------------------------------------------------------------------|-----------------------|
| `custom(u,_)`  | `CaseStyle(tail: TextTransform.upperCase, separator: '_')`                                  | MY_FIELD_NAME         |
| `custom(uc,+)` | `CaseStyle(head: TextTransform.upperCase, tail: TextTransform.capitalCase, separator: '+')` | MY+Field+Name         |
| `custom(cl,)`  | `CaseStyle(head: TextTransform.capitalCase, tail: TextTransform.lowerCase)`                 | Myfieldname           |

## Global options

Additionally to using the `@MappableClass()` and `@MappableLib()` annotations for configuration,
you can also define a subset of their properties as global options in the `build.yaml` file:

```yaml
global_options:
  dart_mappable_builder:
    options:
      # the case style for the map keys, defaults to 'none'
      caseStyle: none # or 'camelCase', 'snakeCase', etc.
      # the case style for stringified enum values, defaults to 'none'
      enumCaseStyle: none # or 'camelCase', 'snakeCase', etc.
      # if true removes all map keys with null values
      ignoreNull: false # or true
      # used as property name for type discriminators
      discriminatorKey: type
      # used to specify which methods to generate (all by default)
      generateMethods: [decode, encode, copy, stringify, equals]
```

---

<p align="right"><a href="../topics/Copy-With-topic.html">Next: Copy-With</a></p>
