import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'generic.g.dart';
part 'generic.mapper.dart';

// === json_serializable ===

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

// === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class BoxB<T> with BoxBMappable<T> {
  final T content;

  BoxB({required this.content});
}

@MappableClass()
// Required Boilerplate (Mixin)
class ContentB with ContentBMappable {
  final String data;

  ContentB(this.data);
}

// === Comparison ===

void compareGeneric() {
  group('generic', () {
    // dart_mappable
    // -> requires to link mappers once
    BoxBMapper.container.link(ContentBMapper.container);

    test('decode from map', () {
      // json_serializable
      // -> requires explicit passing of argument decoders
      // -> requires manual handling of objects (here: cast to map without type checking)
      expect(
        BoxA.fromJson({
          'content': {'data': 'abcd'}
        }, (o) => ContentA.fromJson(o as Map<String, dynamic>)),
        predicate<BoxA<ContentA>>((b) => b.content.data == 'abcd'),
      );

      // dart_mappable
      // -> allows to use [equals] because of [operator ==] override
      expect(
        BoxBMapper.fromMap<ContentB>({
          'content': {'data': 'abcd'}
        }),
        equals(BoxB(content: ContentB('abcd'))),
      );
    });

    test('encode to map', () {
      // json_serializable
      // -> requires explicit passing of argument encoders
      expect(
        BoxA(content: ContentA('abcd')).toJson((c) => c.toJson()),
        equals({
          'content': {'data': 'abcd'}
        }),
      );

      // dart_mappable
      expect(
        BoxB(content: ContentB('abcd')).toMap(),
        equals({
          'content': {'data': 'abcd'}
        }),
      );
    });

    test('decode from faulty map', () {
      // json_serializable
      // -> requires manual error handling
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

      // dart_mappable
      // -> has integrated error handling with detailed error messages
      expect(
        () => BoxBMapper.fromMap<ContentB>({'content': '123'}),
        throwsMapperException(
            'Failed to decode (BoxB<ContentB>).content(ContentB): '
            'Cannot decode value of type String to type ContentB, because '
            'a value of type Map<String, dynamic> is expected.'),
      );
    });

    test('decode with generic type argument', () {
      // json_serializable
      // -> unsupported
      BoxA<T> decodeA<T>(Map<String, dynamic> map) {
        return BoxA.fromJson(map, (o) {
          throw UnsupportedError('Not possible to decode to generic type $T.');
        });
      }

      expect(
        () => decodeA<ContentA>({
          'content': {'data': 'abcd'}
        }),
        throwsUnsupportedError,
      );

      expect(
        () => decodeA<String>({'content': 'abcd'}),
        throwsUnsupportedError,
      );

      // dart_mappable
      // -> built in
      BoxB<T> Function<T>(Map<String, dynamic>) decodeB = BoxBMapper.fromMap;

      expect(
        decodeB<ContentB>({
          'content': {'data': 'abcd'}
        }),
        equals(BoxB(content: ContentB('abcd'))),
      );

      expect(
        decodeB<String>({'content': 'abcd'}),
        equals(BoxB(content: 'abcd')),
      );
    });
  });
}
