import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/city.dart';
import '../city/city_screen.dart';

class CityCell extends StatelessWidget {
  CityCell({Key key, @required this.snapshot}) : super(key: key);

  final City snapshot;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new FadeInImage.memoryNetwork(
            width: MediaQuery.of(context).size.width,
            placeholder: kTransparentImage,
            image: snapshot.imageURL,
            fit: BoxFit.cover,
          ),
          new ListTile(
            leading: const Icon(Icons.place),
            title: new Text(snapshot.title),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('SHARE'),
                  onPressed: () {
                  },
                ),
                new RaisedButton(
                  child: const Text('DETAILS'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(title: snapshot.title, snapshot: snapshot),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
