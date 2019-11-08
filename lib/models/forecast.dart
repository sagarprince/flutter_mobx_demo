class Forecast {
  int time;
  String summary;
  String icon;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  String precipType;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  int windBearing;
  double cloudCover;
  int uvIndex;
  int uvIndexTime;
  int visibility;
  double ozone;
  double temperature;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  Forecast({
    this.time,
    this.summary,
    this.icon,
    this.sunriseTime,
    this.sunsetTime,
    this.moonPhase,
    this.precipIntensity,
    this.precipIntensityMax,
    this.precipIntensityMaxTime,
    this.precipProbability,
    this.precipType,
    this.temperatureHigh,
    this.temperatureHighTime,
    this.temperatureLow,
    this.temperatureLowTime,
    this.apparentTemperatureHigh,
    this.apparentTemperatureHighTime,
    this.apparentTemperatureLow,
    this.apparentTemperatureLowTime,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windGustTime,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.uvIndexTime,
    this.visibility,
    this.ozone,
    this.temperature,
    this.temperatureMin,
    this.temperatureMinTime,
    this.temperatureMax,
    this.temperatureMaxTime,
    this.apparentTemperatureMin,
    this.apparentTemperatureMinTime,
    this.apparentTemperatureMax,
    this.apparentTemperatureMaxTime,
  });

  factory Forecast.fromMap(Map<String, dynamic> data) => Forecast(
    time: data["time"] == null ? null : (data["time"].toInt()) * 1000,
    summary: data["summary"] == null ? null : data["summary"],
    icon: data["icon"] == null ? null : "https://darksky.net/images/weather-icons/" + data["icon"] + ".png",
    sunriseTime: data["sunriseTime"] == null ? null : data["sunriseTime"],
    sunsetTime: data["sunsetTime"] == null ? null : data["sunsetTime"],
    moonPhase: data["moonPhase"] == null ? null : data["moonPhase"].toDouble(),
    precipIntensity: data["precipIntensity"] == null ? null : data["precipIntensity"].toDouble(),
    precipIntensityMax: data["precipIntensityMax"] == null ? null : data["precipIntensityMax"].toDouble(),
    precipIntensityMaxTime: data["precipIntensityMaxTime"] == null ? null : data["precipIntensityMaxTime"],
    precipProbability: data["precipProbability"] == null ? null : data["precipProbability"].toDouble(),
    precipType: data["precipType"] == null ? null : data["precipType"],
    temperature: data["temperature"] == null ? null : data["temperature"].toDouble(),
    temperatureHigh: data["temperatureHigh"] == null ? null : data["temperatureHigh"].toDouble(),
    temperatureHighTime: data["temperatureHighTime"] == null ? null : data["temperatureHighTime"],
    temperatureLow: data["temperatureLow"] == null ? null : data["temperatureLow"].toDouble(),
    temperatureLowTime: data["temperatureLowTime"] == null ? null : data["temperatureLowTime"],
    apparentTemperatureHigh: data["apparentTemperatureHigh"] == null ? null : data["apparentTemperatureHigh"],
    apparentTemperatureHighTime: data["apparentTemperatureHighTime"] == null ? null : data["apparentTemperatureHighTime"],
    apparentTemperatureLow: data["apparentTemperatureLow"] == null ? null : data["apparentTemperatureLow"].toDouble(),
    apparentTemperatureLowTime: data["apparentTemperatureLowTime"] == null ? null : data["apparentTemperatureLowTime"],
    dewPoint: data["dewPoint"] == null ? null : data["dewPoint"].toDouble(),
    humidity: data["humidity"] == null ? null : data["humidity"].toDouble(),
    pressure: data["pressure"] == null ? null : data["pressure"].toDouble(),
    windSpeed: data["windSpeed"] == null ? null : data["windSpeed"].toDouble(),
    windGust: data["windGust"] == null ? null : data["windGust"].toDouble(),
    windGustTime: data["windGustTime"] == null ? null : data["windGustTime"],
    windBearing: data["windBearing"] == null ? null : data["windBearing"],
    cloudCover: data["cloudCover"] == null ? null : data["cloudCover"].toDouble(),
    uvIndex: data["uvIndex"] == null ? null : data["uvIndex"],
    uvIndexTime: data["uvIndexTime"] == null ? null : data["uvIndexTime"],
    visibility: data["visibility"] == null ? null : data["visibility"].toInt(),
    ozone: data["ozone"] == null ? null : data["ozone"].toDouble(),
    temperatureMin: data["temperatureMin"] == null ? null : data["temperatureMin"].toDouble(),
    temperatureMinTime: data["temperatureMinTime"] == null ? null : data["temperatureMinTime"],
    temperatureMax: data["temperatureMax"] == null ? null : data["temperatureMax"].toDouble(),
    temperatureMaxTime: data["temperatureMaxTime"] == null ? null : data["temperatureMaxTime"],
    apparentTemperatureMin: data["apparentTemperatureMin"] == null ? null : data["apparentTemperatureMin"].toDouble(),
    apparentTemperatureMinTime: data["apparentTemperatureMinTime"] == null ? null : data["apparentTemperatureMinTime"],
    apparentTemperatureMax: data["apparentTemperatureMax"] == null ? null : data["apparentTemperatureMax"],
    apparentTemperatureMaxTime: data["apparentTemperatureMaxTime"] == null ? null : data["apparentTemperatureMaxTime"],
  );

  @override
  String toString() => 'Forecast{'
      'time: $time, '
      'summary: $summary, '
      'icon: $icon, '
  '}';
}