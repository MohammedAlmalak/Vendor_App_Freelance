import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TitleWithTextField extends StatelessWidget {
  TitleWithTextField({
    Key? key,
    required this.title,
    this.child,
    this.icon,
    this.width,
    this.hight,
    this.showTitle = true,
    this.txtController,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final Widget? child;
  final Widget? icon;
  final double? width;
  final double? hight;
  final bool? showTitle;
  final TextEditingController? txtController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showTitle!)
          Text(
            title,
            style: TextStyle(color: Color(0xff575757)),
          ),
        icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: icon!,
              )
            : SizedBox(width: 10.w),
        Container(
            width: width ?? 130.w.w,
            height: hight ?? 24.h,
            /*    decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffDFE3E9))), */
            child: child ??
                TextField(
                  onChanged: onChanged ?? (value) {},
                  controller: txtController,
                  textAlignVertical: TextAlignVertical.center,
                  style:
                      TextStyle(fontSize: 15.sp, color: Get.theme.primaryColor),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffDFE3E9), width: 1)),
                  ),
                )),
      ],
    );
  }
}
