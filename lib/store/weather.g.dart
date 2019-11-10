// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherBaseStore, Store {
  Computed<bool> _$hasDataComputed;

  @override
  bool get hasData =>
      (_$hasDataComputed ??= Computed<bool>(() => super.hasData)).value;
  Computed<List<Forecast>> _$nextSevenDaysForecastComputed;

  @override
  List<Forecast> get nextSevenDaysForecast =>
      (_$nextSevenDaysForecastComputed ??=
              Computed<List<Forecast>>(() => super.nextSevenDaysForecast))
          .value;

  final _$latAtom = Atom(name: '_WeatherBaseStore.lat');

  @override
  double get lat {
    _$latAtom.context.enforceReadPolicy(_$latAtom);
    _$latAtom.reportObserved();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.context.conditionallyRunInAction(() {
      super.lat = value;
      _$latAtom.reportChanged();
    }, _$latAtom, name: '${_$latAtom.name}_set');
  }

  final _$lngAtom = Atom(name: '_WeatherBaseStore.lng');

  @override
  double get lng {
    _$lngAtom.context.enforceReadPolicy(_$lngAtom);
    _$lngAtom.reportObserved();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.context.conditionallyRunInAction(() {
      super.lng = value;
      _$lngAtom.reportChanged();
    }, _$lngAtom, name: '${_$lngAtom.name}_set');
  }

  final _$currentForecastAtom = Atom(name: '_WeatherBaseStore.currentForecast');

  @override
  Forecast get currentForecast {
    _$currentForecastAtom.context.enforceReadPolicy(_$currentForecastAtom);
    _$currentForecastAtom.reportObserved();
    return super.currentForecast;
  }

  @override
  set currentForecast(Forecast value) {
    _$currentForecastAtom.context.conditionallyRunInAction(() {
      super.currentForecast = value;
      _$currentForecastAtom.reportChanged();
    }, _$currentForecastAtom, name: '${_$currentForecastAtom.name}_set');
  }

  final _$dailyForecastAtom = Atom(name: '_WeatherBaseStore.dailyForecast');

  @override
  List<Forecast> get dailyForecast {
    _$dailyForecastAtom.context.enforceReadPolicy(_$dailyForecastAtom);
    _$dailyForecastAtom.reportObserved();
    return super.dailyForecast;
  }

  @override
  set dailyForecast(List<Forecast> value) {
    _$dailyForecastAtom.context.conditionallyRunInAction(() {
      super.dailyForecast = value;
      _$dailyForecastAtom.reportChanged();
    }, _$dailyForecastAtom, name: '${_$dailyForecastAtom.name}_set');
  }

  final _$hourlyForecastAtom = Atom(name: '_WeatherBaseStore.hourlyForecast');

  @override
  List<Forecast> get hourlyForecast {
    _$hourlyForecastAtom.context.enforceReadPolicy(_$hourlyForecastAtom);
    _$hourlyForecastAtom.reportObserved();
    return super.hourlyForecast;
  }

  @override
  set hourlyForecast(List<Forecast> value) {
    _$hourlyForecastAtom.context.conditionallyRunInAction(() {
      super.hourlyForecast = value;
      _$hourlyForecastAtom.reportChanged();
    }, _$hourlyForecastAtom, name: '${_$hourlyForecastAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_WeatherBaseStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$isHourlyForecastLoadingAtom =
      Atom(name: '_WeatherBaseStore.isHourlyForecastLoading');

  @override
  bool get isHourlyForecastLoading {
    _$isHourlyForecastLoadingAtom.context
        .enforceReadPolicy(_$isHourlyForecastLoadingAtom);
    _$isHourlyForecastLoadingAtom.reportObserved();
    return super.isHourlyForecastLoading;
  }

  @override
  set isHourlyForecastLoading(bool value) {
    _$isHourlyForecastLoadingAtom.context.conditionallyRunInAction(() {
      super.isHourlyForecastLoading = value;
      _$isHourlyForecastLoadingAtom.reportChanged();
    }, _$isHourlyForecastLoadingAtom,
        name: '${_$isHourlyForecastLoadingAtom.name}_set');
  }

  final _$isErrorAtom = Atom(name: '_WeatherBaseStore.isError');

  @override
  bool get isError {
    _$isErrorAtom.context.enforceReadPolicy(_$isErrorAtom);
    _$isErrorAtom.reportObserved();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.context.conditionallyRunInAction(() {
      super.isError = value;
      _$isErrorAtom.reportChanged();
    }, _$isErrorAtom, name: '${_$isErrorAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_WeatherBaseStore.error');

  @override
  String get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$isDayInfoPanelOpenedAtom =
      Atom(name: '_WeatherBaseStore.isDayInfoPanelOpened');

  @override
  bool get isDayInfoPanelOpened {
    _$isDayInfoPanelOpenedAtom.context
        .enforceReadPolicy(_$isDayInfoPanelOpenedAtom);
    _$isDayInfoPanelOpenedAtom.reportObserved();
    return super.isDayInfoPanelOpened;
  }

  @override
  set isDayInfoPanelOpened(bool value) {
    _$isDayInfoPanelOpenedAtom.context.conditionallyRunInAction(() {
      super.isDayInfoPanelOpened = value;
      _$isDayInfoPanelOpenedAtom.reportChanged();
    }, _$isDayInfoPanelOpenedAtom,
        name: '${_$isDayInfoPanelOpenedAtom.name}_set');
  }

  final _$_WeatherBaseStoreActionController =
      ActionController(name: '_WeatherBaseStore');

  @override
  Future<void> fetchWeatherForecast() {
    final _$actionInfo = _$_WeatherBaseStoreActionController.startAction();
    try {
      return super.fetchWeatherForecast();
    } finally {
      _$_WeatherBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchDayHourlyForecast(int timestamp) {
    final _$actionInfo = _$_WeatherBaseStoreActionController.startAction();
    try {
      return super.fetchDayHourlyForecast(timestamp);
    } finally {
      _$_WeatherBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDayInfoPanel(bool isOpened) {
    final _$actionInfo = _$_WeatherBaseStoreActionController.startAction();
    try {
      return super.toggleDayInfoPanel(isOpened);
    } finally {
      _$_WeatherBaseStoreActionController.endAction(_$actionInfo);
    }
  }
}
