import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/screens/addProducr/widget/rowTitleWithTextFeild.dart';

class pickColor extends StatelessWidget {
  const pickColor({
    Key? key,
    this.colors,
    this.subColors,
    this.colorValue,
    this.colorSubValue,
  }) : super(key: key);

  final List<DropdownMenuItem<String>>? colors;
  final List<DropdownMenuItem<String>>? subColors;
  final String? colorValue;
  final String? colorSubValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleWithTextField(
            title: 'colors'.tr,
            width: 83.w,
            hight: 26.h,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(width: 1, color: Color(0xffDFE3E9))),
              child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  style:
                      TextStyle(fontSize: 11.sp, color: Get.theme.primaryColor),
                  alignment: Alignment.center,
                  iconEnabledColor: Get.theme.primaryColor,
                  iconDisabledColor: Get.theme.primaryColor,
                  dropdownColor: Colors.white,
                  items: colors,
                  value: colorValue,
                  onChanged: (v) {}),
            )),
        SizedBox(width: 8.w),
        TitleWithTextField(
            showTitle: false,
            title: 'colors'.tr,
            width: 83.w,
            hight: 26.h,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(width: 1, color: Color(0xffDFE3E9))),
              child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  style:
                      TextStyle(fontSize: 11.sp, color: Get.theme.primaryColor),
                  alignment: Alignment.center,
                  iconEnabledColor: Get.theme.primaryColor,
                  iconDisabledColor: Get.theme.primaryColor,
                  dropdownColor: Colors.white,
                  items: subColors,
                  value: colorSubValue,
                  onChanged: (v) {}),
            )),
        SizedBox(width: 13.w),
        InkWell(
          onTap: () {
            colorPicker(context);
          },
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          'customcolors'.tr,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }

  colorPicker(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('customcolors'.tr),
        content: SingleChildScrollView(
          // child: ColorPicker(
          //   pickerColor: Colors.red,
          //   onColorChanged: (c) {},
          // ),
          // Use Material color picker:
          //
          // child: MaterialPicker(
          //   pickerColor: Colors.red,
          //   onColorChanged: (c) {},
          //   // showLabel: true, // only on portrait mode
          // ),
          //
          // Use Block color picker:
          //
          /* child: BlockPicker(
            pickerColor: Colors.red,
            onColorChanged: (c) {},
          ), */
          //
          child: MultipleChoiceBlockPicker(
            pickerColors: [],
            onColorsChanged: (c) {},
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              //  setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
