import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/ratingBar.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/branches/view/addStore.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/my_product.dart';

import '../../../common/button_widget.dart';
import '../../../services/theme/app_assets.dart';
import '../controller/branchesController.dart';
import '../view/branchProducts.dart';

class BranchCard extends StatelessWidget {
  final String branchName;
  final List<String> storeItems;
  BranchCard({
    Key? key,
    required this.branchName,
    required this.storeItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.r,
            offset: Offset(1, 2), // shadow direction: bottom right
          )
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: Image.asset(
                AppAssets.branchCard,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              branchName,
            ),
            SizedBox(
              height: 5.h,
            ),
            Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                runSpacing: 5,
                children: storeItems
                    .map((e) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          decoration: BoxDecoration(
                              color: Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Text(
                            e,
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 13.sp,
                                color: Colors.white),
                          ),
                        ))
                    .toList()),
            SizedBox(
              height: 5.h,
            ),
            RatingBarWidget(
              itemSize: 12,
            ),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder<branchesController>(
                // init: branchesController(),the controller has been initialized in buttonsRow()
                builder: (controller) => controller.isEditMode == false
                    ? CommonButton(
                        text: 'view'.tr,
                        width: 70.w,
                        height: 22.h,
                        onTap: () {
                          navigateScree(MyProduct(), context);
                        },
                      )
                    : SizedBox(
                        height: 22.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonButton(
                              onTap: () {
                                navigateScree(addStore(), context);
                                // Get.toNamed(Routes.addStore);
                              },
                              text: "edit".tr,
                              width: 60.w,
                              height: 22.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                navigateScree(BranchProducts(), context);

                                // Get.toNamed(Routes.branchProducts);
                              },
                              child: Text(
                                "products".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffEF723C),
                                    fontSize: 10.sp),
                              ),
                            )
                          ],
                        ),
                      ))
          ]),
    );
  }
}
