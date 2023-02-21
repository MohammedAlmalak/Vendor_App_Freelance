import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({Key? key, this.onPressed, required this.isSelected})
      : super(key: key);
  final void Function(int)? onPressed;
  final List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.h,
      width: 116.w,
      child: ToggleButtons(
        // borderColor: Colors.black,
        fillColor: Get.theme.primaryColor,
        //borderWidth: 2,
        // selectedBorderColor: Colors.black,
        selectedColor: Colors.white,
        color: Get.theme.primaryColor,

        borderRadius: BorderRadius.circular(10.r),
        children: <Widget>[
          Text(
            'number'.tr,
            style: TextStyle(fontSize: 12.sp),
          ),
          Text(
            'percent'.tr,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
        onPressed: onPressed ?? (int index) {},
        isSelected: isSelected,
        //isSelected: isSelected,
      ),
    );
  }
}
