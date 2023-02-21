import 'package:get/get.dart';
import 'package:vendor_app_freelance/services/theme/nav_bar/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController());
  }
}
