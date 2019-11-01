import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';

main() {
  group('Testing fetchWeatherForecast', () {
    test('Weather Forecast Response on Success', () async {
      final _weatherService = WeatherService();
      _weatherService.client = MockClient((request) async {
        final jsonData = {'title' : 'pune'};
        return http.Response(json.encode(jsonData), 200);
      });
      final _data = await _weatherService.fetchWeatherForecast();
      WeatherResponse response = _data;
      expect(response.sunSetRiseInfo.title, 'pune');
    });

    test('Weather Forecast Response on Error', () async {
      final _weatherService = WeatherService();
      _weatherService.client = MockClient((request) async {
        final jsonData = '';
        return http.Response(json.encode(jsonData), 404);
      });
      try {
        await _weatherService.fetchWeatherForecast();
      } catch(e) {
        expect(e.toString(), 'Server Error: Error occured while Communication with Server with StatusCode : 404');
      }
    });
  });
}

