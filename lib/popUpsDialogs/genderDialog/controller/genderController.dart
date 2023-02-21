import 'package:get/get.dart';

import '../../radiioData.dart';

class genderController extends GetxController {
  String stringGender = "type".tr;
  int gender = -1;
  final List<RadioData> data = [
    RadioData(
        name: 'رجال',
        // value: "رجال",
        intValu: 0),
    RadioData(
      name: 'نساء',
      //value: "نساء",
      intValu: 1,
    ),
    RadioData(
      name: 'أطفال',
      //value: "أطفال"
      intValu: 2,
    ),
  ];

  void selectedGender(val) {
    data.forEach((element) {
      if (element.intValu == val) stringGender = element.name!;
    });
    gender = val;
    update();
  }
}
