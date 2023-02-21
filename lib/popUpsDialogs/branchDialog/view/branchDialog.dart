import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/button_widget.dart';

import '../../../services/theme/app_assets.dart';
import '../../rowDialog.dart';
import '../controller/branchController.dart';

getbranchDialog() {
  return Get.defaultDialog(
    title: 'thebranch'.tr,
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
        child: GetBuilder<branchController>(
            init: branchController(),
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
                    title: Text(controller.data[i].name!),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: controller.data[i].intValu!,
                    groupValue: controller.branch,
                    onChanged: (x) {
                      controller.selectedBranch(x);
                    }),
                itemCount: controller.data.length)))),
  );
}

class branchDialog extends StatelessWidget {
  Function(int)? onBranchSelected;
  branchDialog({Key? key, this.onBranchSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<branchController>(
      init: branchController(),
      builder: (controller) => RowDialog(
          ImgDialog: AppAssets.building,
          SelctedValue: controller.stringbranch,
          openDialog: () async {
            await getbranchDialog();
            if (onBranchSelected != null) {
              onBranchSelected!(controller.branch);
            }
          }),
    );
  }
}
