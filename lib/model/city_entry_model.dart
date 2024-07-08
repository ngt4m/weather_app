import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/forecast_view_model.dart';

class CityEntryModel with ChangeNotifier {
  late String _city;

  CityEntryModel();

  String get city => _city;

  void refreshWeather(String newCity, BuildContext context) {
    Provider.of<ForecastViewModel>(context, listen: false)
        .getLatestWeather(_city);

    notifyListeners();
  }

  void updateCity(String newCity) {
    _city = newCity;
  }
}
