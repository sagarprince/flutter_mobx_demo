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
    final cards = <Widget>[];
    for (int i = 0; i < forecastList.length; i++) {
      cards.add(
        DelayedAnimation(
          delay: 200 * (i + 1) - 100,
          child: WeatherInfoCard(
              type: CardType.Other,
              color: CardColors[i],
              info: forecastList[i]
          ),
        )
      );
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
