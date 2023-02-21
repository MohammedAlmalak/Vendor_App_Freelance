import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';

import '../routes/routes_name.dart';
import '../screens/notification/view/notification.dart';
import '../services/theme/app_assets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, this.title, this.elevation}) : super(key: key);
  final String? title;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leadingWidth: 150.w,
      toolbarHeight: 25.h,
      elevation: elevation ?? 3,
      backgroundColor: Colors.white,
      title: Text(
        title!,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: InkWell(
            onTap: () {
              navigateScree(NotificationScreen(), context);
              // Get.toNamed(Routes.notification);
            },
            child: SvgPicture.asset(
              AppAssets.alert,
              height: 25.h,
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.only(right: 13.w, left: 25.w),
        child: Row(
          children: [
            InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: SvgPicture.asset(
                AppAssets.drawer,
                height: 22.h,
              ),
            ),
            SizedBox(width: 13.w),
            Icon(
              Icons.search,
              color: Get.theme.primaryColor,
              size: 30.sp,
            )
          ],
        ),
      ),
    );
  }

  /*  @override
   Size get preferredSize => throw UnimplementedError(); */
  @override
  Size get preferredSize => Size.fromHeight(45.0.h);
}
