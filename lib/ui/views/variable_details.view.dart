import 'package:fitpage_stock_scan_task/data/models/variable.model.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/my_seprator.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/base_view.dart';
import 'package:fitpage_stock_scan_task/utils/utils.dart';
import 'package:fitpage_stock_scan_task/utils/variable.enum.dart';
import 'package:flutter/material.dart';

class VariableDetailsPage extends StatelessWidget {
  final VariableModel? variableModel;
  const VariableDetailsPage({super.key, this.variableModel});

  @override
  Widget build(BuildContext context) {
    List<double> values = [
      ...variableModel?.values ?? []
    ]; // Create a copy of the list

    values = customSort(values);
    return BaseView(
      title: variableModel?.type == VariableType.indicator
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(variableModel?.studyType?.toUpperCase() ?? ''),
                const SizedBox(
                  height: 6,
                ),
                const Text("Set Parameters")
              ],
            )
          : null,
      appBarBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Builder(
        builder: (context) {
          if (variableModel?.type == VariableType.value) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: values
                    .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(Utils.trimDouble(e)),
                            ),
                            const MySeparator(
                              dashWidth: 1.2,
                            )
                          ],
                        ))
                    .toList(),
              ),
            );
          } else if (variableModel?.type == VariableType.indicator) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 80, left: 12, right: 12),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      Utils.capitalize(variableModel?.parameterName ?? ''),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(4),
                          border: OutlineInputBorder(),
                        ),
                        controller: TextEditingController(
                            text: variableModel?.defaultValue.toString())),
                  )
                ]),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  List<double> customSort(List<double> values) {
    values.sort();

    if (values.isNotEmpty && values.any((element) => element < 0)) {
      // If the list contains negative values, sort in reverse order
      values = values.reversed.toList();
    }

    return values;
  }
}
