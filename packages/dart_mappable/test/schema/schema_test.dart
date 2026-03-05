import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'schema_test.mapper.dart';

@MappableClass()
class Answer with AnswerMappable {
  final String answer;
  final double confidence;

  Answer(this.answer, this.confidence);
}

@MappableClass()
class QuizQuestion with QuizQuestionMappable {
  final String question;
  final List<String> options;
  final int correctIndex;
  final bool isRequired;
  final double? weight;
  final Map<String, dynamic>? metadata;
  final Answer? suggestedAnswer;
  final Difficulty difficulty;

  QuizQuestion(
    this.question,
    this.options,
    this.correctIndex, {
    required this.isRequired,
    this.weight,
    this.metadata,
    this.suggestedAnswer,
    this.difficulty = Difficulty.medium,
  });
}

@MappableEnum()
enum Difficulty { easy, medium, hard }

void main() {
  group('toJsonSchema', () {
    test('generates schema for simple model', () {
      var schema = AnswerMapper.toJsonSchema();

      expect(schema['type'], equals('object'));
      expect(schema['additionalProperties'], equals(false));
      expect(schema['required'], containsAll(['answer', 'confidence']));

      var props = schema['properties'] as Map<String, dynamic>;
      expect(props['answer'], equals({'type': 'string'}));
      expect(props['confidence'], equals({'type': 'number'}));
    });

    test('generates schema for complex model', () {
      var schema = QuizQuestionMapper.toJsonSchema();

      expect(schema['type'], equals('object'));
      expect(schema['additionalProperties'], equals(false));

      // Required fields (non-optional constructor params).
      var required = schema['required'] as List;
      expect(
        required,
        containsAll(['question', 'options', 'correctIndex', 'isRequired']),
      );
      expect(required, isNot(contains('weight')));
      expect(required, isNot(contains('metadata')));
      expect(required, isNot(contains('suggestedAnswer')));

      var props = schema['properties'] as Map<String, dynamic>;
      expect(props['question'], equals({'type': 'string'}));
      expect(props['correctIndex'], equals({'type': 'integer'}));
      expect(props['isRequired'], equals({'type': 'boolean'}));

      // Nullable double.
      expect(props['weight'], equals({'type': 'number', 'nullable': true}));

      // List<String>.
      expect(
        props['options'],
        equals({
          'type': 'array',
          'items': {'type': 'string'},
        }),
      );

      // Map<String, dynamic>.
      expect(props['metadata']?['type'], equals('object'));

      // Nested MappableClass.
      var answerSchema = props['suggestedAnswer'] as Map<String, dynamic>;
      expect(answerSchema['type'], equals('object'));
      expect(answerSchema['nullable'], equals(true));
      expect(
        (answerSchema['properties'] as Map)['answer'],
        equals({'type': 'string'}),
      );

      // Enum field.
      expect(props['difficulty']?['type'], equals('string'));
      expect(
        props['difficulty']?['enum'],
        containsAll(['easy', 'medium', 'hard']),
      );
    });
  });
}
