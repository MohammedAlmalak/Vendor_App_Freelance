import 'package:get/get.dart';
import 'package:vendor_app_freelance/staticData.dart';
import '../../../primaryClasses/products.dart';

class feedBackCon extends GetxController {
  List<Product> feedBackList = staticData.getAllProducts
      .where((element) =>
          element.productID == 1 ||
          element.productID == 3 ||
          element.productID == 6 ||
          element.productID == 7 ||
          element.productID == 10)
      .toList();
  List<Product>? FilterdList; /* = staticData.getAllProducts */
  genderFiltration(int gender) {
    FilterdList = feedBackList
        .where(
          (element) => element.productGender == gender,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = feedBackList
        .where(
          (element) => element.productBrand!.brandLocationId == branch,
        )
        .toList();
    update();
  }

  categoryFiltration(List<int> categories) {
    List<Product> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        feedBackList.forEach((element) {
          if (element.productCtegory == categories[i]) {
            categoryList.add(element);
          }
        });
      }
      FilterdList = categoryList;
    }
    update();
  }
}
