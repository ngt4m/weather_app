import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  final double longitude;
  final double latitude;
  final String city;

  const LocationView({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${this.city.toUpperCase()}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.longitude.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(','),
            Text(
              this.longitude.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
