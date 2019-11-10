import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/utilities/date_utils.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

class WeatherDetailedInfoModal extends StatelessWidget {
  final Forecast info;
  final WeatherStore weatherStore;

  WeatherDetailedInfoModal(
      {Key key, @required this.info, @required this.weatherStore})
      : assert(info != null, weatherStore != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String weekDay = DateUtils.weekDay(DateUtils.parseTimestamp(info.time));
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Text(weekDay,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
          SizedBox(height: 2.0),
          DelayedAnimation(
            delay: 400,
            child: SizedBox(
              width: 95.0,
              height: 95.0,
              child: CachedNetworkImage(
                imageUrl: info.icon,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, size: 50.0, color: AppColors.red),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          DelayedAnimation(
              delay: 600,
              child: Text(info.summary,
                  style: TextStyle(fontSize: 16.0, color: AppColors.white))),
          DelayedAnimation(
              delay: 800,
              child: Text(
                  info.apparentTemperatureMin != null
                      ? '${info.apparentTemperatureMin.ceil()}°'
                      : '${info.temperature.ceil()}°',
                  style: TextStyle(fontSize: 45.0, color: AppColors.white))),
          SizedBox(height: 8.0),
          DelayedAnimation(
              delay: 1000,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Humidity',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 2.0),
                  Text('${info.humidity}°',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white.withOpacity(0.8))),
                ],
              )),
          SizedBox(height: 40.0),
          DelayedAnimation(
            delay: 1400,
            child: Container(
              height: 120.0,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Observer(
                builder: (_) => weatherStore.hourlyForecast.length > 0 ? Container(
                  padding: EdgeInsets.only(top: 13.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: weatherStore.hourlyForecast.length,
                    itemBuilder: (_, int i) {
                      Forecast forecast = weatherStore.hourlyForecast[i];
                      return Container(
                        width: 85.0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(DateUtils.formatTime(forecast.time), style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary)),
                              SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CachedNetworkImage(
                                  imageUrl: info.icon,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error, size: 50.0, color: AppColors.red),
                                ),
                              ),
                              Text('${forecast.temperature.ceil()}°',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ) : Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
