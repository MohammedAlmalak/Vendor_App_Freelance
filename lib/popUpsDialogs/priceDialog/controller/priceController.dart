import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class priceController extends GetxController {
  String selectedFromToPrice = "theprice".tr;
  String theLowest = "theLowest".tr, theHighest = "theHighest".tr;
  late String priceFromTo = "from".tr + "$theLowest " + "to".tr + "$theHighest";
  bool isAscending = true;
  ontap() {
    String swap = theLowest;
    theLowest = theHighest;
    theHighest = swap;
    isAscending = !isAscending;
    priceFromTo = "from".tr + "$theLowest " + "to".tr + "$theHighest";
    selectedFromToPrice = priceFromTo;
    update();
  }

  SfRangeValues values = SfRangeValues(0.0, 730.0);
  late double start = values.start;
  late double end = values.end;
  onSliderChange(SfRangeValues val) {
    values = val;
    start = val.start;
    end = val.end;
    update();
  }
}
