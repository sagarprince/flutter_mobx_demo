import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/services/shared_service.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';

part 'weather.g.dart';

class WeatherStore = _WeatherBaseStore with _$WeatherStore;

abstract class _WeatherBaseStore with Store {
  final WeatherService _weatherService;
  final SharedService _sharedService;

  _WeatherBaseStore(this._weatherService, this._sharedService);

  @observable
  double lat = 0;

  @observable
  double lng = 0;

  @observable
  String place = '';

  @observable
  Forecast currentForecast;

  @observable
  List<Forecast> dailyForecast = [];

  @observable
  List<Forecast> hourlyForecast = [];

  @observable
  bool isLoading = false;

  @observable
  bool isHourlyForecastLoading = false;

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
  Future<void> getCurrentLocation() {
    final Completer<void> completer = Completer<void>();
    isLoading = true;
    isError = false;
    _sharedService.getCurrentLocation().then((Position pos) {
      lat = pos.latitude;
      lng = pos.longitude;
    }).catchError((e) {
      isError = true;
      print(e);
    }).whenComplete(() {
      completer.complete(true);
    });
    return completer.future;
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
  Future<void> fetchDayHourlyForecast(int timestamp) {
    final Completer<void> completer = Completer<void>();
    isHourlyForecastLoading = true;
    isError = false;
    _weatherService.fetchDayHourlyForecast(timestamp).then((WeatherResponse response) {
      hourlyForecast = response.hourlyForecast;
    }).catchError((_error) {
      print(_error);
      hourlyForecast = [];
      isError = true;
      error = _error.toString();
    }).whenComplete(() {
      isHourlyForecastLoading = false;
      completer.complete(true);
    });
    return completer.future;
  }

  @action
  void toggleDayInfoPanel(bool isOpened) {
    isDayInfoPanelOpened = isOpened;
  }
}