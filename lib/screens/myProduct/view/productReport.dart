import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/card_widget.dart';
import 'package:vendor_app_freelance/common/linear_progress_rate.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/screens/myProduct/widget/cardProdSalesPer.dart';

import '../../../common/getRowData.dart';
import '../../../services/theme/app_assets.dart';
import '../../home/widget/most_place_bay.dart';

class ProductReport extends StatelessWidget {
  ProductReport({
    Key? key,
    this.argumentProdData,
  }) : super(key: key);
  final Product? argumentProdData;
  // product argumentProdData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'myproducts'.tr,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 250.h,
                width: double.infinity,
                child: Image.asset(argumentProdData!.productImg!),
              ),
            ),
            Positioned.directional(
                top: 10,
                end: 10,
                textDirection: Directionality.of(context),
                child: backButton()),
          ]),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  argumentProdData!.productName! +
                      " " +
                      argumentProdData!.productBrand!.brandName!,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xff575757),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "theprice".tr +
                      " " +
                      argumentProdData!.productPrice.toString() +
                      " " +
                      "ksacurrency".tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff575757),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                getRowData(
                    labelWidth: 130,
                    Label: 'orderstatus'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.greenCircle,
                    ),
                    txt: "تم التسليم"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    labelWidth: 130,
                    Label: 'orderno'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.calender,
                    ),
                    txt: "0058964"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    labelWidth: 130,
                    Label: 'ordertime'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.clock,
                      color: Get.theme.primaryColor,
                    ),
                    txt: "06:26 م"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    labelWidth: 130,
                    Label: 'receipttime'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.secCalender,
                    ),
                    txt: "11/6/2022   06:40 م"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    labelWidth: 130,
                    Label: 'thebranch'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.building,
                    ),
                    txt: argumentProdData!.productBrand!.brandLocation!),
              ],
            ),
          ),
          cardProdSalesPer(),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CardWidget(
                radius: 10.r,
                width: 343.w,
                height: 232.h,
                child: Column(
                  children: [
                    Text(
                      'productsalesratiotobranches'.tr,
                      style:
                          TextStyle(fontSize: 17.sp, color: Color(0xff27445F)),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Get.theme.primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('storename'.tr), Text('product'.tr)],
                        ),
                      ),
                    ),
                    ...List.generate(
                        mostBuy.length,
                        (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('${mostBuy[index].place}')),
                                    //  SizedBox(width: 26.w),
                                    Expanded(
                                        flex: 4,
                                        child: LinearProgressRate(
                                          color: Get.theme.primaryColor,
                                          width: 200.w,
                                          percentage:
                                              mostBuy[index].parcentage! * 2,
                                          numPar: mostBuy[index].parcentage!,
                                        )),
                                  ],
                                ),
                              ),
                            ))
                  ],
                )),
          ),
          Container(
            height: 80.h,
          )
        ],
      ),
    );
  }

  final List<MostPlassBuy> mostBuy = [
    MostPlassBuy(
      place: 'الخبر',
      parcentage: 43,
    ),
    MostPlassBuy(
      place: 'الرياض',
      parcentage: 33,
    ),
    MostPlassBuy(
      place: 'جدة',
      parcentage: 65,
    ),
    MostPlassBuy(
      place: 'تبوك',
      parcentage: 18,
    ),
  ];
}
