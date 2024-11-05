import 'dart:convert';

final personAMap = {
  'name': 'Steffen',
  'a': 24,
  'b': 100.2,
  'c': true,
  'd': null,
  'e': ['a', 'b', 'c'],
  'f': [],
};
final personBMap = {
  ...personAMap,
  'd': personAMap,
  'e': personAMap['e'],
  'f': [personAMap, personAMap],
};
final personCMap = {
  ...personBMap,
  'd': personBMap,
  'e': personBMap['e'],
  'f': [personBMap, personBMap, personBMap],
};

final personMap = {
  ...personCMap,
  'f': List.filled(8000, personCMap),
};
final personJson = jsonEncode(personMap);
final personJsonBytes = utf8.encode(personJson);

final boxMap = {
  'data': 'https://docs.page/schultek/jaspr',
};

final boxBoxMap = {
  'data': boxMap,
};

final catMap = {
  'lives': 5,
  'type': 'cat',
};
final dogMap = {
  'breed': 'Aussi',
  'type': 'dog',
};
final birdMap = {
  'color': 'red',
  'type': 'bird',
};

final measuresCsv =
    'a,b,c,d\n'
    'hi,2,3,\n'
    '"test,ho",100,123.4,true\n'
    'hallo this is long,,0.1,false';