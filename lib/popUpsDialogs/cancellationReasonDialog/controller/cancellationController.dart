import 'package:get/get.dart';

import '../../radiioData.dart';

class cancellationController extends GetxController {
  final List<RadioData> data = [
    RadioData(name: 'stockrunsout'.tr, value: 'نفاذ الكمية'),
    RadioData(
        name: 'unavailabilityoftherequiredcolors'.tr,
        value: 'عدم توافر الألوان المطلوبة'),
    RadioData(name: 'otherreasons'.tr, value: 'أسباب أخرى'),
  ];
  String reason = "الفرع";
  void selectedBranch(String val) {
    reason = val;
    update();
  }
}
