import 'package:flutter/material.dart';

import '../../model/city.dart';
import 'city_cell.dart';

class CitiesListScreen extends StatelessWidget {
  @override
  CitiesListScreen({Key key, @required this.title, @required this.cities}) : super(key: key);

  final String title;
  final List<City> cities;

  List<Widget> _buildListCards(BuildContext context) {
    if (cities == null || cities.isEmpty) {
      return const <Card>[];
    }

    return cities.map((city) {
      return new CityCell(snapshot: city);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        title: new Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
            },
          )
        ],
      ),
      body: new ListView(
        children: _buildListCards(context),
      ),
    );
  }
}
