import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';

import '../../../common/appbar_widget.dart';
import '../../../common/getRowData.dart';
import '../../../services/theme/app_assets.dart';

class productSalesDetails extends StatelessWidget {
  productSalesDetails({
    Key? key,
    this.argumentOrderData,
  }) : super(key: key);
  final Order? argumentOrderData;
  // Order argumentOrderData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "account".tr,
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Card(
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                        child: argumentOrderData!
                            .orderProduct.productCategoryIcon!),
                  ),
                  backButton(),
                ],
              ),
              SizedBox(
                height: 250.h,
                width: 250.w,
                child: Image.asset(argumentOrderData!.orderProduct.productImg!),
              ),
              SizedBox(
                height: 10.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'productname'.tr,
                  txt: argumentOrderData!.orderProduct.productName!),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'trademark'.tr,
                  txt:
                      argumentOrderData!.orderProduct.productBrand!.brandName!),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'type'.tr,
                  Img: SvgPicture.asset(
                    AppAssets.tshertLogo,
                    color: Get.theme.primaryColor,
                  ),
                  txt: argumentOrderData!.orderProduct.productName!),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'thebranch'.tr,
                  Img: SvgPicture.asset(AppAssets.building),
                  txt: argumentOrderData!
                      .orderProduct.productBrand!.brandLocation!),
              SizedBox(
                height: 5.h,
              ),
              argumentOrderData!.orderProduct.productColor != null
                  ? getRowData(
                      labelWidth: 90,
                      Label: 'color'.tr,
                      Img: SvgPicture.asset(AppAssets.blackCheck),
                      txt: argumentOrderData!.orderProduct.productColor!)
                  : Container(),
              SizedBox(
                height: 5.h,
              ),
              argumentOrderData!.orderProduct.productSize != null
                  ? getRowData(
                      labelWidth: 90,
                      Label: 'size'.tr,
                      Img: SvgPicture.asset(
                        AppAssets.ML,
                        color: Get.theme.primaryColor,
                      ),
                      txt: argumentOrderData!.orderProduct.productSize!)
                  : Container(),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'theprice'.tr,
                  Img: SvgPicture.asset(AppAssets.label),
                  txt: argumentOrderData!.orderProduct.productPrice.toString() +
                      " " +
                      "ksacurrency".tr),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'orderno'.tr,
                  Img: SvgPicture.asset(AppAssets.calender),
                  txt: argumentOrderData!.orderId.toString()),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'ordertime'.tr,
                  Img: SvgPicture.asset(
                    AppAssets.clock,
                    color: Get.theme.primaryColor,
                  ),
                  txt: argumentOrderData!.orderTime!),
              SizedBox(
                height: 5.h,
              ),
              getRowData(
                  labelWidth: 90,
                  Label: 'receipttime'.tr,
                  Img: SvgPicture.asset(
                    AppAssets.clock,
                    color: Get.theme.primaryColor,
                  ),
                  txt: argumentOrderData!.receiptTime!),
            ]),
          ),
        ),
      ]),
    );
  }
}
