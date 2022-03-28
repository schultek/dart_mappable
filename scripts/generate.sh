cd packages/dart_mappable
dart run build_runner build --delete-conflicting-outputs
cd example
dart run build_runner build --delete-conflicting-outputs
cd ../../../examples/example_freezed
dart run build_runner build --delete-conflicting-outputs