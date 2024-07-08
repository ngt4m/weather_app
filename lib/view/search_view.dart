import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/city_entry_model.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController cityEditController;

  @override
  void initState() {
    super.initState();

    cityEditController = new TextEditingController();
    cityEditController.addListener(() {
      Provider.of<CityEntryModel>(this.context, listen: false)
          .updateCity(cityEditController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CityEntryModel>(
      builder: (context, model, child) => Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
        padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                model.updateCity(cityEditController.text);
                model.refreshWeather(cityEditController.text, context);
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: cityEditController,
                decoration: InputDecoration.collapsed(hintText: "Enter City"),
                onSubmitted: (String city) => {
                  model.refreshWeather(city, context),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
