import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/model/location_model.dart';

abstract class WeatherApiService {
  Future<ForecastModel> getWeather(LocationModel location);
  Future<LocationModel> getLocation(String city);
}

class ForecastService {
  final WeatherApiService weatherApi;
  ForecastService(this.weatherApi);

  Future<ForecastModel> getWeather(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}
