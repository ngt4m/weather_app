import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class ForecastView extends StatelessWidget {
  final WeatherModel weather;
  const ForecastView({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayofWeek =
        toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                dayofWeek ?? ' ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                '${this.weather.temp}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
        ],
      ),
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
