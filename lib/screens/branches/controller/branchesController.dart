import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/brand.dart';
import 'package:vendor_app_freelance/staticData.dart';

class branchesController extends GetxController {
  bool isEditMode = false;
  changeMode(bool val) {
    isEditMode = val;
    update();
  }

  List<brand> branchesStores = staticData.getAllStores;
  addToStores(brand b) {
    branchesStores.add(b);
    update();
  }
}
