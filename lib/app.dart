import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart'; // To get TargetPlatform
import 'package:flutter/cupertino.dart';

import 'screens/home/home_screen.dart';
import 'screens/favorites/favorites_screen.dart';
import 'colors.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fravel',
      // This is the theme of your application.
      // theme: defaultTargetPlatform == TargetPlatform.iOS ? kDarkTheme : kLightTheme,
      theme: _kAppTheme,
      home: new HomeScreen(title: 'Fravel'),
      routes: <String, WidgetBuilder> {
        '/fav': (BuildContext context) => new FavoritesScreen(),
      }
    );
  }
}

// final ThemeData _kLightTheme = new ThemeData(
//   primarySwatch: Colors.orange,
//   primaryColor: Colors.grey[100],
//   primaryColorBrightness: Brightness.light,
// );

// final ThemeData _kDarkTheme = new ThemeData(
//   primarySwatch: Colors.purple,
//   accentColor: Colors.orangeAccent[400],
// );

final ThemeData _kAppTheme = _buildAppTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kColorVariant);
}

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kColorVariant,
    primaryColor: kColorPrimary,
    buttonColor: kColorPrimary,
    scaffoldBackgroundColor: kColorBackground,
    cardColor: kColorBackground,
    textSelectionColor: kColorPrimary,
    errorColor: kColorError,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: kColorVariant),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    textTheme: _buildAppTextTheme(base.textTheme),
    primaryTextTheme: _buildAppTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildAppTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 42.0,
    ),
    title: base.title.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kColorVariant,
    bodyColor: kColorVariant,
  );
}
