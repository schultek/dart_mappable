Imagine a serialization package with:

- **NO** boilerplate code (Nothing at all, ZERO lines of code)
- **NO** annotations ("Don't @ me...")
- **NO** minified/uglified generated files
- **NO** extra dependencies (Yes, not even to this package)

while still being able to

- **decode & encode** json
- come with built-in **type & null-safety**
- be **fully configurable**
- support **custom types**

Sounds too good to be true? Not anymore.

# Dart Mappable

## Get Started

This package is designed to be purely used as a `dev_dependency`. No need to import this package anywhere in your code.
To get started, add the following lines to your `pubspec.yaml`:

```yaml
dev_dependencies:
  dart_mappable: ^0.1.1
  build_runner: ^1.12.2
```

Next, create a `build.yaml` in the root directory of your package and add this snippet:

```yaml
targets:
  $default:
    builders:
      dart_mappable:
        generate_for:
          - lib/main.dart # modify this if you have a different entry point
```

In order to generate the serialization code, run the following command:

```shell script
pub run build_runner build
```

You'll need to re-run code generation each time you are making changes to your code. So for development time, use watch like this

```shell script
pub run build_runner watch
```

This will generate a `.g.dart` file for each of your entry points specified in the `build.yaml` file.
Last step is to `import` the generated files wherever you want / need them.

> Hint: This package will generate clean, formatted, and easy to understand code. Have a look at the generated files. 
> I guarantee you won't be drowned in uglified code.

## TODOs

- Improve documentation
- Add examples
- Support for generic classes

## Builder Config

```yaml
targets:
  $default:
    builders:
      dart_mappable:
        generate_for:
          - lib/main.dart
          - lib/models.dart # multiple independent entry files
        options:

          # use only one of (exclude, include) or none, which then generates code for all classes
          exclude: [ClassA, ClassB] # ignores specific classes, generates code for all else
          include: [ClassC, ClassD] # generates code for specified classes, ignores all else

          # the case style for the map keys, defaults to 'none'
          caseStyle: none # or 'camelCase', 'kebabCase' 'pascalCase', 'snakeCase', 'snakeAllCaps'
          # the case style for stringified enum values, defaults to 'none'
          enumCaseStyle: none # or 'camelCase', 'kebabCase' 'pascalCase', 'snakeCase', 'snakeAllCaps'
          # if true removes all map keys with null values
          ignoreNull: false # or true
          
          # overwrite options for specific libraries
          libraries: 

            # referenced by its entry point (also for implicit libraries)
            lib/main.dart: 
              include: [ClassA] # here: include only class 'ClassA'

              # overwrite options for specific classes
              classes: 
                ClassA: # name of the class
                  constructor: decode # specify a named constructor to use (instead of using the default)
                  caseStyle: camelCase # overwrite the caseStyle
                  fields: # overwrite the string mapping for specific fields
                    someField: _my+special:json_key
              
              # overwrite options for specific enums
              enums:
                MyEnum:
                  caseStyle: snakeCase # overwrite the caseStyle
            
            # referenced by its name
            models: 
              exclude: [] # here: include everything
              ignoreNull: true # here: overwrite property to remove keys with null values
              caseStyle: custom(lc,+) # here: set a custom case style (see below)
```

## Case Styles

You can specify the case style for the json keys and your stringified enum values. Choose one of the existing styles or spefify a custom one.

TODO

## Utilize Constructors

By utilizing constructor arguments and initializer lists, you have fine control over how to parse your json objects. Possibilities include, while not limited to:

- renaming fields
- computing values
- custom date formats

TODO

## Custom Types

You can create custom type converters to serialize / deserialize custom types that are not part of the generated code.

TODO