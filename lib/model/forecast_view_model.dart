import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/API_request/request.dart';
import 'package:weather_app/API_request/weather_service.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/model/weather_model.dart';

class ForecastViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isWeatherLoaded = false;
  bool isRequestError = false;

  late WeatherCondition _condition;
  late String _description;
  late double _minTemp;
  late double _maxTemp;
  late double _temp;
  late double _feelsLike;
  late int _locationId;
  late DateTime _lastUpdated;
  late String _city;
  late double _latitude;
  late double _longitude;
  late List<WeatherModel> _daily;
  late bool _isDayTime;

  WeatherCondition get condition => _condition;
  String get description => _description;
  double get minTemp => _minTemp;
  double get maxTemp => _maxTemp;
  double get temp => _temp;
  double get feelsLike => _feelsLike;
  int get locationId => _locationId;
  DateTime get lastUpdated => _lastUpdated;
  String get city => _city;
  double get longitude => _longitude;
  double get latitude => _latitude;
  bool get isDaytime => _isDayTime;
  List<WeatherModel> get daily => _daily;

  final ForecastService forecastService;

  ForecastViewModel() : forecastService = ForecastService(WeatherApiRequest());

  Future<ForecastModel> getLatestWeather(String city) async {
    setRequestPendingState(true);
    isRequestError = false;

    ForecastModel latest;
    try {
      await Future.delayed(Duration(seconds: 1)); // giả lập độ trễ

      latest = await forecastService.getWeather(city);
    } catch (e) {
      isRequestError = true;
      setRequestPendingState(false);
      notifyListeners();
      rethrow;
    }

    isWeatherLoaded = true;

    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(ForecastModel forecast, String city) {
    if (isRequestError) return;

    _condition = forecast.current.condition;
    _city = (forecast.city);
    _description = forecast.current.description;
    _lastUpdated = forecast.lastUpdated;
    _temp = forecast.current.temp;
    _feelsLike = forecast.current.feelLikeTemp;
    _longitude = forecast.longitude;
    _latitude = forecast.latitude;
    _daily = forecast.daily;
    _isDayTime = forecast.isDayTime;
  }
}
