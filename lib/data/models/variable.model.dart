import 'package:fitpage_stock_scan_task/utils/variable.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variable.model.freezed.dart';
part 'variable.model.g.dart';

@freezed
class VariableModel with _$VariableModel {
  factory VariableModel({
    VariableType? type,
    List<double>? values,
    @JsonKey(name: 'study_type') String? studyType,
    @JsonKey(name: 'parameter_name') String? parameterName,
    @JsonKey(name: 'min_value') int? minValue,
    @JsonKey(name: 'max_value') int? maxValue,
    @JsonKey(name: 'default_value') int? defaultValue,
  }) = _VariableModel;

  factory VariableModel.fromJson(Map<String, dynamic> json) =>
      _$VariableModelFromJson(json);
}
