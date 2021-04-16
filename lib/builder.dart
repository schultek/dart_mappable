import 'package:build/build.dart';

import 'src/mappable_builder.dart';

export 'src/builder_options.dart';
export 'src/case_style.dart' show CaseStyle, TextTransform;
export 'src/mappable_builder.dart';

/// Entry point for the builder
MappableBuilder buildMappable(BuilderOptions options) =>
    MappableBuilder(options);
