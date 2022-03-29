./scripts/setup.sh
cd packages/dart_mappable
dart run build_runner build --delete-conflicting-outputs
dart test
cd ../..
./scripts/cleanup.sh