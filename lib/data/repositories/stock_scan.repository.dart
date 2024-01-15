import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';

abstract class StockScanRepository {
  Future<List<StockScanModel>?> getScans();
}
