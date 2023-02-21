import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    getPermission();
    super.onInit();
  }

  var currentLocation;
  var currentLocationLat, currentLocationLong;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController> con = Completer();
  Future getPermission() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {}
    per = await Geolocator.checkPermission();
    if (per != LocationPermission.always ||
        per != LocationPermission.whileInUse) {
      per = await Geolocator.requestPermission();
      getLatAndLang();
    }
  }

  Future<void> getLatAndLang() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    currentLocationLat = currentLocation.latitude;
    currentLocationLong = currentLocation.longitude;
    kGooglePlex = CameraPosition(
      target: LatLng(currentLocationLat, currentLocationLong),
      zoom: 14.4746,
    );
    update();
  }
}
