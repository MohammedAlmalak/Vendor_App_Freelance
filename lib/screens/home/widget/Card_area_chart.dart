import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';
import '../../../common/date_picker_container.dart';
import 'area_chart_gradiant.dart';

class CardAreaChart extends StatelessWidget {
  const CardAreaChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.all(10.sp),
        //width: 375.w,
        height: 201.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text('salesaverage'.tr,
                    //'معدل المبيعات',
                    style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 18.w),
                DatePickerWithContainer(),
              ],
            ),
            SizedBox(height: 2.h),
            Expanded(child: AreaChartGradiant()),
          ],
        ),
      ),
    );
  }
}
