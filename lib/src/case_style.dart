final splitter = RegExp(r'[ ./_\-\\]+|(?<=[a-z])(?=[A-Z])');
final customCase = RegExp(r'^custom\(([luc][luc]?)?,(.?)\)$');

/// Transforms a [String] to the given [CaseStyle]
String toCaseStyle(String text, CaseStyle? style) {
  if (style == null) return text;
  var words = text.split(splitter);
  if (style.head != null) {
    words = [
      words[0].transform(style.head),
      ...words.skip(1).map((w) => w.transform(style.tail))
    ];
  } else if (style.tail != null) {
    words = words.map((w) => w.transform(style.tail)).toList();
  }
  return words.join(style.separator);
}

/// Used to transform fields to a specific case style
class CaseStyle {
  const CaseStyle({this.head, this.tail, this.separator = ''});

  /// Transforms the first word of a field name
  final TextTransform? head;

  /// Transforms all words but the first - or all words if [head] is null - of a field name
  final TextTransform? tail;

  /// The separator used between each word of a field name
  /// Can be an empty [String]
  final String separator;

  /// Transforms a [String] to a [CaseStyle]
  static CaseStyle? fromString(String? value) {
    if (value == null || value == none || value == unmodified) {
      return null;
    } else {
      switch (value) {
        case 'camelCase':
          return camelCase;
        case 'pascalCase':
          return pascalCase;
        case 'snakeCase':
          return snakeCase;
        case 'paramCase':
          return paramCase;
        case 'lowerCase':
          return lowerCase;
        case 'upperCase':
          return upperCase;
      }
      if (value.startsWith('custom')) {
        var match = customCase.firstMatch(value);
        if (match == null || match.groupCount != 2) {
          throw FormatException(
              "Cannot parse custom caseStyle expression '$value'");
        }

        TextTransform? head, tail;
        String separator;

        var transforms = match.group(1)!;
        if (transforms.length == 1) {
          tail = parseTransform(transforms);
        } else if (transforms.length == 2) {
          head = parseTransform(transforms[0]);
          tail = parseTransform(transforms[1]);
        }

        separator = match.group(2)!;

        return CaseStyle(head: head, tail: tail, separator: separator);
      }
    }
  }

  /// No [CaseStyle] will be applied
  static const none = 'none';

  /// Alias of [CaseStyle.none]
  static const unmodified = 'unmodified';

  /// Transforms to 'fieldName'
  static const camelCase =
      CaseStyle(head: TextTransform.lowerCase, tail: TextTransform.capitalCase);

  /// Transforms to 'FieldName'
  static const pascalCase = CaseStyle(tail: TextTransform.capitalCase);

  /// Transforms to 'field_name'
  static const snakeCase =
      CaseStyle(tail: TextTransform.lowerCase, separator: '_');

  /// Transforms to 'field-name'
  static const paramCase =
      CaseStyle(tail: TextTransform.lowerCase, separator: '-');

  /// Transforms to 'fieldname'
  static const lowerCase = CaseStyle(tail: TextTransform.lowerCase);

  /// Transforms to 'FIELDNAME'
  static const upperCase = CaseStyle(tail: TextTransform.upperCase);
}

/// Text transformation applied to a single word
enum TextTransform { upperCase, lowerCase, capitalCase }

TextTransform? parseTransform(String value) {
  switch (value) {
    case 'l':
      return TextTransform.lowerCase;
    case 'u':
      return TextTransform.upperCase;
    case 'c':
      return TextTransform.capitalCase;
    default:
      return null;
  }
}

String tranToString(TextTransform tr) {
  switch (tr) {
    case TextTransform.lowerCase:
      return 'lower';
    case TextTransform.upperCase:
      return 'upper';
    case TextTransform.capitalCase:
      return 'capital';
  }
}

extension on String {
  String transform(TextTransform? t) {
    if (t == TextTransform.upperCase) {
      return toUpperCase();
    } else if (t == TextTransform.lowerCase) {
      return toLowerCase();
    } else if (t == TextTransform.capitalCase) {
      return this[0].toUpperCase() + substring(1).toLowerCase();
    } else {
      return this;
    }
  }
}
