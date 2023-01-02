import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:path/path.dart' as path;

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';

class TempAssetWriter implements RecordingAssetWriter {
  @override
  final Map<AssetId, List<int>> assets = {};

  late final Directory dir;

  List<File> files = [];

  TempAssetWriter() {
    var id = Random().nextInt(1e6.round());
    dir = Directory.fromUri(
        Uri.parse(path.join(Directory.systemTemp.path, 'mappable_$id')));
    dir.createSync();
  }

  Future<dynamic> run(String code) async {
    return await _run('''
      import 'dart:isolate';
      import 'dart:async';
      import 'package:test/test.dart';
      import './model.dart';
      
      void main(dynamic args, SendPort port) async {
        await runZonedGuarded(() async {
          var result = await run();
          port.send(result);
        }, (e, s) {
          throw e;
        });
      }
      
      FutureOr<dynamic> run() async {
        $code
      }
    ''').last;
  }

  Stream<dynamic> _run(String code) async* {
    var main = File(path.join(dir.path, 'lib/main.dart'));

    main.writeAsStringSync(code);

    var port = ReceivePort();
    var errorPort = ReceivePort();
    var exitPort = ReceivePort();

    var isolate = await Isolate.spawnUri(
      main.uri,
      [],
      port.sendPort,
      packageConfig: Uri.parse(path.join(
        Directory.current.path,
        '.dart_tool/package_config.json',
      )),
    );

    isolate.addErrorListener(errorPort.sendPort);
    isolate.addOnExitListener(exitPort.sendPort);

    var results = StreamController.broadcast();

    var sub = port.listen((message) {
      results.add(message);
    });

    errorPort.listen((message) {
      var listMessage = message as List<Object?>;
      var error = listMessage[0] as String;
      var stack = listMessage[1] as String;

      results.addError(error, StackTrace.fromString(stack));
    });

    exitPort.first.whenComplete(() {
      sub.cancel();
      results.close();
    });

    yield* results.stream;
  }

  Future<dynamic> exec(String statement) {
    return execAll([statement]).first;
  }

  Stream<dynamic> execAll(List<String> statements) {
    return _run('''
      import 'dart:isolate';
      import './model.dart';
      
      void main(dynamic args, SendPort port) {
        ${statements.map((s) => 'port.send($s);').join('\n')}
      }
    ''');
  }

  @override
  Future writeAsBytes(AssetId id, List<int> bytes) async {
    assets[id] = bytes;
    var file = File(path.join(dir.path, id.path));
    var subdir = Directory(path.dirname(file.path));
    subdir.createSync(recursive: true);
    file.writeAsBytesSync(bytes);
    files.add(file);
  }

  @override
  Future writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8}) async {
    return writeAsBytes(id, encoding.encode(contents));
  }

  void dispose() {
    dir.deleteSync(recursive: true);
  }
}
