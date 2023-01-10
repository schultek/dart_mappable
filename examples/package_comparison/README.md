
## Comparing dart_mappable with other serialization packages

This example contains a number of comparisons between `dart_mappable` and other popular 
serialization packages: 

- `json_serializable` for json serialization
- `freezed` for data-classes
- `dart_json_mapper` for json serialization

## Setup

Besides adding the dependencies, only `dart_json_mapper` needs an explicit `build.yaml` file with 
some build configuration. It also needs a `main.dart` file that imports every model files, since not
every model generates a part-file for itself.

## Structure

This project uses the `test` package to express comparison cases. Therefore all cases can be quickly
validated by running `dart test`. Also the `test` package exposes some generally nice syntax for 
expressing the expected behavior of code snippets using `expect()`.

All comparisons are located inside the `lib/comparisons` folder, where each comparison has a
separate file.

Comparison files have the following structure:

1. Model section
  - Models using json_serializable & freezed
  - Models using dart_json_mapper
  - Models using dart_mappable
2. Comparison cases
  - Snippet using json_serializable
  - Snippet using freezed
  - Snippet using dart_json_mapper
  - Snippet using dart_mappable

In the model section, the same models are implemented in three variants, one using json_serializable 
with freezed, one dart_json_mapper and the other using dart_mappable. There are comments pointing 
out **required boilerplace** and **optional boilderplate**.

In each comparison case, the same action is performed on both variants of the defined models. 
There are comments pointing out various differences, shortcomings or advantages.

### Comparisons

**Basic**

Compares the setup and serialization of a basic model with a single primitive property.

**Nested**

Compares the setup and serialization of a model with a nested property of another model.

**Generic**

Compares the setup and serialization of a model with a generic type parameter.

**Renaming**

Compares how to set a case-style or rename specific fields.



