import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/popUpsDialogs/radiioData.dart';

class multiSelectRwoCon extends GetxController {
  late List<RadioData> options;
  List<RadioData> selctedOptionslist = [];
  void selectedOptions(int catIntVal, bool val) {
    options.forEach((element) {
      if (element.intValu == catIntVal) {
        element.boolValue = val;
      }
    });
    selctedOptionslist.clear();
    options.forEach((element) {
      if (element.boolValue == true) {
        selctedOptionslist.add(element);
      }
    });
    update();
  }

  List<RadioData> getSelectedOption() {
    return selctedOptionslist;
  }
}
