import 'package:flutter/material.dart';

import '../destinations/destinations_screen.dart';
import '../favorites/favorites_screen.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  @override
  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          brightness: Brightness.light,
          title: new TabBar(
            indicatorPadding: new EdgeInsets.only(bottom: -16.0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              new Text('PLACES', style: theme.textTheme.button),
              new Text('FAVES', style: theme.textTheme.button),
              new Text('ACCOUNT', style: theme.textTheme.button),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new DestinationsScreen(),
            new FavoritesScreen(),
            new LoginScreen(),
          ],
        )
      )
    );
  }
}
