enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown
}

class WeatherModel {
  final WeatherCondition condition;
  final String description;
  final double temp;
  final double feelLikeTemp;
  final int cloudiness;
  final DateTime date;
  WeatherModel({
    required this.condition,
    required this.cloudiness,
    required this.feelLikeTemp,
    required this.date,
    required this.temp,
    required this.description,
  });
  static WeatherModel fromDaily(dynamic daily) {
        var cloudiness = daily['clouds'];
    var weather = daily['weather'][0];
    return WeatherModel(
        condition: mapWeatherCondition(weather['main'], cloudiness),
        description: weather['description'],
        cloudiness: cloudiness,
        temp: daily['temp']['day'].toDouble(),
        date: DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000,
            isUtc: true),
        feelLikeTemp: daily['feels_like']['day'].toDouble());
    
  }

  static WeatherCondition mapWeatherCondition(String input, int cloudiness) {
    
    WeatherCondition condition;
    switch (input) {
      case 'ThunderStorm':
        {
          condition = WeatherCondition.thunderstorm;
          break;
        }
        case 'Drizzle':
        {
          condition=WeatherCondition .drizzle;
        }
      case 'Rain':
        {
          condition = WeatherCondition.rain;
        }
      case 'Snow':
        {
          condition = WeatherCondition.snow;
          break;
        }
      case 'Clear':
        {
          condition = WeatherCondition.clear;
          break;
        }
      case 'Clouds':
        {
          condition = (cloudiness >= 85)
              ? WeatherCondition.heavyCloud
              : WeatherCondition.lightCloud;
          break;
        }
      case 'Mist':
        {
          condition = WeatherCondition.mist;
          break;
        }
      case 'fog':
        {
          condition = WeatherCondition.fog;
          break;
        }
         case 'Tornado':{
        condition = WeatherCondition.atmosphere;
        break;}
      default:{
        condition = WeatherCondition.unknown;
      }
    }
    return condition;
  }
}
