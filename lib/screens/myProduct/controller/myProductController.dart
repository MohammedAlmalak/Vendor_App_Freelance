import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import '../widget/productSizes.dart';
import 'package:vendor_app_freelance/staticData.dart';

class myProductController extends GetxController {
  List<Size> sizes = [
    Size(sizeIndex: 5, sizeName: "XXXL"),
    Size(sizeIndex: 4, sizeName: "XXl"),
    Size(sizeIndex: 3, sizeName: "XL"),
    Size(sizeIndex: 2, sizeName: "L"),
    Size(sizeIndex: 1, sizeName: "M"),
    Size(sizeIndex: 0, sizeName: "S"),
  ];
  List<int> selectedSizes = [];
  isInSelectedSizes(int key) {
    bool isSelected = false;
    if (selectedSizes.isEmpty) {
      selectedSizes.add(key);
    } else {
      for (int i = 0; i < selectedSizes.length; i++) {
        if (selectedSizes[i] == key) {
          isSelected = true;
          break;
        }
      }
      if (isSelected == true) {
        selectedSizes.remove(key);
      } else {
        selectedSizes.add(key);
      }
    }
    update();
  }

  // genderFiltration(String gender, List<product> filtrationList) {
  //   filtrationList.where((element) => element.productGender == gender);
  //   update();
  // }
  List<Product> myProductList = staticData.getAllProducts;
  List<Product>? FilterdList; /* = staticData.getAllProducts */
  genderFiltration(int gender) {
    FilterdList = myProductList
        .where(
          (element) => element.productGender == gender,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = myProductList
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
          : myProductList
              .sort(((a, b) => a.productPrice!.compareTo(b.productPrice!)));
    } else {
      FilterdList != null
          ? FilterdList!
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)))
          : myProductList
              .sort(((a, b) => b.productPrice!.compareTo(a.productPrice!)));
    }
    update();
  }

  categoryFiltration(List<int> categories) {
    List<Product> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        myProductList.forEach((element) {
          if (element.productCtegory == categories[i]) {
            categoryList.add(element);
          }
        });
      }
      FilterdList = categoryList;
    }
    update();
  }

  String productType = '1';
  changeProductType(String prodType) {
    productType = prodType;
    update();
  }
}
