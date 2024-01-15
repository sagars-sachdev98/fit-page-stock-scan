import 'package:fitpage_stock_scan_task/data/models/stock_scan.model.dart';
import 'package:fitpage_stock_scan_task/ui/views/stock_scan_details.view.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/my_seprator.dart';
import 'package:fitpage_stock_scan_task/utils/utils.dart';
import 'package:flutter/material.dart';

class StockScanListItem extends StatelessWidget {
  final StockScanModel? stockScanModel;
  const StockScanListItem({
    super.key,
    this.stockScanModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return StockScanDetailsPage(
                    stockScanModel: stockScanModel,
                    title: StockScanInfoWidget(
                      color: stockScanModel?.color,
                      name: stockScanModel?.name,
                      tag: stockScanModel?.tag,
                      showUnderline: false,
                    ),
                  );
                },
              ),
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: StockScanInfoWidget(
              color: stockScanModel?.color,
              name: stockScanModel?.name,
              tag: stockScanModel?.tag,
            ),
          ),
        ),
        const MySeparator(
          dashWidth: 1.2,
        )
      ],
    );
  }
}

class StockScanInfoWidget extends StatelessWidget {
  final String? name;
  final String? tag;
  final String? color;
  final bool showUnderline;

  const StockScanInfoWidget(
      {Key? key, this.name, this.tag, this.color, this.showUnderline = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? '',
            style: TextStyle(
              decoration: showUnderline ? TextDecoration.underline : null,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            tag ?? '',
            style: TextStyle(
                color: Utils.stringToColor(color),
                decoration: showUnderline ? TextDecoration.underline : null,
                decorationColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
