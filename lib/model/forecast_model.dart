import 'package:weather_app/model/weather_model.dart';

class ForecastModel {
  final DateTime lastUpdated;
  final double longitude;
  final double latitude;
  final List<WeatherModel> daily;
  final WeatherModel current;
  final bool isDayTime;
 final String city;
  ForecastModel(
      {required this.lastUpdated,
      required this.longitude,
      required this.latitude,
      required this.daily,
      required this.current,
      required this.city,
      required this.isDayTime});

        static ForecastModel fromJson(dynamic json) {
    var weather = json['current']['weather'][0];
    var date = DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000,
        isUtc: true);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunrise'] * 1000,
        isUtc: true);

    var sunset = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunset'] * 1000,
        isUtc: true);

    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

    // get the forecast for the next 3 days, excluding the current day
    bool hasDaily = json['daily'] != null;
    List<WeatherModel> tempDaily = [];
    if (hasDaily) {
      List items = json['daily'];
      tempDaily = items
          .map((item) => WeatherModel.fromDaily(item))
          .toList()
          .skip(1)
          .take(3)
          .toList();
    }
     var currentForcast = WeatherModel(
        cloudiness: int.parse(json['current']['clouds'].toString()),
        temp: json['current']['temp'].toDouble(),
        condition: WeatherModel.mapWeatherCondition(
            weather['main'], int.parse(json['current']['clouds'].toString())),
        description: weather['description'],
        feelLikeTemp: json['current']['feels_like'],
       
        date: date);
        String nameCity = json['name']['city'] ;

    return ForecastModel(
        lastUpdated: DateTime.now(),
        current: currentForcast,
        latitude: json['lat'].toDouble(),
        longitude: json['lon'].toDouble(),
        daily: tempDaily,
        isDayTime: isDay,
       city: nameCity,
        );
}

}
