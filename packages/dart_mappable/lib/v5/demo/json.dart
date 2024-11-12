
import '../benchmarks/data.dart';
import '../models/person.dart';
import '../src/extended/extended.dart';
import '../src/implementation/json.dart';

void main() {
  Person person = Person.codable().fromJson(personJson);
  assert(personJson == person.toJson());

  String jsonList = Person.codable().list().toJson([person, person]);
  assert(jsonList == '[$personJson,$personJson]');
}