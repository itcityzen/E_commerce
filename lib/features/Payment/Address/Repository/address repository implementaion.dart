import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'address repository.dart';

class AddressRepositoryImplementation implements AddressRepository {
  @override
  Future<String> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var address = placemarks.first;
    return "${address.country} ,${address.administrativeArea},${address.street} ";
  }
}
