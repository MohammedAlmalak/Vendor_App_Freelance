import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vendor_app_freelance/screens/account/view/account.dart';
import 'package:vendor_app_freelance/screens/home/view/home.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/my_product.dart';
import 'package:vendor_app_freelance/services/theme/app_Icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../screens/addProducr/view/addProduct.dart';
import '../../../screens/oeders/view/orders_screen.dart';

class NavBarController extends GetxController {
  late PersistentTabController navBarController;

  NavBarController() {
    navBarController = PersistentTabController(initialIndex: 1);
  }

  List<Widget> buildScreens() {
    return [
      MyProduct(),
      HomeView(),
      AddProduct(),
      OrdersScreen(),
      Account(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          MyIcons.myitems_navbar,
        ),
        /* SvgPicture.asset(
          AppAssets.myItemNavBar,
          width: 25.w,
          height: 25.h,
        ), */
        textStyle: TextStyle(fontSize: 11.sp),
        title: ("myproducts".tr),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          MyIcons.home_navbar,
        ),
        /* SvgPicture.asset(
          AppAssets.homeNavBAr,
          width: 25.w,
          height: 25.h,
        ), */
        contentPadding: 0,
        title: ("home".tr),
        textStyle: TextStyle(fontSize: 11.sp),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          MyIcons.add_navbar,
          // Icons.add_circle_outline,
          size: 38,
        ),
        /* SvgPicture.asset(AppAssets.addNavBAr), */
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          MyIcons.orders_navbar,
        ),
        /* SvgPicture.asset(
          AppAssets.ordersNvBar,
          width: 25.w,
          height: 25.h,
        ), */
        title: ("orders".tr),
        textStyle: TextStyle(fontSize: 11.sp),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          MyIcons.account_navbar,
        ),
        /*  SvgPicture.asset(
          AppAssets.accountNavBAr,
          width: 25.w,
          height: 25.h,
        ), */
        title: ("account".tr),
        textStyle: TextStyle(fontSize: 11.sp),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
