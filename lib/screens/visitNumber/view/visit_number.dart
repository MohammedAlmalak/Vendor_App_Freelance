import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/appbar_widget.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/datePicker_widget.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/screens/visitNumber/widget/area_Chart.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';

class VisitNumber extends StatelessWidget {
  VisitNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'visitsno'.tr,
      body: ListView(
        children: [
          SizedBox(height: 10.h),
          DatePickerWidget(),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //     onTap: () => branchDialog(),
                  //     child: SvgPicture.asset(AppAssets.branch)),
                  branchDialog(
                    onBranchSelected: (val) {},
                  ),
                  backButton()
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 208.h,
            child: AreaChart(),
          ),
        ],
      ),
    );
  }
}
