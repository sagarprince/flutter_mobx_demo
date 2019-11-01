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
            info: ConsolidatedWeather(
              id: 1,
              weatherStateName: 'Heavy Rain',
              weatherStateAbbr: 'hr',
              humidity: 78,
              theTemp: 30,
              applicableDate: '2019-11-02',
              minTemp: 28,
              maxTemp: 32
            ),
          ),
        )
    );

    expect(find.text('Heavy Rain'), findsOneWidget);
    expect(find.text('Heavy Clouds'), findsNothing);
    expect(find.text('Saturday'), findsOneWidget);
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
            info: ConsolidatedWeather(
                id: 1,
                weatherStateName: 'Heavy Rain',
                weatherStateAbbr: 'hr',
                humidity: 78,
                theTemp: 26,
                applicableDate: '2019-11-04',
                minTemp: 28,
                maxTemp: 30
            ),
          ),
        )
    );

    expect(find.text('Heavy Clouds'), findsNothing);
    expect(find.text('Monday'), findsOneWidget);
    expect(find.text('26°'), findsOneWidget);
    expect(find.text('28°'), findsOneWidget);
    expect(find.text('30°'), findsOneWidget);
  });
}
