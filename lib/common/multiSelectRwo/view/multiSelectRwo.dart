import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/button_widget.dart';
import 'package:vendor_app_freelance/popUpsDialogs/radiioData.dart';
import '../controller/multiSelectRwoCon.dart';

class multiSelectRwo extends StatelessWidget {
  String title;
  List<RadioData> optionsList;
  final void Function(List<RadioData>)? onConfirm;
  multiSelectRwo({
    Key? key,
    required this.title,
    required this.optionsList,
    this.onConfirm,
  }) : super(key: key);
  multiSelectRwoCon controller = Get.put(multiSelectRwoCon());
  @override
  Widget build(BuildContext context) {
    // return
    //  GetBuilder<multiSelectRwoCon>(
    //     init: multiSelectRwoCon(),
    //     builder: ((controller) {

    return Row(children: [
      Text(
        title,
        style: TextStyle(color: Color(0xff575757)),
      ),
      SizedBox(width: 25.w),
      CommonButton(
        text: "select".tr + "  " + "$title",
        width: 90.w,
        height: 24.h,
        onTap: () {
          getMultiSelectDialog();
        },
      ),

      // Container(
      //   color: Colors.red,
      //   child: SizedBox(
      //     height: 50.h,
      //     width: 200.w,
      //     child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: controller.getSelectedOption().length,
      //         itemBuilder: (context, i) {
      //           return Text(
      //             controller.getSelectedOption()[i].name!,
      //             style: TextStyle(color: Colors.black),
      //           );
      //         }),
      //   ),
      // )
    ]);
    // })
    // );
  }

  // bool isSelected(int selectedindex) {
  //   for (int i = 0; i < optionsList.length; i++) {
  //     if (optionsList[i].intValu == selectedindex) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  getMultiSelectDialog() {
    // Get.find<multiSelectRwoCon>().options = optionsList;
    return Get.defaultDialog(
        title: title,
        titleStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
        barrierDismissible: false,
        confirm: CommonButton(
          text: "تم",
          width: 100.w,
          height: 30.h,
          onTap: () {
            onConfirm!(controller.getSelectedOption());
            Get.back();
          },
        ),
        content: Container(
          width: 500.w,
          height: 290.h,
          child: GetBuilder<multiSelectRwoCon>(
            // init: multiSelectRwoCon(),
            builder: ((controller) {
              controller.options = optionsList;
              return ListView.separated(
                  //physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  separatorBuilder: (c, i) => Divider(
                        endIndent: 10.w,
                        height: 5,
                        indent: 10.w,
                        color: Colors.black,
                      ),
                  itemCount: controller.options.length,
                  itemBuilder: (c, i) => CheckboxListTile(
                      title: Text(controller.options[i].name!),
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: controller.options[i].boolValue!,
                      onChanged: (x) {
                        controller.selectedOptions(
                            controller.options[i].intValu!, x!);
                        // Get.find<ordersController>().categoryFiltration(
                        //     Get.find<categoryController>().selectedCat);
                      }));
            }),
          ),
        ));
  }
}
