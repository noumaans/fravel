import 'package:flutter/foundation.dart';

import 'city.dart';

class Destination {
  const Destination({
    @required this.title,
    @required this.imageURL,
    this.cities,
  }) : assert(title != null),
       assert(imageURL != null);

  final String title;
  final String imageURL;
  final List<City> cities;
}
