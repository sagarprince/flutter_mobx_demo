import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';

part 'weather.g.dart';

class WeatherStore = _WeatherBaseStore with _$WeatherStore;

abstract class _WeatherBaseStore with Store {

  _WeatherBaseStore(this._weatherService);

  final WeatherService _weatherService;

  @observable
  Forecast currentForecast;

  @observable
  List<Forecast> dailyForecast = [];

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String error = '';

  @observable
  bool isDayInfoPanelOpened = false;

  @computed
  bool get hasData => dailyForecast.length > 0;

  @computed
  List<Forecast> get nextSevenDaysForecast {
    List<Forecast> list = [];
    if (dailyForecast.length > 0) {
      for(int i = 1; i <= 7; i++) {
        list.add(dailyForecast[i]);
      }
    }
    return list;
  }

  @action
  Future<void> fetchWeatherForecast() {
    final Completer<void> completer = Completer<void>();
    isLoading = true;
    isError = false;
    _weatherService.fetchWeatherForecast().then((WeatherResponse response) {
      currentForecast = response.currentForecast;
      dailyForecast = response.dailyForecast;
    }).catchError((_error) {
      print(_error);
      currentForecast = null;
      dailyForecast = [];
      isError = true;
      error = _error.toString();
    }).whenComplete(() {
      isLoading = false;
      completer.complete(true);
    });
    return completer.future;
  }

  @action
  void toggleDayInfoPanel(bool isOpened) {
    isDayInfoPanelOpened = isOpened;
  }
}