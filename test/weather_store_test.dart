import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

void main() {
  WeatherStore _weatherStore;
  WeatherService _weatherService;

  setUp(() {
    _weatherService = WeatherService();
    _weatherStore = WeatherStore(_weatherService);
  });

  group('Weather Store', () {
    test('isLoading equals to false', () {
      expect(_weatherStore.isLoading, false);
    });
    test('fetchWeatherForecast', () async {
      await _weatherStore.fetchWeatherForecast();
      print(_weatherStore.consolidatedWeathers.length);
      expect(_weatherStore.consolidatedWeathers.length, greaterThan(0));
      expect(_weatherStore.sunSetRiseInfo, isNotNull);
      expect(_weatherStore.isLoading, false);
    });
  });
}