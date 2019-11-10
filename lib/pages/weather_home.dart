import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/styles.dart';
import 'package:flutter_mobx_demo/services/shared_service.dart';
import 'package:flutter_mobx_demo/widgets/loader.dart';
import 'package:flutter_mobx_demo/widgets/weather_info_card.dart';
import 'package:flutter_mobx_demo/widgets/next_seven_days_forecast.dart';
import 'package:flutter_mobx_demo/widgets/error_card.dart';
import 'package:flutter_mobx_demo/widgets/delayed_animation.dart';
import 'package:flutter_mobx_demo/store/weather.dart';

SharedService _sharedService = SharedService();

class WeatherHomePage extends StatefulWidget {
  final WeatherStore weatherStore;

  WeatherHomePage({Key key, @required this.weatherStore})
      : assert(weatherStore != null),
        super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> with SingleTickerProviderStateMixin {
  WeatherStore _weatherStore;
  final int delayedAmount = 200;
  AnimationController _controller;

  @override
  void initState() {
    _weatherStore = widget.weatherStore;
    _loadWeatherForecast();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _loadWeatherForecast() async {
    await _weatherStore.fetchWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          padding: EdgeInsets.only(top: 8.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text('India, Pune',
                style: TextStyle(
                    fontSize: 22.0,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, size: 30.0, color: AppColors.primary),
                onPressed: () {},
              ),
              SizedBox(width: 10.0)
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Observer(
                builder: (_context) => _weatherStore.isLoading && !_weatherStore.hasData
                    ? Loader()
                    : _weatherStore.hasData
                    ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Column(
                        children: <Widget>[
                          DelayedAnimation(
                            delay: delayedAmount,
                            child: GestureDetector(
                              child: WeatherInfoCard(
                                info: _weatherStore.currentForecast,
                                onRefresh: () {
                                  _loadWeatherForecast();
                                },
                              ),
                              onTap: () {
                                _sharedService.showDayWeatherInfo(_context, _weatherStore.currentForecast);
                              },
                            ),
                          ),
                          SizedBox(height: 30.0),
                          DelayedAnimation(
                            delay: delayedAmount + 100,
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Next 7 Days',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary)),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          NextSevenDaysForecast(
                              weatherStore: _weatherStore,
                              forecastList:
                              _weatherStore.nextSevenDaysForecast),
                          SizedBox(height: 35.0),
                        ],
                      )
                    ],
                  ),
                )
                    : ErrorCard(
                  isError: _weatherStore.isError,
                  error: _weatherStore.error,
                  onRetry: () {
                    _loadWeatherForecast();
                  },
                )),
            Positioned.fill(
              child: Observer(
                builder: (_) => _weatherStore.isLoading && _weatherStore.hasData ? Container(
                  color: AppColors.white.withOpacity(0.4),
                  child: Loader(),
                ) : SizedBox(),
              ),
            )
          ],
        )
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return _weatherStore.isDayInfoPanelOpened ? SizedBox(
            width: 45.0,
            height: 45.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: AppColors.red,
                semanticLabel: 'close',
              ),
            ),
          ) : Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
