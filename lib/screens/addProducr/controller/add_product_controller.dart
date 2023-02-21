import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/brand.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/services/theme/app_Icons.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../common/multySelect.dart';
import '../../../primaryClasses/products.dart';

class AddProductController extends GetxController {
  late Product product;
  List<choices?> selectedItems = [];

  @override
  void onInit() {
    super.onInit();
    product = new Product(productBrand: brand(brandCategory: 'FASHION'));
    Random random = new Random();

    int randomNumber = random.nextInt(90) + 10;

    product.productID = randomNumber;
    product.productColor = 'أسود';
    product.productImg = AppAssets.comingSoon;
    product.productBrand!.brandImg != AppAssets.nike;
    product.productDemand = 7;
    product.productBrand?.brandCategoryIcon = Icon(MyIcons.fashiontwo);
  }

  String brandType = 'Nike';
  changeBrandType(String bt) {
    brandType = bt;
    update();
  }

  // String mainColor = 'a';
  // changeMainColor(String col) {
  //   mainColor = col;
  //   update();
  // }

  // String subColor = 'a';
  // changeSubColor(String col) {
  //   subColor = col;
  //   update();
  // }
}
//productID: productID, productBrand: productBrand, productName: productName, productImg: productImg, productPrice: productPrice