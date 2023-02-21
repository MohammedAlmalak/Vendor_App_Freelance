import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/accountController.dart';

class overviewAndSalesBar extends StatelessWidget {
  const overviewAndSalesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.sp),
            bottomRight: Radius.circular(8.sp),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: GetBuilder<accountController>(
            init: accountController(),
            builder: ((controller) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeTap(true);
                      },
                      child: Text(
                        "Overview".tr,
                        //'نظرة عامة',
                        style: TextStyle(
                            color: controller.isOveriew == true
                                ? Get.theme.primaryColor
                                : Color(0xFF27445F)),
                      ),
                    ),
                    SizedBox(width: 31.w),
                    InkWell(
                      onTap: () {
                        controller.changeTap(false);
                      },
                      child: Text(
                        'productssales'.tr,
                        style: TextStyle(
                            color: controller.isOveriew == true
                                ? Color(0xFF27445F)
                                : Get.theme.primaryColor),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
