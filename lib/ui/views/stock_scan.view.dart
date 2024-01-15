import 'package:fitpage_stock_scan_task/ui/viewmodels/stock_scan.viewmodel.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/stock_scan_list_item_widget.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockScanViewFutureProvider = FutureProvider.family(
  (ref, WidgetRef _ref) async =>
      ref.watch(stockScanViewModelProvider).fetchScans(),
);

class StockScanPage extends StatelessWidget {
  const StockScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final stockScan = ref.watch(stockScanViewFutureProvider(ref));
      return BaseView(
        child: stockScan.when(
          data: (data) => ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (context, index) {
              final stockScanModel = data![index];
              return StockScanListItem(stockScanModel: stockScanModel);
            },
          ),
          error: (error, stackTrace) => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }
}
