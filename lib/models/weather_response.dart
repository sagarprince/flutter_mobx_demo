import 'package:flutter_mobx_demo/models/consolidated_weather.dart';
import 'package:flutter_mobx_demo/models/sunsetrise_info.dart';

class WeatherResponse {
  List<ConsolidatedWeather> consolidatedWeathers;
  SunSetRiseInfo sunSetRiseInfo;

  WeatherResponse(
      {this.consolidatedWeathers,
        this.sunSetRiseInfo});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    if (json['consolidated_weather'] != null) {
      consolidatedWeathers = new List<ConsolidatedWeather>();
      json['consolidated_weather'].forEach((v) {
        consolidatedWeathers.add(new ConsolidatedWeather.fromJson(v));
      });
    }
    this.sunSetRiseInfo = SunSetRiseInfo.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consolidatedWeathers != null) {
      data['consolidated_weather'] =
          this.consolidatedWeathers.map((v) => v.toJson()).toList();
    }
    data['time'] = this.sunSetRiseInfo.time;
    data['sun_rise'] = this.sunSetRiseInfo.sunRise;
    data['sun_set'] = this.sunSetRiseInfo.sunSet;
    data['title'] = this.sunSetRiseInfo.title;
    data['latt_long'] = this.sunSetRiseInfo.latLong;
    return data;
  }
}