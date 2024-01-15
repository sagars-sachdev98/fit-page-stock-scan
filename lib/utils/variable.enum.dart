import 'package:freezed_annotation/freezed_annotation.dart';

enum VariableType {
  @JsonValue('value')
  value,
  @JsonValue('indicator')
  indicator,
}
