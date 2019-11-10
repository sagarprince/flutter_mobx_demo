import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_demo/theme.dart';
import 'package:flutter_mobx_demo/store/weather.dart';
import 'package:flutter_mobx_demo/services/shared_service.dart';
import 'package:flutter_mobx_demo/services/weather_service.dart';
import 'package:flutter_mobx_demo/pages/weather_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherService>(
          builder: (_) => WeatherService()
        ),
        Provider<SharedService>(
            builder: (_) => SharedService()
        ),
        ProxyProvider2<WeatherService, SharedService, WeatherStore>(
          builder: (_, weatherService, sharedService,  __) => WeatherStore(weatherService, sharedService)
        ),
      ],
      child: MaterialApp(
        title: 'Weather',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: Consumer<WeatherStore>(
          builder: (_, store, __) => WeatherHomePage(weatherStore: store),
        ),
      ),
    );
  }
}
