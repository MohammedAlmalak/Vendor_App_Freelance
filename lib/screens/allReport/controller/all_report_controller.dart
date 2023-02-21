import 'package:get/get.dart';

class AllReportController extends GetxController {
  var isSelected = [false, true];

  changeToggleBotton(index) {
    print(index);
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    update(['number']);
  }
}
