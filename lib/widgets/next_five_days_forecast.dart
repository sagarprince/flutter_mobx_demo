import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';
import 'package:flutter_mobx_demo/widgets/weather_info_card.dart';

class NextFiveDaysForecast extends StatelessWidget {
  final List<ConsolidatedWeather> forecastList;

  NextFiveDaysForecast({Key key, this.forecastList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: forecastList.length,
        itemBuilder: (_, index) => DelayedAnimation(
          delay: 200 * (index + 1) - 100,
          child: WeatherInfoCard(
            type: CardType.Other,
            color: CardColors[index],
            info: forecastList[index],
          ),
        ),
        addAutomaticKeepAlives: true
      ),
    );
  }
}
