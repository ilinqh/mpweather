import 'package:weather_project/bean/place.dart';

class PlaceService {
  static List<Place> searchPlace({required String place}) {
    return Place.placeList
        .where((element) => element.name.contains(place))
        .toList();
  }
}
