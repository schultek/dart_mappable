

import '../benchmarks/data.dart';
import '../models/measures.dart';
import '../src/implementation/csv.dart';

void testCsv() {
  List<Measures> measures = Measures.codable().fromCsv(measuresCsv) ;
  print(measures.join('\n'));

  assert(measures.toCsv() == measuresCsv);
}
