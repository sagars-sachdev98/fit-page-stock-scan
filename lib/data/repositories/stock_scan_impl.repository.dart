import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/data/repositories/stock_scan.repository.dart';
import 'package:fitpage_stock_scan_task/data/sources/stock_scan.source.dart';
import 'package:fitpage_stock_scan_task/data/sources/stock_scan_impl.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockScanRepositoryProvider = Provider<StockScanRepository>((ref) =>
    StockScanRepositoryImpl(dataSource: ref.read(stockScanDataSourceProvider)));

class StockScanRepositoryImpl implements StockScanRepository {
  StockScanRepositoryImpl({required StockScanDataSource dataSource})
      : _dataSource = dataSource;

  final StockScanDataSource _dataSource;

  @override
  Future<List<StockScanModel>?> getScans() {
    return _dataSource.getScans();
  }
}
