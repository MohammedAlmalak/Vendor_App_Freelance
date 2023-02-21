import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';

import '../../branches/view/branches.dart';
import '../../visitNumber/view/visit_number.dart';

class BuildCardListTile extends StatelessWidget {
  const BuildCardListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListTileVisitCard(
              title: 'visits'.tr,
              number: 345,
              subTitle: 'visit'.tr,
              onTap: () {
                navigateScree(VisitNumber(), context);

                // Get.toNamed(Routes.visitNumber);
              }),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListTileVisitCard(
              title: 'branches'.tr,
              number: 23,
              subTitle: 'branch'.tr,
              onTap: () {
                navigateScree(Branches(), context);
                // Get.toNamed(Routes.branches);
              }),
        ),
      ],
    );
  }

  Widget ListTileVisitCard(
      {String? title, num? number, String? subTitle, void Function()? onTap}) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      color: Color(0xffFCFCFC),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          // offset: Offset(0, 0), //(x,y)
          blurRadius: 2,
        ),
      ],
    );
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        decoration: boxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 4.w,
              height: 178.h,
              color: Get.theme.primaryColor,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '$title',
                style: TextStyle(fontSize: 12.sp, color: Color(0xff27445F)),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n${number}',
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: '\n${subTitle}'),
                ],
              ),
            ),
            // Text('عدد الزيارات\n 376\n زيارة'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Container(
                width: 29.w,
                height: 29.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFF4F03).withOpacity(0.37),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
