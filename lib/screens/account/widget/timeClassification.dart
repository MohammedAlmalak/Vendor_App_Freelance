import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/accountController.dart';

class timeClassification extends StatelessWidget {
  timeClassification({Key? key}) : super(key: key);
  final List<Map<int, String>> time = [
    {0: 'hourly'.tr},
    {1: 'daily'.tr},
    {2: 'weekly'.tr},
    {3: 'monthly'.tr}
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<accountController>(
            init: accountController(),
            builder: ((controller) => Row(
                  children: [
                    ...List.generate(
                        4,
                        (index) => Padding(
                              padding: EdgeInsets.only(left: 11.w),
                              child: InkWell(
                                onTap: () => controller
                                    .changeTimeStatus(time[index].keys.first),
                                child: Card(
                                    color: controller.timeStatus ==
                                            time[index].keys.first
                                        ? Get.theme.primaryColor
                                        : Colors.white,
                                    child: Container(
                                      width: 58.w,
                                      height: 22.h,
                                      child: Center(
                                        child: Text(
                                          time[index][index]!,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: controller.timeStatus ==
                                                      time[index].keys.first
                                                  ? Colors.white
                                                  : Get.theme.primaryColor),
                                        ),
                                      ),
                                    )),
                              ),
                            ))
                  ],
                ))));
  }
}
