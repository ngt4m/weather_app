import 'package:flutter/material.dart';
import 'package:weather_app/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/city_entry_model.dart';
import 'package:weather_app/model/forecast_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CityEntryModel>(create: (_) => CityEntryModel()),
        ChangeNotifierProvider<ForecastViewModel>(
            create: (_) => ForecastViewModel()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
