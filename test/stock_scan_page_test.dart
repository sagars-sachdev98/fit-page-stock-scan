import 'package:fitpage_stock_scan_task/data/sources/stock_scan_impl.source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitpage_stock_scan_task/data/sources/mock_stock_scan_impl.source.dart';
import 'package:fitpage_stock_scan_task/ui/views/stock_scan.view.dart';
import 'package:fitpage_stock_scan_task/ui/widgets/stock_scan_list_item_widget.dart';

void main() {
  group('StockScanPage Tests', () {
    testWidgets('Renders StockScanPage with loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            overrides: [
              stockScanDataSourceProvider.overrideWith(
                  (ref) => ref.read(mockStockScanDataSourceProvider)),
            ],
            child: const StockScanPage(),
          ),
        ),
      );

      // Check if loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders StockScanPage with data state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            overrides: [
              stockScanDataSourceProvider.overrideWith(
                  (ref) => ref.read(mockStockScanDataSourceProvider)),
            ],
            child: const StockScanPage(),
          ),
        ),
      );
      // Wait for the API call to complete (simulate a 5-second delay)
      await tester.pump(const Duration(seconds: 5));

      // Check if StockScanListItem is displayed
      expect(find.byType(StockScanListItem), findsWidgets);
    });
  });
}
