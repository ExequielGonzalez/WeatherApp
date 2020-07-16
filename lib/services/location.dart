import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    final Geolocator geoLocator = Geolocator()
      ..forceAndroidLocationManager = true;
    try {
      position = await geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
    } catch (e) {
      print(e);
    }
    this.latitude = position.latitude ?? 0;
    this.longitude = position.longitude ?? 0;
  }
}
