class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({
   required this.longitude,
   required this.latitude,
  });

  static LocationModel fromJson(dynamic json) {
    return LocationModel(
        longitude: json['coord']['lon'].toDouble(),
        latitude: json['coord']['lat'].toDouble());
  }
}