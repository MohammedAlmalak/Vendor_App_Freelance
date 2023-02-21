import 'package:get/get.dart';

import '../../radiioData.dart';

class categoryController extends GetxController {
  String category = "categories".tr;
  final List<RadioData> categoryList = [
    RadioData(name: 'موضة', intValu: 0, boolValue: false),
    RadioData(name: 'العناية بالجمال', intValu: 1, boolValue: false),
    RadioData(name: 'مكتبات', intValu: 2, boolValue: false),
    RadioData(name: 'صيدليات', intValu: 3, boolValue: false),
  ];
  List<int> selectedCat = [];
  void selectedCategory(int catIntVal, bool val) {
    categoryList.forEach((element) {
      if (element.intValu == catIntVal) {
        element.boolValue = val;
      }
    });
    selectedCat.clear();
    categoryList.forEach((element) {
      if (element.boolValue == true) {
        selectedCat.add(element.intValu!);
      }
    });
    update();
  }
}
