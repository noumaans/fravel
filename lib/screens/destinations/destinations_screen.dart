import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:ui';

import '../../model/destination.dart';
import '../../model/destinations_repository.dart';
import '../cities_list/cities_list_screen.dart';

class DestinationsScreen extends StatefulWidget {
  @override
  DestinationsScreen({Key key, this.categories}) : super(key: key);

  final List<Destination> categories;

  @override
  _DestinationsScreenState createState() => new _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  List<Widget> _buildListCards(BuildContext context) {
    List<Destination> destinations = DestinationsRepository.load();

    if (destinations == null || destinations.isEmpty) {
      return const <Card>[];
    }

    return destinations.map((destination) {
      return new _DestinationCell(snapshot: destination);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _buildListCards(context),
    );
  }
}


class _DestinationCell extends StatefulWidget {
  @override
  _DestinationCell({Key key, this.snapshot}) : super (key: key);

  final Destination snapshot;

  @override
  _DestinationCellState createState() => new _DestinationCellState();
}

class _DestinationCellState extends State<_DestinationCell> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new GestureDetector(
      child: new Card(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 250.0,
              child: new Stack(
                // alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: <Widget>[
                  new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.snapshot.imageURL,
                    alignment: AlignmentDirectional.center,
                    fit: BoxFit.cover,
                  ),
                  new Container(
                    color: new Color.fromRGBO(255, 255, 255, 0.2),
                    constraints: new BoxConstraints(
                      minWidth: 100.0,
                      minHeight: 250.0
                    ),
                  ),
                  new Container(
                    alignment: AlignmentDirectional.center,
                    child: new Center(
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child: new Container(
                            height: 150.0,
                            decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color> [
                                  Colors.grey.shade200.withOpacity(0.0),
                                  Colors.grey.shade200.withOpacity(0.4),
                                  Colors.grey.shade200.withOpacity(0.7),
                                  Colors.grey.shade200.withOpacity(0.4),
                                  Colors.grey.shade200.withOpacity(0.0),
                                ]
                              ),
                            ),
                            child: new Center(
                              child: new Text(
                                widget.snapshot.title,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              )
            ),
            new Container(
              padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: new Text(
                "${widget.snapshot.cities != null ? widget.snapshot.cities.length : 0} Cities",
                style: theme.textTheme.body2,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CitiesListScreen(title: widget.snapshot.title, cities: widget.snapshot.cities),
          ),
        );
      }
    );
  }
}
