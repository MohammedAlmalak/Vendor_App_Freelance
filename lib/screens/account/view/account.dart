import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/screens/account/view/overView.dart';
import 'package:vendor_app_freelance/screens/account/view/productSales.dart';
import 'package:vendor_app_freelance/screens/account/widget/overviewAndSalesBar.dart';
import 'package:vendor_app_freelance/screens/account/widget/timeClassification.dart';

import '../controller/accountController.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'account'.tr,
      elevation: 1,
      body: Column(
        children: [
          overviewAndSalesBar(),
          SizedBox(height: 20.h),
          timeClassification(),
          SizedBox(height: 25.h),
          GetBuilder<accountController>(
              init: accountController(),
              builder: ((controller) => Expanded(
                  child: controller.isOveriew == true
                      ? overView()
                      : productSales()))),
          SizedBox(height: 55.h),
        ],
      ),
    );
  }
}
