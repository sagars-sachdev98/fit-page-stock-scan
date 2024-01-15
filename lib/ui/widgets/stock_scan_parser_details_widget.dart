import 'package:fitpage_stock_scan_task/data/models/criteria.model.dart';
import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/plain_text_widget.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/variable_rich_text_widget.dart';
import 'package:fitpage_stock_scan_task/utils/criteria.enum.dart';
import 'package:flutter/material.dart';

class CriteriaWidgetParser extends StatelessWidget {
  final CriteriaModel criteriaModel;
  final StockScanModel stockScanModel;

  const CriteriaWidgetParser({
    Key? key,
    required this.criteriaModel,
    required this.stockScanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (criteriaModel.type) {
      case CriteriaType.variable:
        return VariableRichText(
          criteriaModel: criteriaModel,
          stockScanModel: stockScanModel,
        );
      case CriteriaType.plainText:
        return PlainTextWidget(
          text: criteriaModel.text!,
        );
      default:
        return Container();
    }
  }
}
