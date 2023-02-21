import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/button_widget.dart';
import '../../../services/theme/app_assets.dart';
import '../../rowDialog.dart';
import '../controller/orderStatusController.dart';

getorderStatusDialog() {
  return Get.defaultDialog(
    title: 'orderstatus'.tr,
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
        child: GetBuilder<orderStatusController>(
            init: orderStatusController(),
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
                    groupValue: controller.status,
                    onChanged: (x) {
                      controller.selectedStatus(x);
                    }),
                itemCount: controller.data.length)))),
  );
}

class orderStatusDialog extends StatelessWidget {
  Function(int)? onStatusSelected;

  orderStatusDialog({
    Key? key,
    this.onStatusSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<orderStatusController>(
        init: orderStatusController(),
        builder: ((controller) => RowDialog(
            ImgDialog: AppAssets.orderStatus,
            SelctedValue: controller.stringStatus,
            openDialog: () async {
              await getorderStatusDialog();
              if (onStatusSelected != null) {
                onStatusSelected!(controller.status);
              }
            })));
  }
}
