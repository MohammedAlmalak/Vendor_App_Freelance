import 'package:flutter/material.dart';
import 'package:vendor_app_freelance/screens/feedback/widget/feedBackCard_widget.dart';
import 'brand.dart';

class Product {
  int? productID;
  brand? productBrand;
  String? productName;
  String? productImg;
  double? productPrice;
  double? productNewPrice;
  String? productSize;
  // colorRow? productColor;
  Widget? nxtScreen;
  int? productDemand;
  double? salePercentage;
  String? productColor;
  Icon? productCategoryIcon;
  int? productCtegory;
  int? productGender;
  FeedBackData? feedData;
  Product({
    this.productID,
    this.productBrand,
    // this.productCategory,
    // this.brandName,
    // this.brandImg,
    // this.brandDistance,
    this.productName,
    this.productImg,
    this.productPrice,
    this.productNewPrice,
    this.productSize,
    // this.productColor,
    this.nxtScreen,
    //  this.proCol,
    this.productDemand,
    this.salePercentage,
    this.productColor,
    this.productCategoryIcon,
    this.productCtegory,
    this.productGender,
    this.feedData,
  });
}
