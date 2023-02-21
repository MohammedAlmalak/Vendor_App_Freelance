import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import '../../../common/button_widget.dart';
import '../../../common/card_widget.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    Key? key,
    required this.prod,
    // this.productname,
    // this.brandName,
    // this.price,
    // this.image,
    this.onViewTap,
    this.withTwoBtns,
    this.onEditBtnTap,
    this.onReportBtnTap,
  }) : super(key: key);
  final Product prod;
  // final String? productname;
  // final String? brandName;
  // final String? price;
  // final String? image;
  final VoidCallback? onViewTap;
  bool? withTwoBtns = false;
  final VoidCallback? onEditBtnTap;
  final VoidCallback? onReportBtnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 110.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5), blurRadius: 2.0,
              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(prod.productName! + " " + prod.productBrand!.brandName!),
                  Text(
                    "theprice".tr +
                        " " +
                        prod.productPrice.toString() +
                        " " +
                        "ksacurrency".tr,
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
                  ),
                  SizedBox(height: 10.h),
                  withTwoBtns == false
                      ? CommonButton(
                          text: 'view'.tr,
                          width: 60.w,
                          height: 20.h,
                          onTap: () => onViewTap!(),
                        )
                      : Row(
                          children: [
                            CommonButton(
                              text: 'edit'.tr,
                              width: 65.w,
                              height: 20.h,
                              onTap: () => onEditBtnTap!(),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CommonButton(
                              text: 'report'.tr,
                              width: 65.w,
                              height: 20.h,
                              onTap: () => onReportBtnTap!(),
                            ),
                          ],
                        )
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Container(
                      width: 90.w,
                      child: Image.asset(
                        prod.productImg!,
                        fit: BoxFit.contain,
                      )),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
