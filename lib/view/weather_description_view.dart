import 'package:flutter/material.dart';

class WeatherDescriptionView extends StatelessWidget {
  final String description;
  const WeatherDescriptionView({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.description,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
      ),
    );
  }
}
