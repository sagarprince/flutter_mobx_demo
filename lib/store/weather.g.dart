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
  Computed<ConsolidatedWeather> _$todayForecastComputed;

  @override
  ConsolidatedWeather get todayForecast => (_$todayForecastComputed ??=
          Computed<ConsolidatedWeather>(() => super.todayForecast))
      .value;
  Computed<List<ConsolidatedWeather>> _$nextFiveDaysForecastComputed;

  @override
  List<ConsolidatedWeather> get nextFiveDaysForecast =>
      (_$nextFiveDaysForecastComputed ??= Computed<List<ConsolidatedWeather>>(
              () => super.nextFiveDaysForecast))
          .value;

  final _$sunSetRiseInfoAtom = Atom(name: '_WeatherBaseStore.sunSetRiseInfo');

  @override
  SunSetRiseInfo get sunSetRiseInfo {
    _$sunSetRiseInfoAtom.context.enforceReadPolicy(_$sunSetRiseInfoAtom);
    _$sunSetRiseInfoAtom.reportObserved();
    return super.sunSetRiseInfo;
  }

  @override
  set sunSetRiseInfo(SunSetRiseInfo value) {
    _$sunSetRiseInfoAtom.context.conditionallyRunInAction(() {
      super.sunSetRiseInfo = value;
      _$sunSetRiseInfoAtom.reportChanged();
    }, _$sunSetRiseInfoAtom, name: '${_$sunSetRiseInfoAtom.name}_set');
  }

  final _$consolidatedWeathersAtom =
      Atom(name: '_WeatherBaseStore.consolidatedWeathers');

  @override
  List<ConsolidatedWeather> get consolidatedWeathers {
    _$consolidatedWeathersAtom.context
        .enforceReadPolicy(_$consolidatedWeathersAtom);
    _$consolidatedWeathersAtom.reportObserved();
    return super.consolidatedWeathers;
  }

  @override
  set consolidatedWeathers(List<ConsolidatedWeather> value) {
    _$consolidatedWeathersAtom.context.conditionallyRunInAction(() {
      super.consolidatedWeathers = value;
      _$consolidatedWeathersAtom.reportChanged();
    }, _$consolidatedWeathersAtom,
        name: '${_$consolidatedWeathersAtom.name}_set');
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

  final _$_WeatherBaseStoreActionController =
      ActionController(name: '_WeatherBaseStore');

  @override
  void fetchWeatherForecast() {
    final _$actionInfo = _$_WeatherBaseStoreActionController.startAction();
    try {
      return super.fetchWeatherForecast();
    } finally {
      _$_WeatherBaseStoreActionController.endAction(_$actionInfo);
    }
  }
}
