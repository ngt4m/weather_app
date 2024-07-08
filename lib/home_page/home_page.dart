import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/city_entry_model.dart';
import 'package:weather_app/model/forecast_view_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/forecast_view.dart';
import 'package:weather_app/view/last_update_view.dart';
import 'package:weather_app/view/location_view.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/view/weather_description_view.dart';
import 'package:weather_app/view/weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastViewModel>(
      builder: (context, weather, child) => Container(
        child: RefreshIndicator(
          onRefresh: () => refreshWeather(weather, context),
          child: ListView(
            children: [
              SearchView(),
              weather.isRequestPending
                  ? buildBusyIndicator()
                  : weather.isRequestError
                      ? Center(
                          child: Text('Ooops...something went wrong',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white)))
                      : Column(children: [
                          LocationView(
                            longitude: weather.longitude,
                            latitude: weather.latitude,
                            city: weather.city,
                          ),
                          SizedBox(height: 50),
                          WeatherView(
                              condition: weather.condition,
                              temp: weather.temp,
                              feelsLike: weather.feelsLike,
                              isdayTime: weather.isDaytime),
                          SizedBox(height: 20),
                          WeatherDescriptionView(
                              description: weather.description),
                          SizedBox(height: 140),
                          buildDailySummary(weather.daily),
                          LastUpdateView(lastUpdate: weather.lastUpdated),
                        ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBusyIndicator() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
      SizedBox(
        height: 20,
      ),
      Text('Please Wait...',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ))
    ]);
  }

  Widget buildDailySummary(List<WeatherModel> dailyForecast) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dailyForecast
            .map((item) => new ForecastView(
                  weather: item,
                ))
            .toList());
  }

  Future<void> refreshWeather(
      ForecastViewModel weatherVM, BuildContext context) {
    // get the current city
    String city = Provider.of<CityEntryModel>(context, listen: false).city;
    return weatherVM.getLatestWeather(city);
  }
}
