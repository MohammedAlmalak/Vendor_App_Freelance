import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/button_widget.dart';
import '../../../services/theme/app_assets.dart';
import '../../rowDialog.dart';
import '../controller/categoryController.dart';

getcategoryDialog() {
  return Get.defaultDialog(
      title: 'categories'.tr,
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
        child: GetBuilder<categoryController>(
          init: categoryController(),
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
              itemCount: controller.categoryList.length,
              itemBuilder: (c, i) => CheckboxListTile(
                  title: Text(controller.categoryList[i].name!),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.categoryList[i].boolValue!,
                  onChanged: (x) {
                    controller.selectedCategory(
                        controller.categoryList[i].intValu!, x!);
                    // Get.find<ordersController>().categoryFiltration(
                    //     Get.find<categoryController>().selectedCat);
                  }))),
        ),
      ));
}

class CategoryDialog extends StatelessWidget {
  final Function(List<int>)? onSelectedCategory;
  CategoryDialog({
    Key? key,
    this.onSelectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<categoryController>(
      init: categoryController(),
      builder: (controller) => RowDialog(
          ImgDialog: AppAssets.categoryDialog,
          SelctedValue: controller.category,
          openDialog: () async {
            await getcategoryDialog();
            if (onSelectedCategory != null) {
              onSelectedCategory!(controller.selectedCat);
            }
          }),
    );
  }
}
