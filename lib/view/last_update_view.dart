import 'package:flutter/material.dart';

class LastUpdateView extends StatelessWidget {
  final DateTime lastUpdate;
  const LastUpdateView({
    Key? key,
    required this.lastUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Last update on: ${TimeOfDay.fromDateTime(this.lastUpdate).format(context)}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
