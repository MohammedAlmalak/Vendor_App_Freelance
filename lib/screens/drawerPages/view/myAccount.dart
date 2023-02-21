import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'profile'.tr,
      body: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFFF26511),
            backgroundImage: AssetImage(AppAssets.khalijiMan)),
        Text(
          "علي محمد خالد",
          style: TextStyle(color: Color(0xFF142E42), fontSize: 15.sp),
        ),
        SizedBox(
          height: 15.h,
        ),
        Expanded(
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0,
              leading: const Icon(
                Icons.person,
                color: Color(0xFFF26511),
              ),
              title: Text("editinformation".tr),
            ),
            Divider(
              height: 5.h,
              thickness: .5.h,
              color: Colors.grey,
              indent: 15.w,
              endIndent: 15.w,
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0,
              leading: const Icon(
                Icons.error_outline,
                color: Color(0xFFF26511),
              ),
              title: Text("reportaproblem".tr),
            ),
            Divider(
              height: 5.h,
              thickness: .5.h,
              color: Colors.grey,
              indent: 15.w,
              endIndent: 15.w,
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0,
              leading: const Icon(
                Icons.exit_to_app,
                color: Color(0xFFF26511),
              ),
              title: Text("signout".tr),
            ),
          ],
        ))
      ]),
    );
  }
}
