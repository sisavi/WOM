import 'package:flutter/cupertino.dart';
import 'package:world_of_mouth/dummy_data.dart';


class Destination with ChangeNotifier{
  final String pictureUrl;
  final String city;
  final double restaurantsCount;

  Destination({this.pictureUrl, this.city, this.restaurantsCount}); 

  List<Destination> get destinations {
    List<Destination> loadDestinations = [];
    loadDestinations.addAll(DESTINATIONS);
    
    return loadDestinations;
  }
}