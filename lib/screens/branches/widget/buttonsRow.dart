import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/screens/branches/controller/branchesController.dart';

import '../../../common/button_widget.dart';

class buttonsRow extends StatelessWidget {
  const buttonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<branchesController>(
      init: branchesController(),
      builder: (controller) => Container(
        height: 60.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              onTap: () {
                controller.changeMode(false);
              },
              text: 'stores'.tr,
              txtStyle: TextStyle(
                color: controller.isEditMode == false
                    ? Colors.white
                    : Color(0xffEF723C),
                fontSize: 10.sp,
              ),
              width: 150.w,
              height: 30.h,
              backGroungColor: controller.isEditMode == false
                  ? Color(0xffEF723C)
                  : Colors.white,
            ),
            // Container(
            //   width: 150.w,
            //   height: 30.h,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       controller.changeMode(false);
            //     },
            //     child: Text(
            //       "متاجر",
            //       style: TextStyle(
            //         color: controller.isEditMode == false
            //             ? Colors.white
            //             : Color(0xffEF723C),
            //         fontSize: 10.sp,
            //       ),
            //     ),
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            //         (Set<MaterialState> states) {
            //           if (states.contains(MaterialState.pressed))
            //             return Theme.of(context)
            //                 .colorScheme
            //                 .primary
            //                 .withOpacity(0.5);
            //           return controller.isEditMode == false
            //               ? Color(0xffEF723C)
            //               : Colors.white; // Use the component's default.
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 10.w,
            ),
            CommonButton(
              onTap: () {
                controller.changeMode(true);
              },
              text: "edit".tr,
              txtStyle: TextStyle(
                color: controller.isEditMode == true
                    ? Colors.white
                    : Color(0xffEF723C),
                fontSize: 10.sp,
              ),
              width: 150.w,
              height: 30.h,
              backGroungColor: controller.isEditMode == true
                  ? Color(0xffEF723C)
                  : Colors.white,
            ),
            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       controller.changeMode(true);
            //     },
            //     child: Text(
            //       "تعديل",
            //       style: TextStyle(
            //         color: controller.isEditMode == true
            //             ? Colors.white
            //             : Color(0xffEF723C),
            //         fontSize: 10.sp,
            //       ),
            //     ),
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            //         (Set<MaterialState> states) {
            //           if (states.contains(MaterialState.pressed))
            //             return Theme.of(context)
            //                 .colorScheme
            //                 .primary
            //                 .withOpacity(0.5);
            //           return controller.isEditMode == true
            //               ? Color(0xffEF723C)
            //               : Colors.white; // Use the component's default.
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
