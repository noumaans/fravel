import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/city.dart';

class CityScreen extends StatefulWidget {
  @override
  CityScreen({Key key, @required this.title, @required this.snapshot})
      : super(key: key);

  final String title;
  final City snapshot;

  @override
  _CityScreenState createState() => new _CityScreenState();
}

class _CityScreenState extends State<CityScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 200.0,
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new FadeInImage.memoryNetwork(
              width: MediaQuery.of(context).size.width,
              image: widget.snapshot.imageURL,
              placeholder: kTransparentImage,
              alignment: AlignmentDirectional.center,
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(widget.snapshot.title, style: theme.textTheme.title),
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Text(widget.snapshot.description)
          ),
        ],
      ),
    );
  }
}
