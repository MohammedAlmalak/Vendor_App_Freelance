import 'package:get/get.dart';

import '../../radiioData.dart';

class orderStatusController extends GetxController {
  String stringStatus = "orderstatus".tr;
  int status = -1;
  final List<RadioData> data = [
    RadioData(name: 'delivered'.tr, intValu: 0),
    RadioData(name: 'prepared'.tr, intValu: 1),
    RadioData(name: 'inpreparation'.tr, intValu: 2),
    RadioData(name: 'canceled'.tr, intValu: 3),
  ];
  void selectedStatus(val) {
    data.forEach((element) {
      if (element.intValu == val) stringStatus = element.name!;
    });
    status = val;
    update();
  }
}
