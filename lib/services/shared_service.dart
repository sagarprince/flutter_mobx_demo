import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/widgets/weather_detailed_info_modal.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

class SharedService {
  static final SharedService _sharedService = new SharedService._internal();

  final Geolocator _geolocator = Geolocator();

  factory SharedService() {
    return _sharedService;
  }

  SharedService._internal();

  Future<Position> getCurrentLocation() async {
    return await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

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
