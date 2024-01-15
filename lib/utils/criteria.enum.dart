import 'package:freezed_annotation/freezed_annotation.dart';

enum CriteriaType {
  @JsonValue('variable')
  variable,
  @JsonValue('plain_text')
  plainText,
}
