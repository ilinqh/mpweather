class Place {
  String name = '';
  late Location location;
  String address = '';
}

class Location {
  String lng = '';
  String lat = '';

  Location(this.lng, this.lat);
}
