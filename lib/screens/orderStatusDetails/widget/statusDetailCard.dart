import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';
import '../../../common/getRowData.dart';

import '../../../services/theme/app_assets.dart';
import '../../oeders/widget/orderButtons.dart';

class StatusDetailCard extends StatelessWidget {
  final Order order;
  StatusDetailCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      padding: const EdgeInsets.all(8),
      height: 255.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5), blurRadius: 2.0,
              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 45.h,
                //   width: 45.w,
                //   decoration: BoxDecoration(
                //       color: Get.theme.primaryColor,
                //       borderRadius: BorderRadius.circular(12.r)),
                //   child: Center(child: prod.productCategoryIcon!),
                // ),

                Text(order.orderProduct.productName! +
                    " " +
                    order.orderProduct.productBrand!.brandName!),
                Text(
                  "theprice".tr +
                      " " +
                      order.orderProduct.productPrice.toString() +
                      " " +
                      "ksacurrency".tr,
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
                ),
                SizedBox(
                  height: 25.h,
                ),
                getRowData(
                    Label: 'orderstatus'.tr,
                    Img: Container(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 1,
                        backgroundColor: getStatusColor(),
                      ),
                    ),
                    //txt: "Firas",
                    txt: order.orderStatus!),
                // txt: order.orderStatus != null ? order.orderStatus! : " "),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    Label: 'orderno'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.calender,
                    ),
                    txt: "0" + order.orderId.toString() + "055684"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    Label: 'ordertime'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.secCalender,
                    ),
                    txt: "11/6/2022"),
                SizedBox(
                  height: 5.h,
                ),
                getRowData(
                    Label: 'receipttime'.tr,
                    Img: SvgPicture.asset(
                      AppAssets.clock,
                      color: Get.theme.primaryColor,
                    ),
                    txt: "   06:40 م"),
                SizedBox(
                  height: 10.h,
                ),
                if (order.orderStatus == "قيد التجهيز")
                  orderButtons(
                      btnWidth: 175.w, txt: "theorderhasbeenprepared".tr),
                if (order.orderStatus == "جاهز للتسليم")
                  orderButtons(
                      btnWidth: 175.w,
                      backGroungColor: Colors.green,
                      txt: "theorderhasbeendelivered".tr),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 100.h,
              width: 100.w,
              child: Image.asset(order.orderProduct.productImg!),
            ),
          )
        ],
      ),
    );
  }

  Color getStatusColor() {
    if (order.orderStatusInt == 0) {
      return Color(0xff2FB4BD);
    } else if (order.orderStatusInt == 1) {
      return Color.fromARGB(255, 25, 23, 182);
    } else if (order.orderStatusInt == 2) {
      return Get.theme.primaryColor;
    } else {
      return Color(0xFFDF3939);
    }
  }
}
