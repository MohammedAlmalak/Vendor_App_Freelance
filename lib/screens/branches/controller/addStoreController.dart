import 'package:get/get.dart';

class addStoreController extends GetxController {
  String branch = "a";
  changeBranch(String b) {
    branch = b;
    update();
  }

  String country = 'KSA';
  changeCountry(String c) {
    country = c;
    update();
  }

  String city = 'Riyadh';
  changeCity(String cty) {
    city = cty;
    update();
  }
}
