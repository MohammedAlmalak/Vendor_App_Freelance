import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/controllers/date_picker_controller.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DateTimePickerController>(
      init: DateTimePickerController(),
      builder: (controller) => Container(
        height: 32.h,
        child: GestureDetector(
          onTap: () {
            controller.selectDate(context);
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Icon(
              Icons.arrow_left_rounded,
              color: Get.theme.primaryColor,
            ),
            Row(children: [
              Icon(
                Icons.arrow_drop_down,
                color: Colors.grey[600],
              ),
              Text('${controller.selectedDate}')
            ]),
            Icon(Icons.arrow_right_rounded, color: Get.theme.primaryColor),
          ]),
        ),
      ),
    );
  }
}
