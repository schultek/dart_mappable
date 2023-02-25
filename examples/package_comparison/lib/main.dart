// ignore_for_file: unused_import

/// This file is needed for dart_json_mapper to generate the target file.
/// It must import all other files containing annotated models.

import 'package:package_comparison/main.mapper.g.dart';

import 'comparisons/basic.dart';
import 'comparisons/generic.dart';
import 'comparisons/polymorph.dart';
import 'comparisons/renaming.dart';

/// Dummy method, not actually used for the comparison.
void main() {
  initializeJsonMapper();
  print("Hello World!");
}
