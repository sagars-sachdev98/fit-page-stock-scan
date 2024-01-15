import 'package:fitpage_stock_scan_task/data/models/criteria.model.dart';
import 'package:fitpage_stock_scan_task/data/models/variable.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'stock_scan.model.freezed.dart';
part 'stock_scan.model.g.dart';

@freezed
class StockScanModel with _$StockScanModel {
  factory StockScanModel({
    int? id,
    String? name,
    String? tag,
    String? color,
    List<CriteriaModel>? criteria,
    Map<String, VariableModel>? variables,
  }) = _StockScanModel;

  factory StockScanModel.fromJson(Map<String, dynamic> json) =>
      _$StockScanModelFromJson(json);
      
}
