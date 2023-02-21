import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/button_widget.dart';
import '../../../services/theme/app_assets.dart';
import '../../rowDialog.dart';
import '../controller/genderController.dart';

getgenderDialog() {
  return Get.defaultDialog(
    title: 'type'.tr,
    titleStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
    barrierDismissible: false,
    confirm: CommonButton(
      text: "done".tr,
      width: 100.w,
      height: 30.h,
      onTap: () {
        Get.back();
      },
    ),
    content: Container(
        width: 500.w,
        height: 290.h,
        child: GetBuilder<genderController>(
            init: genderController(),
            builder: ((controller) => ListView.separated(
                //physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                separatorBuilder: (c, i) => Divider(
                      endIndent: 10.w,
                      height: 5,
                      indent: 10.w,
                      color: Colors.black,
                    ),
                itemBuilder: (c, i) => RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(controller.data[i].name!),
                      groupValue: controller.gender,
                      onChanged: (x) {
                        controller.selectedGender(x);
                        // Get.find<ordersController>().genderFiltration(
                        //     Get.find<genderController>().gender);
                      },
                      value: controller.data[i].intValu!,
                    ),
                itemCount: controller.data.length)))),
  );
}

class genderDialog extends StatelessWidget {
  Function(int)? onGenderSelected;

  /// final void Function()? openDialog;
  genderDialog({
    Key? key,
    this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<genderController>(
      init: genderController(),
      builder: (controller) => RowDialog(
          ImgDialog: AppAssets.genderDialog,
          SelctedValue: controller.stringGender,
          openDialog: () async {
            await getgenderDialog();
            if (onGenderSelected != null) {
              onGenderSelected!(controller.gender);
            }
          }
          // openDialog ??
          //     () {
          //       getgenderDialog();
          //     }

          ),
    );
  }
}
