import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';

abstract class StockScanDataSource {
  Future<List<StockScanModel>?> getScans();
}
