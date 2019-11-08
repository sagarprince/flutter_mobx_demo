// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobx_demo/pages/home.dart';
import 'package:flutter_mobx_demo/widgets/weather_info_card.dart';
import 'package:flutter_mobx_demo/models/index.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      )
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Today Weather Info Card Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        MaterialApp(
          home: WeatherInfoCard(
            info: Forecast(
              summary: 'Partly Cloudy',
              icon: 'partly-cloudy-night',
              humidity: 78,
              temperature: 30,
              time: 1573669800,
              temperatureMin: 28,
              temperatureMax: 32
            ),
          ),
        )
    );

    expect(find.text('Partly Cloudy'), findsOneWidget);
    expect(find.text('Heavy Clouds'), findsNothing);
    expect(find.text('Wednesday'), findsOneWidget);
    expect(find.text('30°'), findsOneWidget);
    expect(find.text('32°'), findsNothing);
    expect(find.text('78°'), findsOneWidget);
  });

  testWidgets('Other Weather Info Card Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        MaterialApp(
          home: WeatherInfoCard(
            type: CardType.Other,
            info: Forecast(
                summary: 'Clear throughout the day.',
                icon: 'clear-day',
                humidity: 78,
                temperature: 30,
                time: 1573131249,
                temperatureMin: 28,
                temperatureMax: 32
            ),
          ),
        )
    );

    expect(find.text('Clear throughout the day'), findsNothing);
    expect(find.text('Thursday'), findsOneWidget);
    expect(find.text('26°'), findsOneWidget);
    expect(find.text('28°'), findsOneWidget);
    expect(find.text('30°'), findsOneWidget);
  });
}
