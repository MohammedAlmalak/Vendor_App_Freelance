import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RowDialog extends StatelessWidget {
  final String ImgDialog;
  final String SelctedValue;
  final VoidCallback openDialog;
  RowDialog({
    Key? key,
    required this.ImgDialog,
    required this.SelctedValue,
    required this.openDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openDialog(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xFFBDBDBD),
            ),
            borderRadius: BorderRadius.circular(8.r)),
        height: 30.h,
        child: Row(
          children: [
            SizedBox(
              height: 15.h,
              width: 15.w,
              child: SvgPicture.asset(
                ImgDialog,
                fit: BoxFit.contain,
                color: Get.theme.primaryColor,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              SelctedValue.toString(),
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
