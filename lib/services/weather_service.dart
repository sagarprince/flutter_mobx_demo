import 'package:http/http.dart' show Client;
import 'package:flutter_mobx_demo/utilities/api_base_helper.dart';
import 'package:flutter_mobx_demo/models/index.dart';

class WeatherService {
  static final WeatherService _weatherService = new WeatherService._internal();

  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Client client = Client();

  factory WeatherService() {
    return _weatherService;
  }

  WeatherService._internal();

  Future<WeatherResponse> fetchWeatherForecast([List<double> latLng = const [18.5204, 73.8567]]) async {
    var parseResponse = await _apiBaseHelper.get(client, '/' + latLng.join(',') + '?units=si&exclude=hourly');
    return WeatherResponse.fromJson(parseResponse);
  }
}