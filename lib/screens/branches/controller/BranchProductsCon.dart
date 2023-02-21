import 'package:get/get.dart';
import 'package:vendor_app_freelance/staticData.dart';

import '../../../primaryClasses/products.dart';

class BranchProductsCon extends GetxController {
  List<Product> branchProductList = staticData.getAllProducts;
  List<Product>? FilterdList; /* = staticData.getAllProducts */
  genderFiltration(int gender) {
    FilterdList = branchProductList
        .where(
          (element) => element.productGender == gender,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = branchProductList
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
          : branchProductList
              .sort(((a, b) => a.productPrice!.compareTo(b.productPrice!)));
    } else {
      FilterdList != null
          ? FilterdList!
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)))
          : branchProductList
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)));
    }
    update();
  }

  categoryFiltration(List<int> categories) {
    List<Product> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        branchProductList.forEach((element) {
          if (element.productCtegory == categories[i]) {
            categoryList.add(element);
          }
        });
      }
      FilterdList = categoryList;
    }
    update();
  }

  // filtaration({int? gender, int? branch}) {
  //   if (gender != -1) {
  //     genderFiltration(gender!);
  //   } else if (branch != -1) {
  //     branchFiltration(branch!);
  //   } else if (gender != -1 && branch != -1) {
  //     FilterdList = branchProductList
  //         .where(
  //           (element) =>
  //               element.productGender == gender &&
  //               element.productBrand.brandLocationId == branch,
  //         )
  //         .toList();
  //     update();
  //   }
  // }
}
