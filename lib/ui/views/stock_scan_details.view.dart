import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/stock_scan_parser_details_widget.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';

class StockScanDetailsPage extends StatelessWidget {
  final StockScanModel? stockScanModel;
  final Widget? title;
  const StockScanDetailsPage({
    super.key,
    this.stockScanModel,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: title,
      child: ListView.builder(
        itemCount: stockScanModel!.criteria?.length ?? 0,
        itemBuilder: (context, index) {
          final criteriaModel = stockScanModel!.criteria![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CriteriaWidgetParser(
                criteriaModel: criteriaModel,
                stockScanModel: stockScanModel!,
              ),
              if (index < stockScanModel!.criteria!.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "and",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
