import 'package:flutter_mobx_demo/models/forecast.dart';

class WeatherResponse {
  double latitude;
  double longitude;
  Forecast currentForecast;
  List<Forecast> hourlyForecast;
  List<Forecast> dailyForecast;

  WeatherResponse({this.latitude, this.longitude, this.currentForecast, this.hourlyForecast, this.dailyForecast});

  factory WeatherResponse.fromJson(Map<String, dynamic> data) {
    dynamic hourly = data["hourly"] != null ? data["hourly"]["data"] : null;
    dynamic daily = data["daily"] != null ? data["daily"]["data"] : null;
    return WeatherResponse(
      latitude: data["latitude"] != null ? data["latitude"] : null,
      longitude: data["longitude"] != null ? data["longitude"] : null,
      currentForecast: data["currently"] != null ? Forecast.fromMap(data["currently"]) : null,
      hourlyForecast: hourly == null ? [] : List<Forecast>.from(hourly.map((x) => Forecast.fromMap(x))),
      dailyForecast: daily == null ? [] : List<Forecast>.from(daily.map((x) => Forecast.fromMap(x)))
    );
  }

  @override
  String toString() => 'WeatherResponse{'
      'currentForecast: $currentForecast, '
      'hourlyForecast: $hourlyForecast, '
      'dailyForecast: $dailyForecast, '
  '}';
}