import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../services/theme/app_assets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 13.w, left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.drawer,
                height: 22.h,
              ),
              SizedBox(width: 13.w),
              Icon(
                Icons.search,
                color: Get.theme.primaryColor,
                size: 30.sp,
              )
            ],
          ),
          Text(title ?? '',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
          SvgPicture.asset(
            AppAssets.alert,
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
