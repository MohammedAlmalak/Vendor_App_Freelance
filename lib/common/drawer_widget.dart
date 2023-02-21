import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/drawerPages/view/languages.dart';
import 'package:vendor_app_freelance/screens/drawerPages/view/myAccount.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: .08.sh),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   child: const Text(
          //     "شخصي",
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),
          // ),
          ListTile(
            onTap: () {
              navigateScree(MyAccount(), context);
            },
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.account_circle_outlined,
              color: Color(0xFFF26511),
            ),
            title: Text("myaccount".tr),
          ),
          // ListTile(
          //   onTap: () {},
          //   horizontalTitleGap: 0,
          //   leading: const Icon(
          //     Icons.receipt_long_outlined,
          //     color: Color(0xFFF26511),
          //   ),
          //   title: const Text("سجل الطلبات"),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   child: const Text(
          //     "عام",
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),
          // ),
          ListTile(
            onTap: () {
              navigateScree(languages(), context);
            },
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.language_outlined,
              color: Color(0xFFF26511),
            ),
            title: Text("languages".tr),
          ),
          ListTile(
            onTap: () {},
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.settings_outlined,
              color: Color(0xFFF26511),
            ),
            title: Text("settings".tr),
          ),
          ListTile(
            onTap: () {},
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.help_outline,
              color: Color(0xFFF26511),
            ),
            title: Text("help".tr),
          ),
          ListTile(
            onTap: () {},
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Color(0xFFF26511),
            ),
            title: Text("privacypolicy".tr),
          ),
        ],
      ),
    );
  }
}
