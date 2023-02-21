import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/screens/myProduct/widget/productSalesPercentage%20.dart';

import '../../../common/date_picker_container.dart';

class cardProdSalesPer extends StatelessWidget {
  const cardProdSalesPer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        // margin: EdgeInsets.all(10.sp),
        //width: 375.w,
        width: double.infinity,
        height: 220.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 140.w, child: DatePickerWithContainer()),
            Center(
              child: Text('productsalespercentage'.tr,
                  style: TextStyle(
                      color: Color(0xFF27445F),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 2.h),
            Expanded(child: productSalesPercentage()),
          ],
        ),
      ),
    );
  }
}
