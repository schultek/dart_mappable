// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum()
enum State { On, off, itsComplicated }

@MappableEnum(caseStyle: CaseStyle.paramCase)
enum Color { Green, BLUE, bloodRED }
