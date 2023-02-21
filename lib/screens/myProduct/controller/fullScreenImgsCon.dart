import 'package:flutter/material.dart';
import 'package:get/get.dart';

class fullScreenImgsCon extends GetxController {
  late int index = 0;
  bool isWhite = true;
  Color backGroundCol = Colors.white;
  nextImg(int x) {
    index = x;
    update();
  }

  changeBackgroundColor(bool val, Color col) {
    isWhite = val;
    backGroundCol = col;
    update();
  }
}
