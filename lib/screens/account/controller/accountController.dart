import 'package:get/get.dart';
import 'dart:math';

class accountController extends GetxController {
  bool isOveriew = true;
  changeTap(bool val) {
    isOveriew = val;
    update();
  }

// IF hourly then timeStatus = 0
// IF daily then timeStatus = 1
// IF weekly then timeStatus = 2
// IF monthly then timeStatus = 3
  double overViewConter = 50;
  int timeStatus = 1;
  changeTimeStatus(int x) {
    timeStatus = x;
    overViewConter = Random().nextInt(70) + 10;

    update();
  }
}
