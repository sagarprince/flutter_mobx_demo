import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';

part 'weather.g.dart';

class WeatherStore = _WeatherBaseStore with _$WeatherStore;

abstract class _WeatherBaseStore with Store {

  _WeatherBaseStore(this._weatherService);

  final WeatherService _weatherService;

  @observable
  SunSetRiseInfo sunSetRiseInfo;

  @observable
  List<ConsolidatedWeather> consolidatedWeathers = [];

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String error = '';

  @computed
  bool get hasData => !isLoading && consolidatedWeathers.length > 0;

  @computed
  ConsolidatedWeather get todayForecast => consolidatedWeathers.length > 0 ? consolidatedWeathers[0] : null;

  @computed
  List<ConsolidatedWeather> get nextFiveDaysForecast {
    List<ConsolidatedWeather> list = [];
    if (consolidatedWeathers.length > 0) {
      int i = 1;
      for(i = 1; i <= 5; i++) {
        list.add(consolidatedWeathers[i]);
      }
    }
    return list;
  }

  @action
  void fetchWeatherForecast() {
    isLoading = true;
    _weatherService.fetchWeatherForecast().then((WeatherResponse response) {
      sunSetRiseInfo = response.sunSetRiseInfo;
      consolidatedWeathers = response.consolidatedWeathers;
    }).catchError((_error) {
      error = _error.toString();
    }).whenComplete(() {
      isLoading = false;
    });
  }
}