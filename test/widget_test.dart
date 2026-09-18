import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cricket/main.dart';

void main() {
  testWidgets('Mini Cricket App UI and interaction test', (WidgetTester tester) async {

    await tester.pumpWidget(const MiniCricketApp());


    expect(find.text('Mini Cricket'), findsOneWidget); // AppBar title
    expect(find.text('Runs'), findsOneWidget);
    expect(find.text('Balls'), findsOneWidget);
    expect(find.text('6'), findsOneWidget); // Initial ball count
    expect(find.text('Bat'), findsOneWidget); // Bat button


    await tester.tap(find.text('Bat'));


    await tester.pump();


    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsNothing);
  });
}