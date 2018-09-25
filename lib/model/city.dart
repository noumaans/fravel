import 'package:flutter/foundation.dart';

class City {
  const City({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    this.description = '',
  }) : assert(id != null),
       assert(imageURL != null),
       assert(title != null);

  final int id;
  final String title;
  final String imageURL;
  final String description;
}
