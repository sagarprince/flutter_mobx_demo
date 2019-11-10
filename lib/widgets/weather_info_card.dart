import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/models/index.dart';
import 'package:flutter_mobx_demo/utilities/date_utils.dart';

enum CardType { Today, Other }

class WeatherInfoCard extends StatefulWidget {
  final Forecast info;
  final Color color;
  final CardType type;
  final Function onRefresh;

  WeatherInfoCard({
    Key key,
    @required this.info,
    this.color = AppColors.green,
    this.type = CardType.Today,
    this.onRefresh
  }) : assert(info != null),
        super(key: key);

  @override
  _WeatherInfoCardState createState() => _WeatherInfoCardState();
}

class _WeatherInfoCardState extends State<WeatherInfoCard> with AutomaticKeepAliveClientMixin {

  Widget _todayCardWidget() {
    String weekDay = DateUtils.weekDay(DateUtils.parseTimestamp(widget.info.time));
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      width: double.infinity,
      height: 320.0,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(40.0),
        image: DecorationImage(
            image: AssetImage('assets/images/layer.png'), fit: BoxFit.cover),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: -10,
              child: SizedBox(
                width: 120.0,
                height: 120.0,
                child: CachedNetworkImage(
                  imageUrl: widget.info.icon,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error, size: 50.0, color: AppColors.red),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 14,
              child: IconButton(
                icon: Icon(Icons.refresh, size: 32.0, color: AppColors.white),
                onPressed: () {
                  if (widget.onRefresh != null) {
                    widget.onRefresh();
                  }
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 5.0),
                Text(weekDay,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white)),
                SizedBox(
                    height: 140.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${widget.info.temperature.ceil()}°',
                            style: TextStyle(
                                fontSize: 110.0, color: AppColors.white)),
                      ],
                    )),
                Text(widget.info.summary,
                    style: TextStyle(fontSize: 24.0, color: AppColors.white)),
                SizedBox(height: 15.0),
                Text('Humidity',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 2.0),
                Text('${widget.info.humidity}°',
                    style: TextStyle(
                        fontSize: 28.0,
                        color: AppColors.white.withOpacity(0.4),
                        fontWeight: FontWeight.w700)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _otherCardWidget() {
    String weekDay = DateUtils.weekDay(DateUtils.parseTimestamp(widget.info.time));
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: 170.0,
      height: 280.0,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: widget.color.withOpacity(0.6),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(0, 5.0)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Text(weekDay,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
          SizedBox(height: 20.0),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: CachedNetworkImage(
              imageUrl: widget.info.icon,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 50.0, color: AppColors.red),
            ),
          ),
          SizedBox(height: 10.0),
          Text('${widget.info.apparentTemperatureMin.ceil()}°',
              style: TextStyle(
                  fontSize: 35.0,
                  color: AppColors.white)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${widget.info.temperatureMin.ceil()}°',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white.withOpacity(0.7))),
              SizedBox(width: 20.0),
              Text('${widget.info.temperatureMax.ceil()}°',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.type == CardType.Today ? _todayCardWidget() : _otherCardWidget();
  }

  @override
  bool get wantKeepAlive => true;
}


