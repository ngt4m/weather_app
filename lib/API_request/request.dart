import 'dart:convert';
import 'package:weather_app/API_request/weather_service.dart';
import 'package:weather_app/api_key/api_key.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiRequest extends WeatherApiService {
  static const url = 'https://api.openweathermap.org/data/2.5';
  http.Client? httpClient;

  WeatherApiRequest() {
    this.httpClient = new http.Client();
  }

  Future<LocationModel> getLocation(String city) async {
    final requestUrl = '$url/weather?q=$city&APPID=$API_KEY';
    final response = await this.httpClient!.get(Uri.http(requestUrl));
    // get(Uri.encodeFull(requestUrl));

    if (response.statusCode == 200) {
      return LocationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<ForecastModel> getWeather(LocationModel location) async {
    final requestUrl =
        '$url/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$API_KEY';
    final response = await this.httpClient!.get(Uri.http(requestUrl));
    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
