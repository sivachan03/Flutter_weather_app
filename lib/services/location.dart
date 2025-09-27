import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitute;
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.altitude;
      longitute = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
