import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  final String notificationTxt;
  final String? importantTxt;
  final VoidCallback? onTap;
  NotificationCard({
    Key? key,
    required this.notificationTxt,
    this.importantTxt,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: const Color(0xFF0A157C).withOpacity(.05),
              borderRadius: BorderRadius.circular(10.r)),
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 5.r, backgroundColor: Get.theme.primaryColor),
              SizedBox(
                width: 5.w,
              ),
              Text(
                notificationTxt,
                style: TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
              ),
              importantTxt != null
                  ? Text(
                      importantTxt!,
                      style: TextStyle(
                          fontSize: 15.sp, color: Get.theme.primaryColor),
                      overflow: TextOverflow.clip,
                    )
                  : Container(),
              // RichText(
              //     overflow: TextOverflow.visible,
              //     text: TextSpan(
              //         text: notificationTxt,
              //         style:
              //             TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
              //         children: <TextSpan>[
              //           importantTxt != null
              //               ? TextSpan(
              //                   text: importantTxt,
              //                   style: TextStyle(
              //                       fontSize: 15.sp,
              //                       color: Get.theme.primaryColor))
              //               : TextSpan()
              //         ]))
            ],
          )),
    );
  }
}
