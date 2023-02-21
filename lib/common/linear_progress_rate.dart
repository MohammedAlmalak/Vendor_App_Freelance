import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearProgressRate extends StatelessWidget {
  const LinearProgressRate(
      {Key? key,
      this.percentage = 50,
      this.width,
      this.numPar,
      this.color,
      this.number})
      : super(key: key);
  final double? percentage;
  final double? numPar;
  final double? width;
  final Color? color;
  final double? number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Container(
                width: width ?? 100.w,
                height: 8.h,
                decoration: BoxDecoration(
                    color: Color(0xffEDEFF1),
                    borderRadius: BorderRadius.circular(15.r)),
              ),
              Container(
                width: number != null ? number!.w * 2 : percentage!.w,
                height: 8.h,
                decoration: BoxDecoration(
                    color: color ?? Color(0xff2FB4BD),
                    borderRadius: BorderRadius.circular(15.r)),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Text(
            '${number != null ? '' : '%'} ${number != null ? number!.toInt() : numPar != null ? numPar!.toInt() : percentage!.toInt()}'),
      ],
    );
  }
}
