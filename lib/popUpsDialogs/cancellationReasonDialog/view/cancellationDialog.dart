import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/button_widget.dart';
import '../controller/cancellationController.dart';

cancellationReasonDialog() {
  return Get.defaultDialog(
    title: 'cancellationreason'.tr,
    titleStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
    content: Container(
        width: 500.w,
        height: 370.h,
        child: GetBuilder<cancellationController>(
            init: cancellationController(),
            builder: ((controller) =>
                ListView(physics: BouncingScrollPhysics(), children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (c, i) => RadioListTile(
                          title: Text(controller.data[i].name!),
                          // controlAffinity: ListTileControlAffinity.trailing,
                          value: controller.data[i].value!,
                          groupValue: controller.reason,
                          onChanged: (x) {
                            controller.selectedBranch(x.toString());
                          }),
                      itemCount: controller.data.length),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextField(
                      enabled: controller.reason == 'أسباب أخرى' ? true : false,
                      maxLines: 3,
                      maxLength: 100,
                      // textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                          fontSize: 15.sp, color: Get.theme.primaryColor),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffDFE3E9), width: 1)),
                      ),
                    ),
                  ),
                  CommonButton(
                    text: 'send'.tr,
                    width: 400.w,
                    height: 45.h,
                    onTap: () {
                      Get.back();
                    },
                  )
                ])))),
  );
}
