import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';
import 'package:vendor_app_freelance/screens/allReport/view/all_Report_scree.dart';

class RowText extends StatelessWidget {
  const RowText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ordersstatus".tr,
          //'حالة الطلبات',
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
              color: Get.theme.primaryColor),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                navigateScree(AllReport(), context);
                // Get.toNamed(Routes.allReport);
              },
              child: Text(
                'viewreports'.tr,
                // 'عرض التقارير',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Get.theme.primaryColor.withOpacity(0.7)),
              ),
            ),
            Icon(
              Icons.arrow_right,
              size: 30.sp,
              color: Get.theme.primaryColor,
            )
          ],
        ),
      ],
    );
  }
}
