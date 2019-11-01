class SunSetRiseInfo {
  String time;
  String sunRise;
  String sunSet;
  String title;
  String latLong;

  SunSetRiseInfo(
      {this.time, this.sunRise, this.sunSet, this.title, this.latLong});

  SunSetRiseInfo.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    sunRise = json['sun_rise'];
    sunSet = json['sun_set'];
    title = json['title'];
    latLong = json['latt_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['sun_rise'] = this.sunRise;
    data['sun_set'] = this.sunSet;
    data['title'] = this.title;
    data['latt_long'] = this.latLong;
    return data;
  }
}