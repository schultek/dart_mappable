import 'dart:io';

void compare(
  String name, {
  required void Function() self,
  required void Function() other,
}) {
  print('== $name ==');
  bench('self', self);
  bench('other', other);
}

void bench(String name, void Function() f, {int times = 10, bool sum = false}) {
  for (var i = 0; i < times / 2; i++) {
    f();
  }
  final s = Stopwatch()..start();
  for (var i = 0; i < times; i++) {
    f();
  }
  s.stop();
  var time = formatTime(s.elapsedMicroseconds ~/ (sum ? 1 : times));
  print('$name: $time');
}

String formatTime(int microseconds) {
  if (microseconds < 5000) {
    return '$microsecondsµs';
  } else if (microseconds < 1000000) {
    return '${microseconds / 1000}ms';
  } else {
    return '${microseconds / 1000000}s';
  }
}
