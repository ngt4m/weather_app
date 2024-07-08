import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherView extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;
  final bool isdayTime;
  const WeatherView({
    Key? key,
    required this.condition,
    required this.feelsLike,
    required this.isdayTime,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        WeatherConditionToImage(this.condition, this.isdayTime),
        Text(
          'Feel like ${this.feelsLike.toString()}°ᶜ',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Text(
          '${this.temp}°ᶜ',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  Widget WeatherConditionToImage(WeatherCondition condition, bool isdayTime) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        {
          isdayTime
              ? image = Image.asset('assets/weather/11d.png')
              : image = Image.asset('assets/weather/11n.png');
          break;
        }
      case WeatherCondition.rain:
        {
          isdayTime
              ? image = Image.asset('assets/weather/09d.png')
              : image = Image.asset('assets/weather/09n.png');
        }
      case WeatherCondition.snow:
        {
          isdayTime
              ? image = Image.asset('assets/weather/13d.png')
              : image = Image.asset('assets/weather/13n.png');
        }
      case WeatherCondition.mist:
      case WeatherCondition.fog:
        {
          image = Image.asset('assets/weather/04d.png');
        }
      case WeatherCondition.drizzle:
        {
          isdayTime
              ? image = Image.asset('assets/weather/10d.png')
              : image = Image.asset('assets/weather/10n.png');
        }
      case WeatherCondition.atmosphere:
        {
          isdayTime
              ? image = Image.asset('assets/weather/50d.png')
              : image = Image.asset('assets/weather/50n.png');
        }
      case WeatherCondition.lightCloud:
        {
          isdayTime
              ? image = Image.asset('assets/weather/02d.png')
              : image = Image.asset('assets/weather/02n.png');
        }
      case WeatherCondition.heavyCloud:
        {
          isdayTime
              ? image = Image.asset('assets/weather/03d.png')
              : image = Image.asset('assets/weather/03n.png');
        }
      case WeatherCondition.clear:
        {
          isdayTime
              ? image = Image.asset('assets/weather/01d.png')
              : image = Image.asset('assets/weather/01n.png');
        }
      default:
        {
          image = Image.asset('assets/images/unknown.png');
        }
    }
    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}
