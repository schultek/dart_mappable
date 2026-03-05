// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'schema_test.dart';

class DifficultyMapper extends EnumMapper<Difficulty> {
  DifficultyMapper._();

  static DifficultyMapper? _instance;
  static DifficultyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DifficultyMapper._());
    }
    return _instance!;
  }

  static Difficulty fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Difficulty decode(dynamic value) {
    switch (value) {
      case r'easy':
        return Difficulty.easy;
      case r'medium':
        return Difficulty.medium;
      case r'hard':
        return Difficulty.hard;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Difficulty self) {
    switch (self) {
      case Difficulty.easy:
        return r'easy';
      case Difficulty.medium:
        return r'medium';
      case Difficulty.hard:
        return r'hard';
    }
  }
}

extension DifficultyMapperExtension on Difficulty {
  String toValue() {
    DifficultyMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Difficulty>(this) as String;
  }
}

class AnswerMapper extends ClassMapperBase<Answer> {
  AnswerMapper._();

  static AnswerMapper? _instance;
  static AnswerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnswerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Answer';

  static String _$answer(Answer v) => v.answer;
  static const Field<Answer, String> _f$answer = Field('answer', _$answer);
  static double _$confidence(Answer v) => v.confidence;
  static const Field<Answer, double> _f$confidence = Field(
    'confidence',
    _$confidence,
  );

  @override
  final MappableFields<Answer> fields = const {
    #answer: _f$answer,
    #confidence: _f$confidence,
  };

  static Answer _instantiate(DecodingData data) {
    return Answer(data.dec(_f$answer), data.dec(_f$confidence));
  }

  @override
  final Function instantiate = _instantiate;

  static Answer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Answer>(map);
  }

  static Answer fromJson(String json) {
    return ensureInitialized().decodeJson<Answer>(json);
  }

  static Map<String, dynamic> toJsonSchema() {
    ensureInitialized();
    return JsonSchema.objectSchema(
      properties: {
        'answer': JsonSchema.string(),
        'confidence': JsonSchema.number(),
      },
      required: ['answer', 'confidence'],
    );
  }
}

mixin AnswerMappable {
  String toJson() {
    return AnswerMapper.ensureInitialized().encodeJson<Answer>(this as Answer);
  }

  Map<String, dynamic> toMap() {
    return AnswerMapper.ensureInitialized().encodeMap<Answer>(this as Answer);
  }

  AnswerCopyWith<Answer, Answer, Answer> get copyWith =>
      _AnswerCopyWithImpl<Answer, Answer>(this as Answer, $identity, $identity);
  @override
  String toString() {
    return AnswerMapper.ensureInitialized().stringifyValue(this as Answer);
  }

  @override
  bool operator ==(Object other) {
    return AnswerMapper.ensureInitialized().equalsValue(this as Answer, other);
  }

  @override
  int get hashCode {
    return AnswerMapper.ensureInitialized().hashValue(this as Answer);
  }

  static Map<String, dynamic> toJsonSchema() {
    return AnswerMapper.toJsonSchema();
  }
}

extension AnswerValueCopy<$R, $Out> on ObjectCopyWith<$R, Answer, $Out> {
  AnswerCopyWith<$R, Answer, $Out> get $asAnswer =>
      $base.as((v, t, t2) => _AnswerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AnswerCopyWith<$R, $In extends Answer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? answer, double? confidence});
  AnswerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AnswerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Answer, $Out>
    implements AnswerCopyWith<$R, Answer, $Out> {
  _AnswerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Answer> $mapper = AnswerMapper.ensureInitialized();
  @override
  $R call({String? answer, double? confidence}) => $apply(
    FieldCopyWithData({
      if (answer != null) #answer: answer,
      if (confidence != null) #confidence: confidence,
    }),
  );
  @override
  Answer $make(CopyWithData data) => Answer(
    data.get(#answer, or: $value.answer),
    data.get(#confidence, or: $value.confidence),
  );

  @override
  AnswerCopyWith<$R2, Answer, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AnswerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class QuizQuestionMapper extends ClassMapperBase<QuizQuestion> {
  QuizQuestionMapper._();

  static QuizQuestionMapper? _instance;
  static QuizQuestionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuizQuestionMapper._());
      AnswerMapper.ensureInitialized();
      DifficultyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuizQuestion';

  static String _$question(QuizQuestion v) => v.question;
  static const Field<QuizQuestion, String> _f$question = Field(
    'question',
    _$question,
  );
  static List<String> _$options(QuizQuestion v) => v.options;
  static const Field<QuizQuestion, List<String>> _f$options = Field(
    'options',
    _$options,
  );
  static int _$correctIndex(QuizQuestion v) => v.correctIndex;
  static const Field<QuizQuestion, int> _f$correctIndex = Field(
    'correctIndex',
    _$correctIndex,
  );
  static bool _$isRequired(QuizQuestion v) => v.isRequired;
  static const Field<QuizQuestion, bool> _f$isRequired = Field(
    'isRequired',
    _$isRequired,
  );
  static double? _$weight(QuizQuestion v) => v.weight;
  static const Field<QuizQuestion, double> _f$weight = Field(
    'weight',
    _$weight,
    opt: true,
  );
  static Map<String, dynamic>? _$metadata(QuizQuestion v) => v.metadata;
  static const Field<QuizQuestion, Map<String, dynamic>> _f$metadata = Field(
    'metadata',
    _$metadata,
    opt: true,
  );
  static Answer? _$suggestedAnswer(QuizQuestion v) => v.suggestedAnswer;
  static const Field<QuizQuestion, Answer> _f$suggestedAnswer = Field(
    'suggestedAnswer',
    _$suggestedAnswer,
    opt: true,
  );
  static Difficulty _$difficulty(QuizQuestion v) => v.difficulty;
  static const Field<QuizQuestion, Difficulty> _f$difficulty = Field(
    'difficulty',
    _$difficulty,
    opt: true,
    def: Difficulty.medium,
  );

  @override
  final MappableFields<QuizQuestion> fields = const {
    #question: _f$question,
    #options: _f$options,
    #correctIndex: _f$correctIndex,
    #isRequired: _f$isRequired,
    #weight: _f$weight,
    #metadata: _f$metadata,
    #suggestedAnswer: _f$suggestedAnswer,
    #difficulty: _f$difficulty,
  };

  static QuizQuestion _instantiate(DecodingData data) {
    return QuizQuestion(
      data.dec(_f$question),
      data.dec(_f$options),
      data.dec(_f$correctIndex),
      isRequired: data.dec(_f$isRequired),
      weight: data.dec(_f$weight),
      metadata: data.dec(_f$metadata),
      suggestedAnswer: data.dec(_f$suggestedAnswer),
      difficulty: data.dec(_f$difficulty),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static QuizQuestion fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuizQuestion>(map);
  }

  static QuizQuestion fromJson(String json) {
    return ensureInitialized().decodeJson<QuizQuestion>(json);
  }

  static Map<String, dynamic> toJsonSchema() {
    ensureInitialized();
    return JsonSchema.objectSchema(
      properties: {
        'question': JsonSchema.string(),
        'options': JsonSchema.array(JsonSchema.string()),
        'correctIndex': JsonSchema.integer(),
        'isRequired': JsonSchema.boolean(),
        'weight': JsonSchema.number(nullable: true),
        'metadata': JsonSchema.map(JsonSchema.dynamic_(), nullable: true),
        'suggestedAnswer': JsonSchema.object(
          AnswerMapper.toJsonSchema(),
          nullable: true,
        ),
        'difficulty': JsonSchema.enumSchema(['easy', 'medium', 'hard']),
      },
      required: ['question', 'options', 'correctIndex', 'isRequired'],
    );
  }
}

mixin QuizQuestionMappable {
  String toJson() {
    return QuizQuestionMapper.ensureInitialized().encodeJson<QuizQuestion>(
      this as QuizQuestion,
    );
  }

  Map<String, dynamic> toMap() {
    return QuizQuestionMapper.ensureInitialized().encodeMap<QuizQuestion>(
      this as QuizQuestion,
    );
  }

  QuizQuestionCopyWith<QuizQuestion, QuizQuestion, QuizQuestion> get copyWith =>
      _QuizQuestionCopyWithImpl<QuizQuestion, QuizQuestion>(
        this as QuizQuestion,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return QuizQuestionMapper.ensureInitialized().stringifyValue(
      this as QuizQuestion,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuizQuestionMapper.ensureInitialized().equalsValue(
      this as QuizQuestion,
      other,
    );
  }

  @override
  int get hashCode {
    return QuizQuestionMapper.ensureInitialized().hashValue(
      this as QuizQuestion,
    );
  }

  static Map<String, dynamic> toJsonSchema() {
    return QuizQuestionMapper.toJsonSchema();
  }
}

extension QuizQuestionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuizQuestion, $Out> {
  QuizQuestionCopyWith<$R, QuizQuestion, $Out> get $asQuizQuestion =>
      $base.as((v, t, t2) => _QuizQuestionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class QuizQuestionCopyWith<$R, $In extends QuizQuestion, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get options;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get metadata;
  AnswerCopyWith<$R, Answer, Answer>? get suggestedAnswer;
  $R call({
    String? question,
    List<String>? options,
    int? correctIndex,
    bool? isRequired,
    double? weight,
    Map<String, dynamic>? metadata,
    Answer? suggestedAnswer,
    Difficulty? difficulty,
  });
  QuizQuestionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuizQuestionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuizQuestion, $Out>
    implements QuizQuestionCopyWith<$R, QuizQuestion, $Out> {
  _QuizQuestionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuizQuestion> $mapper =
      QuizQuestionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get options =>
      ListCopyWith(
        $value.options,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(options: v),
      );
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get metadata => $value.metadata != null
      ? MapCopyWith(
          $value.metadata!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(metadata: v),
        )
      : null;
  @override
  AnswerCopyWith<$R, Answer, Answer>? get suggestedAnswer =>
      $value.suggestedAnswer?.copyWith.$chain((v) => call(suggestedAnswer: v));
  @override
  $R call({
    String? question,
    List<String>? options,
    int? correctIndex,
    bool? isRequired,
    Object? weight = $none,
    Object? metadata = $none,
    Object? suggestedAnswer = $none,
    Difficulty? difficulty,
  }) => $apply(
    FieldCopyWithData({
      if (question != null) #question: question,
      if (options != null) #options: options,
      if (correctIndex != null) #correctIndex: correctIndex,
      if (isRequired != null) #isRequired: isRequired,
      if (weight != $none) #weight: weight,
      if (metadata != $none) #metadata: metadata,
      if (suggestedAnswer != $none) #suggestedAnswer: suggestedAnswer,
      if (difficulty != null) #difficulty: difficulty,
    }),
  );
  @override
  QuizQuestion $make(CopyWithData data) => QuizQuestion(
    data.get(#question, or: $value.question),
    data.get(#options, or: $value.options),
    data.get(#correctIndex, or: $value.correctIndex),
    isRequired: data.get(#isRequired, or: $value.isRequired),
    weight: data.get(#weight, or: $value.weight),
    metadata: data.get(#metadata, or: $value.metadata),
    suggestedAnswer: data.get(#suggestedAnswer, or: $value.suggestedAnswer),
    difficulty: data.get(#difficulty, or: $value.difficulty),
  );

  @override
  QuizQuestionCopyWith<$R2, QuizQuestion, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuizQuestionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

