import 'package:fitpage_stock_scan_task/data/models/variable.model.dart';
import 'package:fitpage_stock_scan_task/utils/criteria.enum.dart';
import 'package:json_annotation/json_annotation.dart';


part 'criteria.model.g.dart';

@JsonSerializable()
class CriteriaModel {
  CriteriaType? type;
  String? text;
  Map<String, VariableModel>? variables;

  CriteriaModel({
    this.type,
    this.text,
    this.variables,
  });

  factory CriteriaModel.fromJson(Map<String, dynamic> json) {
    // Deserialize using the generated _$CriteriaModelFromJson function
    CriteriaModel criteriaModel = _$CriteriaModelFromJson(json);

    // Check if the "variable" key exists in the JSON map
    if (json.containsKey("variable")) {
      // Use map to convert the entries directly into VariableModel instances
      Map<String, VariableModel> variables = (json["variable"] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, VariableModel.fromJson(value)));

      // Assign the variables to the criteriaModel instance
      criteriaModel.variables = variables;

      // Return the updated criteriaModel
      return criteriaModel;
    } else {
      // Return the original criteriaModel if "variable" key is not present
      return criteriaModel;
    }
  }

  // Method to convert the CriteriaModel instance to JSON
  Map<String, dynamic> toJson() => _$CriteriaModelToJson(this);
}
