import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:inter_intel_interview_test/widgets/expansion_tile_card.dart';
// replace with the actual path to your widget file

void main() {
  testWidgets('TileCard Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TileCard(
          child: Text('Test Child'),
        ),
      ),
    ));

    // Verify that the widget is rendered.
    expect(find.byType(TileCard), findsOneWidget);

    // Verify that the child widget is rendered.
    expect(find.text('Test Child'), findsOneWidget);
  });
}
