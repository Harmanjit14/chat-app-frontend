import 'package:Huddle/models/currLocation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

CurrentLoc currentLoc = new CurrentLoc();

Future<int> getLocation() async {
  Position location = new Position();
  List<Placemark> placemarks = [];
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return 0;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return 0;
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return 0;
    }
  }

  location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  placemarks =
      await placemarkFromCoordinates(location.latitude, location.longitude);
  currentLoc.state = placemarks[0].administrativeArea;
  currentLoc.dist = placemarks[0].locality;
  currentLoc.street = placemarks[0].subLocality;

  return 1;
}
