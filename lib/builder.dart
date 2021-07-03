import 'package:build/build.dart';

import 'src/builders/mappable_builder.dart';

/// Entry point for the builder
MappableBuilder buildMappable(BuilderOptions options) =>
    MappableBuilder(options);
