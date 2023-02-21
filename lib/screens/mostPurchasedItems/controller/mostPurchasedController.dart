import 'package:get/get.dart';
import 'package:vendor_app_freelance/staticData.dart';
import '../../../primaryClasses/products.dart';

class mostPurchasedController extends GetxController {
  List<Product> mostPurchasedProd = staticData.getAllProducts
      .where((element) =>
          element.productID == 7 ||
          element.productID == 10 ||
          element.productID == 4 ||
          element.productID == 2 ||
          element.productID == 9)
      .toList();
  List<Product>? FilterdList; /* = staticData.getAllProducts */
  genderFiltration(int gender) {
    FilterdList = mostPurchasedProd
        .where(
          (element) => element.productGender == gender,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = mostPurchasedProd
        .where(
          (element) => element.productBrand!.brandLocationId == branch,
        )
        .toList();
    update();
  }

  priceFiltration(bool isAscending) {
    if (isAscending) {
      FilterdList != null
          ? FilterdList!
              .sort(((a, b) => a.productPrice!.compareTo(b.productPrice!)))
          : mostPurchasedProd
              .sort(((a, b) => a.productPrice!.compareTo(b.productPrice!)));
    } else {
      FilterdList != null
          ? FilterdList!
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)))
          : mostPurchasedProd
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)));
    }
    update();
  }

  categoryFiltration(List<int> categories) {
    List<Product> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        mostPurchasedProd.forEach((element) {
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
