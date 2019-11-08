import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/utilities/date_utils.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';

class WeatherDetailedInfoModal extends StatelessWidget {
  final Forecast info;

  WeatherDetailedInfoModal({Key key, @required this.info}): assert(info != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    String weekDay = DateUtils.weekDay(DateUtils.parseTimestamp(info.time));
    return Column(
      children: <Widget>[
        SizedBox(height: 38.0),
        Text(weekDay,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.white)),
        SizedBox(height: 5.0),
        DelayedAnimation(
            delay: 400,
            child: Container(
              width: 110.0,
              height: 110.0,
              child: Image.network(info.icon),
            )
        ),
        DelayedAnimation(
            delay: 600,
            child: Text(info.apparentTemperatureMin != null ? '${info.apparentTemperatureMin.ceil()}°' : '${info.temperature.ceil()}°',
                style: TextStyle(
                    fontSize: 50.0,
                    color: AppColors.white))
        ),
        SizedBox(height: 8.0),
        DelayedAnimation(
            delay: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Humidity', style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700)),
                SizedBox(height: 2.0),
                Text('${info.humidity}°',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white.withOpacity(0.8))),
              ],
            )
        )
      ],
    );
  }
}
