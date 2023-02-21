import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Clasifaction extends StatelessWidget {
  const Clasifaction({Key? key, required this.clasifaction}) : super(key: key);
  final List clasifaction;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            clasifaction.length,
            (i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SvgPicture.asset(clasifaction[i]))),
        Expanded(child: SizedBox(width: 20.w)),
        Expanded(
            child: InkWell(
                onTap: () => Get.back(), child: Icon(Icons.arrow_forward_ios)))
      ],
    );
  }
}
