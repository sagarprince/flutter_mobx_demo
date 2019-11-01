import 'package:flutter_mobx_demo/utilities/api_base_helper.dart';
import 'package:flutter_mobx_demo/models/index.dart';

class WeatherService {
  static final WeatherService _weatherService = new WeatherService._internal();

  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  factory WeatherService() {
    return _weatherService;
  }

  WeatherService._internal();

  Future<WeatherResponse> fetchWeatherForecast() async {
    var parseResponse = await _apiBaseHelper.get('location/2295412/');
    return WeatherResponse.fromJson(parseResponse);
  }

}