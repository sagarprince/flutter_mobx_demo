import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  void showDayWeatherInfo(BuildContext context, Forecast info,
      [Color color = AppColors.blue]) {
    WeatherStore weatherStore = Provider.of<WeatherStore>(context);
    weatherStore.toggleDayInfoPanel(true);
    weatherStore.fetchDayHourlyForecast(info.time);
    showBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return StatefulBuilder(builder: (_, StateSetter setState) {
            return LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                double screenHeight =  MediaQuery.of(context).size.height;
                return Container(
                  width: constraints.maxWidth,
                  height: screenHeight - 110,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: WeatherDetailedInfoModal(info: info, weatherStore: weatherStore),
                );
              },
            );
          });
        }).closed.whenComplete(() {
          weatherStore.hourlyForecast = [];
          weatherStore.toggleDayInfoPanel(false);
        });
  }
}
