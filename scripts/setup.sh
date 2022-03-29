cd packages/dart_mappable_builder
cp pubspec.yaml pubspec.yaml.save
echo "\ndependency_overrides:\n  dart_mappable:\n    path: ../dart_mappable" >> pubspec.yaml
dart pub get
cd ../dart_mappable
cp pubspec.yaml pubspec.yaml.save
echo "\ndependency_overrides:\n  dart_mappable_builder:\n    path: ../dart_mappable_builder" >> pubspec.yaml
dart pub get