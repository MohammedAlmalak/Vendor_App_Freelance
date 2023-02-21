import 'package:get/get.dart';

import '../../radiioData.dart';

class branchController extends GetxController {
  String stringbranch = "thebranch".tr;
  int branch = -1;
  final List<RadioData> data = [
    RadioData(
      name: 'حياة مول ',
      // value: 'حياة مول ',
      intValu: 0,
    ),
    RadioData(
      name: 'النخيل مول ',
      // value: 'النخيل مول ',
      intValu: 1,
    ),
    RadioData(
        name: 'بانوراما مول ',
        //value: 'بانوراما مول ',
        intValu: 2),
    RadioData(
      name: 'الرياض مول ',
      // value: 'الرياض مول ',
      intValu: 3,
    ),
  ];
  void selectedBranch(val) {
    data.forEach((element) {
      if (element.intValu == val) stringbranch = element.name!;
    });
    branch = val;
    update();
  }
}
