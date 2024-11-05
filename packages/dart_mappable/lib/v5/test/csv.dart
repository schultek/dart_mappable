

import '../benchmarks/data.dart';
import '../models/measures.dart';
import '../src/implementation/csv.dart';
import '../src/mapper/primitive.dart';

void testCsv() {


  List<Measures> measures = CsvCoding().decode(measuresCsv, ListDecoder(Measures.decoder())) ;

  print(measures.join('\n'));

}
