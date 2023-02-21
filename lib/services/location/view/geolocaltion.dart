import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/locationController.dart';

class Geolocation extends StatelessWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) => controller.kGooglePlex == null
            ? Container(
                height: 250.h,
                width: double.infinity,
                child: Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: const Color(0xFFF26511),
                    ),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                height: 250.h,
                width: double.infinity,
                child: GoogleMap(
                  //scrollGesturesEnabled: false,
                  mapType: MapType.hybrid,
                  initialCameraPosition: controller.kGooglePlex!,
                  onMapCreated: (GoogleMapController control) {
                    controller.con.complete(control);
                  },
                ),
              ));
  }
}

// MAP KEY ===> AIzaSyC9On6qs3kKOV6dIa7bs9S7h3PczbPd60s