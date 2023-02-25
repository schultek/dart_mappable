import 'package:dart_json_mapper/dart_json_mapper.dart' as d;
import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../main.mapper.g.dart';
import '../utils.dart';

part 'generic.g.dart';
part 'generic.mapper.dart';

// 1️⃣ === json_serializable ===

@JsonSerializable(genericArgumentFactories: true)
class BoxA<T> {
  final T content;

  BoxA({required this.content});

  // Required Boilerplate
  factory BoxA.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BoxAFromJson(json, fromJsonT);

  // Required Boilerplate
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BoxAToJson(this, toJsonT);
}

@JsonSerializable()
class ContentA {
  final String data;

  ContentA(this.data);

  // Required Boilerplate
  factory ContentA.fromJson(Map<String, dynamic> json) =>
      _$ContentAFromJson(json);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$ContentAToJson(this);
}

// 2️⃣ === dart_json_mapper ===

@d.jsonSerializable
class BoxB<T> {
  final T content;

  BoxB({required this.content});
}

@d.jsonSerializable
class ContentB {
  final String data;

  ContentB(this.data);
}

// 3️⃣ === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class BoxC<T> with BoxCMappable<T> {
  final T content;

  BoxC({required this.content});
}

@MappableClass()
// Required Boilerplate (Mixin)
class ContentC with ContentCMappable {
  final String data;

  ContentC(this.data);
}

// 🆚 === Comparison ===

void compareGeneric() {
  group('generic', () {
    setUpAll(() {
      // 🟠 required for dart_json_mapper
      initializeJsonMapper();
      // 🟠 required for dart_mappable
      ContentCMapper.ensureInitialized();
    });

    group('🆚 decode from map', () {
      test('1️⃣ json_serializable', () {
        // 🟠 requires explicit passing of argument decoders
        // 🟠 requires manual handling of objects (here: cast to map without type checking)
        expect(
          BoxA.fromJson({
            'content': {'data': 'abcd'}
          }, (o) => ContentA.fromJson(o as Map<String, dynamic>)),
          predicate<BoxA<ContentA>>((b) => b.content.data == 'abcd'),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        // 🔴 unsupported, only can decode to BoxB<dynamic>
        expect(
          () => d.JsonMapper.fromMap<BoxB<ContentB>>({
            'content': {'data': 'abcd'}
          }),
          throwsA(isA<TypeError>()),
        );

        // 🔴 incorrect, doesn't decode ContentB
        expect(
          d.JsonMapper.fromMap<BoxB<dynamic>>({
            'content': {'data': 'abcd'}
          }),
          predicate<BoxB<dynamic>>(
              (b) => equals({'data': 'abcd'}).matches(b.content, {})),
        );
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 allows to use [equals] because of [operator ==] override
        expect(
          BoxCMapper.fromMap<ContentC>({
            'content': {'data': 'abcd'}
          }),
          equals(BoxC(content: ContentC('abcd'))),
        );
      });
    });

    group('🆚 encode to map', () {
      test('1️⃣ json_serializable', () {
        // 🟠 requires explicit passing of argument encoders
        expect(
          BoxA(content: ContentA('abcd')).toJson((c) => c.toJson()),
          equals({
            'content': {'data': 'abcd'}
          }),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        expect(
          d.JsonMapper.toMap(BoxB(content: ContentB('abcd'))),
          equals({
            'content': {'data': 'abcd'}
          }),
        );

        expect(
          d.JsonMapper.toMap(BoxB(content: 123)),
          equals({'content': 123}),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          BoxC(content: ContentC('abcd')).toMap(),
          equals({
            'content': {'data': 'abcd'}
          }),
        );
      });
    });

    group('🆚 decode from faulty map', () {
      test('1️⃣ json_serializable', () {
        // 🟠 requires manual error handling
        expect(
          () => BoxA.fromJson({'content': '123'}, (o) {
            if (o is Map<String, dynamic>) {
              return ContentA.fromJson(o);
            } else {
              throw FormatException('Expected Map<String, dynamic>');
            }
          }),
          throwsFormatException,
        );
      });

      test('2️⃣ dart_json_mapper', () {
        // 🔴 unsupported, no error handling
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 has integrated error handling with detailed error messages
        expect(
          () => BoxCMapper.fromMap<ContentC>({'content': '123'}),
          throwsMapperException(
              'Failed to decode (BoxC<ContentC>).content(ContentC): '
              'Expected a value of type Map<String, dynamic>, but got type String.'),
        );
      });
    });

    group('🆚 decode with generic type argument', () {
      test('1️⃣ json_serializable', () {
        // 🔴 unsupported
        T decode<T>(Map<String, dynamic> map) {
          // not supported, would require manual `if (T == ...)` cases.
          throw UnsupportedError('Cant decode to generic type $T.');
        }

        expect(() => decode<ContentA>({}), throwsUnsupportedError);
      });

      test('2️⃣ dart_json_mapper', () {
        // 🔴/🟠 unsupported for generic types, only for non-generic types
        var decode = d.JsonMapper.fromMap;

        // works only for non-generic types
        expect(
          decode<ContentB>({'data': 'abcd'}),
          predicate<ContentB>((c) => c.data == 'abcd'),
        );

        // fails for generic types
        expect(
          () => decode<BoxB<String>>({'content': 'abc'}),
          throwsA(isA<TypeError>()),
        );
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 built in
        var decode = MapperContainer.globals.fromValue;

        expect(
          decode<BoxC<ContentC>>({
            'content': {'data': 'abcd'}
          }),
          equals(BoxC<ContentC>(content: ContentC('abcd'))),
        );

        expect(
          decode<BoxC<String>>({'content': 'abcd'}),
          equals(BoxC<String>(content: 'abcd')),
        );

        // 🟢 also works for lists
        expect(
          decode<List<int>>([123, '456', 78.9]),
          equals(<int>[123, 456, 79]),
        );
      });
    });
  });
}
