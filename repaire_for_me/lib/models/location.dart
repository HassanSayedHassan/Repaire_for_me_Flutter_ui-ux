class Location {
  double latitude;
  double longitude;

   Location({this.latitude = 0.0, this.longitude = 0.0});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
