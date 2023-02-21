import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getRowData extends StatelessWidget {
  String Label;
  double? labelWidth;
  Widget? Img;
  String txt;
  TextStyle? customStyle;
  getRowData({
    Key? key,
    required this.Label,
    this.labelWidth,
    this.Img,
    required this.txt,
    this.customStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: labelWidth ?? 75.w,
            height: 25.h,
            child: Text(
              Label,
              style: customStyle ??
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            )),
        SizedBox(width: 20.w),
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: Img != null ? Img! : Container(),
        ),
        SizedBox(width: 12.w),
        Text(
          txt,
          style: TextStyle(fontSize: 13.sp),
        ),
      ],
    );
  }
}
