import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/date_picker_controller.dart';

class DatePickerWithContainer extends StatelessWidget {
  const DatePickerWithContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DateTimePickerController>(
      init: DateTimePickerController(),
      builder: (controller) => InkWell(
        onTap: () {
          controller.selectDate(context);
        },
        child: Container(
            // margin: EdgeInsets.all(5),
            //width: 114.w,
            //height: 25.h,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(6.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Text(
                    '${controller.selectedDate}',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Get.theme.primaryColor,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
