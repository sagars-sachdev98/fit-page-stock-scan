import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/data/models/variable.model.dart';
import 'package:fitpage_stock_scan_task/data/repositories/stock_scan.repository.dart';
import 'package:fitpage_stock_scan_task/data/repositories/stock_scan_impl.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockScanViewModelProvider = Provider(
    (ref) => StockScanViewModel(ref.read(stockScanRepositoryProvider)));

class StockScanViewModel {
  StockScanViewModel(this._repository);

  final StockScanRepository _repository;

  Future<List<StockScanModel>?> fetchScans() async {
    List<StockScanModel>? scans = await _repository.getScans();
    List<StockScanModel>? scanFlatlist = scans?.map((scan) {
      Map<String, VariableModel> variables = {};

      scan.criteria?.forEach((e) => variables.addAll(e.variables??{}));
      return scan.copyWith(variables: variables);
    }).toList();
    return scanFlatlist;
  }
}
