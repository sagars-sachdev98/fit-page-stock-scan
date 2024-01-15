import 'package:fitpage_stock_scan_task/data/models/criteria.model.dart';
import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/variable_widget.dart';
import 'package:flutter/material.dart';

class VariableRichText extends StatelessWidget {
  final CriteriaModel criteriaModel;
  final StockScanModel stockScanModel;
  const VariableRichText(
      {Key? key, required this.criteriaModel, required this.stockScanModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStrings =
        criteriaModel.text!.split(RegExp(r'(?<=\$[0-9])|(?=\$[0-9])'));

    final spans = textStrings.map(
      (text) => text.startsWith('\$')
          ? WidgetSpan(
              child: VariableWidget(
              variable: text,
              stockScanModel: stockScanModel,
            ))
          : TextSpan(text: text),
    );

    return RichText(
      text: TextSpan(children: spans.toList()),
    );
  }
}