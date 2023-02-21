import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../common/getRowData.dart';

class CardDetails extends StatelessWidget {
  CardDetails({Key? key}) : super(key: key);
  final List<getRowData> row = [
    getRowData(
        customStyle: TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
        Label: 'orderno'.tr,
        txt: '0058964',
        Img: SvgPicture.asset(AppAssets.calender)),
    getRowData(
        customStyle: TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
        Label: 'ordertime'.tr,
        txt: '6:26 م',
        Img: SvgPicture.asset(AppAssets.time)),
    getRowData(
        customStyle: TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
        Label: 'thebranch'.tr,
        txt: 'الحياة مول',
        Img: SvgPicture.asset(AppAssets.building))
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle(
          style: TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
          child: Row(
            children: [
              Text('جاكيت'),
              SizedBox(width: 15.w),
              Text('adidas'),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        ...List.generate(
          3,
          (index) => row[index],
          //  DefaultTextStyle(
          //   style: TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
          //   child: row[index],
          // ),
        )
      ],
    );
  }

//   Row RowOfDetails(RowDetail data) {
//     return Row(
//       children: [
//         Container(width: 50.w, height: 20.h, child: Text(data.label!)),
//         SizedBox(width: 30.w),
//         data.icon!,
//         SizedBox(width: 14.w),
//         Text(data.text!),
//       ],
//     );
//   }
// }

// class RowDetail {
//   String? label;
//   String? text;
//   Widget? icon;
//   RowDetail({this.icon, this.label, this.text});
}
