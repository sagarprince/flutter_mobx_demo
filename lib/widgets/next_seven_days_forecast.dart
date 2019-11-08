import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/services/shared_service.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';
import 'package:flutter_mobx_demo/widgets/weather_info_card.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

SharedService _sharedService = SharedService();

class NextSevenDaysForecast extends StatelessWidget {
  final WeatherStore weatherStore;
  final List<Forecast> forecastList;

  NextSevenDaysForecast(
      {Key key, @required this.weatherStore, this.forecastList = const []})
      : assert(weatherStore != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[];
    for (int i = 0; i < forecastList.length; i++) {
      Forecast info = forecastList[i];
      Color color = CardColors[i];
      cards.add(DelayedAnimation(
        delay: 200 * (i + 1) - 100,
        child: GestureDetector(
          child: WeatherInfoCard(
              type: CardType.Other,
              color: color,
              info: info
          ),
          onTap: () {
            _sharedService.showDayWeatherInfo(weatherStore, context, info, color);
          },
        ),
      ));
    }
    return Container(
      height: 300.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: cards,
        ),
      ),
    );
  }
}
