import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/ui/views/variable_details.view.dart';
import 'package:fitpage_stock_scan_task/utils/utils.dart';
import 'package:fitpage_stock_scan_task/utils/variable.enum.dart';
import 'package:flutter/material.dart';

class VariableWidget extends StatelessWidget {
  final String variable;
  final StockScanModel stockScanModel;
  const VariableWidget(
      {Key? key, required this.variable, required this.stockScanModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final variableModel = stockScanModel.variables?[variable];

    return GestureDetector(
      onTap: () {
        if (variableModel != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  VariableDetailsPage(variableModel: variableModel),
            ),
          );
        }
      },
      child: Text(
        (() {
          switch (variableModel?.type) {
            case VariableType.value:
              return '(${Utils.trimDouble(variableModel?.values?.first)})';
            case VariableType.indicator:
              return '(${variableModel?.defaultValue})';
            default:
              return '';
          }
        })(),
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
