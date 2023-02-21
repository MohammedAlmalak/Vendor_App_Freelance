import 'package:flutter/material.dart';

class brand {
  String? brandName;
  String? brandImg;
  String? brandDistance;
  Widget? nxtScreen;
  Icon? brandCategoryIcon;
  String brandCategory;
  String? brandLocation;
  int? brandLocationId;
  List<String>? brandItems;

  brand({
    this.brandName,
    this.brandImg,
    this.brandDistance,
    this.nxtScreen,
    this.brandCategoryIcon,
    required this.brandCategory,
    this.brandLocation,
    this.brandLocationId,
    this.brandItems,
  });
}
