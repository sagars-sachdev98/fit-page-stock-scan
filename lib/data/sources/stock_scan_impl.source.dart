import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/data/sources/stock_scan.source.dart';
import 'package:fitpage_stock_scan_task/utils/api_constants.dart';
import 'package:fitpage_stock_scan_task/utils/dio_rest_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockScanDataSourceProvider =
    Provider<StockScanDataSource>((ref) => StockScanDataSourceImpl());

class StockScanDataSourceImpl implements StockScanDataSource {
  @override
  Future<List<StockScanModel>?> getScans() async {
    final List<Map<String, dynamic>> apiResponse =
        await ApiRestHelper.getDataList(
      endPoint: ApiConstants.stockScansEndpoint,
    );

    return apiResponse.map((e) => StockScanModel.fromJson(e)).toList();
  }
}
