
## Comparing dart_mappable with json_serializable

This example contains a number of comparisons between `dart_mappable` and the 
popular `json_serializable` package.

Only the serialization aspects of both packages are compared, since `json_serializable` does not
contain all features that `dart_mappable` has.

### Structure

This project uses the `test` package to express comparison cases. Therefore all cases can be quickly
validated by running `dart test`. Also the `test` package exposes some generally nice syntax for 
expressing the expected behavior of code snippets using `expect()`.

All comparisons are located inside the `lib/comparisons` folder, where each comparison has a
separate file.

Comparison files have the following structure:

1. Model section
  - Models using json_serializable
  - Models using dart_mappable
2. Comparison cases
  - Snippet using json_serializable
  - Snippet using dart_mappable

In the model section, the same models are implemented in two variants, one using json_serializable 
and the other using dart_mappable. There are comments pointing out **required boilerplace** and 
**optional boilderplate**.

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



