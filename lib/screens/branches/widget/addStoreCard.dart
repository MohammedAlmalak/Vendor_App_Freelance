import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/branches/view/addStore.dart';

import '../../../routes/routes_name.dart';

class addStoreCard extends StatelessWidget {
  const addStoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateScree(addStore(), context);
        // Get.toNamed(Routes.addStore);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0.r,
              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          // border:
          //     Border.all(width: .5, color: const Color(0xFFBDBDBD)),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xFFF26511),
              ),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: const Icon(
              Icons.add,
              size: 70,
              color: Color(0xFFF26511),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "addStore".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Color(0xFFF26511),
            ),
          ),
        ]),
      ),
    );
  }
}
