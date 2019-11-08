import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/widgets/weather_detailed_info_modal.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

class SharedService {
  static final SharedService _weatherService = new SharedService._internal();

  factory SharedService() {
    return _weatherService;
  }

  SharedService._internal();

  void showDayWeatherInfo(
      WeatherStore weatherStore, BuildContext context, Forecast info,
      [Color color = AppColors.blue]) {
    weatherStore.toggleDayInfoPanel(true);
    showBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return StatefulBuilder(builder: (_, StateSetter setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 110,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: WeatherDetailedInfoModal(info: info),
            );
          });
        }).closed.whenComplete(() => weatherStore.toggleDayInfoPanel(false));
  }
}
