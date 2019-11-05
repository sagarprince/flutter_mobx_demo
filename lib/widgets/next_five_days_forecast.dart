import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/utilities/date_utils.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';
import 'package:flutter_mobx_demo/widgets/weather_info_card.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

class NextFiveDaysForecast extends StatelessWidget {
  final WeatherStore weatherStore;
  final List<ConsolidatedWeather> forecastList;

  NextFiveDaysForecast(
      {Key key, @required this.weatherStore, this.forecastList = const []})
      : assert(weatherStore != null),
        super(key: key);

  Widget _weatherInfo(ConsolidatedWeather info) {
    String weekDay = DateUtils.weekDay(DateUtils.parseDate(info.applicableDate));
    return Column(
      children: <Widget>[
        SizedBox(height: 35.0),
        Text(weekDay,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.white)),
        SizedBox(height: 20.0),
        DelayedAnimation(
          delay: 400,
          child: Container(
            width: 80.0,
            height: 80.0,
            child: Image.asset('assets/images/${info.weatherStateAbbr}.png'),
          )
        ),
        SizedBox(height: 20.0),
        DelayedAnimation(
            delay: 600,
            child: Text('${info.theTemp.ceil()}°',
                style: TextStyle(
                    fontSize: 60.0,
                    color: AppColors.white))
        ),
        SizedBox(height: 20.0),
        DelayedAnimation(
            delay: 800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${info.minTemp.ceil()}°',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white.withOpacity(0.7))),
                SizedBox(width: 20.0),
                Text('${info.maxTemp.ceil()}°',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white)),
              ],
            )
        )
      ],
    );
  }

  void showDayWeatherInfo(BuildContext context, ConsolidatedWeather info, Color color) {
    showBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return StatefulBuilder(builder: (_, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height - 150,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: _weatherInfo(info),
            );
          });
        }).closed.whenComplete(() => weatherStore.toggleDayInfoPanel());
  }

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[];
    for (int i = 0; i < forecastList.length; i++) {
      ConsolidatedWeather info = forecastList[i];
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
            weatherStore.toggleDayInfoPanel();
            showDayWeatherInfo(context, info, color);
          },
        ),
      ));
    }
    return Container(
      height: 260.0,
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
