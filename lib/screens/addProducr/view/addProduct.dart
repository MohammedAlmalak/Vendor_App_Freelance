import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/multiSelectRwo/view/multiSelectRwo.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/popUpsDialogs/radiioData.dart';
import 'package:vendor_app_freelance/screens/addProducr/controller/add_product_controller.dart';
import 'package:vendor_app_freelance/screens/addProducr/widget/rowTitleWithTextFeild.dart';
import 'package:vendor_app_freelance/staticData.dart';
import '../../../common/button_widget.dart';
import '../widget/pick_Color.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: "addproduct".tr,
      body: GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (controller) => ListView(
          // physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 207.h,
              color: Color(0xffE5E5E5),
              child: Icon(
                Icons.photo_library_outlined,
                size: 50.sp,
                color: Get.theme.primaryColor,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  TitleWithTextField(
                      title: 'productname'.tr,
                      onChanged: (value) {
                        controller.product.productName = value;
                      }),
                  SizedBox(height: 12.h),
                  TitleWithTextField(
                      title: 'trademark'.tr,
                      onChanged: (value) {
                        controller.product.productBrand!.brandName = value;
                      }),
                  SizedBox(height: 12.h),
                  TitleWithTextField(
                      onChanged: (value) {},
                      title: 'type'.tr,
                      width: 78.w,
                      hight: 24.h,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r)),
                            border:
                                Border.all(width: 1, color: Color(0xffDFE3E9))),
                        child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            style: TextStyle(
                                fontSize: 15.sp, color: Get.theme.primaryColor),
                            alignment: Alignment.center,
                            iconEnabledColor: Get.theme.primaryColor,
                            iconDisabledColor: Get.theme.primaryColor,
                            dropdownColor: Colors.white,
                            items: items,
                            value: controller.brandType,
                            onChanged: (String? v) {
                              controller.product.productBrand?.brandName = v!;
                              controller.changeBrandType(v!.toString());
                            }),
                      )),
                  SizedBox(height: 12.h),
                  multiSelectRwo(
                    title: "thebranch".tr,
                    optionsList: [
                      RadioData(name: "رياض مول", intValu: 0, boolValue: false),
                      RadioData(name: "جدة مول", intValu: 1, boolValue: false),
                      RadioData(
                          name: "الحياة مول", intValu: 2, boolValue: false),
                    ],
                    onConfirm: (val) {},
                  ),

                  // MultySelectWidget(
                  //   title: Text(
                  //     'الفرع',
                  //     style: TextStyle(color: Color(0xff575757)),
                  //   ),
                  //   selectedItems: controller.selectedItems,
                  //   onConfirm: (values) {
                  //     controller.selectedItems = values;
                  //     controller.product.productBrand?.brandLocation =
                  //         values.first!.name;
                  //   },
                  //   optionsList: [
                  //     choices(id: 1, name: "الحياة مول"),
                  //     choices(id: 2, name: "جدة مول"),
                  //     choices(id: 3, name: "رياض مول"),
                  //   ],
                  // ),
                  SizedBox(height: 12.h),

                  ///
                  Row(
                    children: [
                      TitleWithTextField(
                          title: 'theprice'.tr,
                          onChanged: (v) {
                            //if (v is num)
                            controller.product.productPrice = double.parse(v);
                            //  }
                          }),
                      SizedBox(width: 5.w),
                      Text('ksacurrency'.tr,
                          style: TextStyle(color: Color(0xff3D3A3A)))
                    ],
                  ),
                  SizedBox(height: 13.h),
                  pickColor(
                    colorValue: colorsorigin[0].value,
                    colorSubValue: colorsSub[0].value,
                    colors: colorsorigin
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                                  value: value.value,
                                  child: Text(
                                    value.text,
                                    style: TextStyle(
                                      color: value.color,
                                    ),
                                  ),
                                ))
                        .toList(),
                    subColors: colorsSub
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                                  value: value.value,
                                  child: Text(
                                    value.text,
                                    style: TextStyle(
                                      color: value.color,
                                    ),
                                  ),
                                ))
                        .toList(),
                  ),
                  SizedBox(height: 12.h),
                  //TODO Colors
                  Row(
                    children: [
                      Text('sizes'.tr),
                      SizedBox(width: 12.h),
                      ...List.generate(
                          size.length,
                          (index) => Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                size[index],
                                style: TextStyle(color: Get.theme.primaryColor),
                              )))
                    ],
                  ),
                  SizedBox(height: 12.h),
                  TitleWithTextField(
                      title: 'captureproductnumber'.tr,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Get.theme.primaryColor,
                      )),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text("pricediscount".tr),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'discountpercentage'.tr,
                              style: TextStyle(color: Color(0xff575757)),
                            ),
                            Container(
                              height: 24.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xff707070)),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '17%', textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.37)),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                      Slider.adaptive(
                          value: 50, min: 0, max: 100, onChanged: (v) {}),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: TextField(
                /*   minLines:
                    3,  */ // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorHeight: 30,
                textAlignVertical: TextAlignVertical.center,
                style:
                    TextStyle(fontSize: 20.sp, color: Get.theme.primaryColor),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.h),
                  label: Text("productdescription".tr),
                  labelStyle: TextStyle(color: Color(0xff575757)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffDFE3E9), width: 1)),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CommonButton(
                text: "approval".tr,
                txtStyle: TextStyle(fontSize: 15.sp),
                width: 110.w,
                height: 40.h,
                onTap: () {
                  if (controller.product.productName != null &&
                      controller.product.productBrand!.brandName != null &&
                      controller.product.productPrice != null) {
                    staticData.getAllProducts.add(controller.product);
                    Get.snackbar(
                      "إضافة منتج جديد",
                      "تم إضافة المنتج الخاص بك بنجاح",
                      backgroundColor: Get.theme.primaryColor.withOpacity(.05),
                      colorText: Color(0xFF27445F),
                    );
                  } else {
                    Get.snackbar(
                      "تحذير !",
                      "يجب إدخال اسم المنتج و العلامة التجارية و سعر المنتج الخاص بك",
                      backgroundColor: Get.theme.primaryColor.withOpacity(.05),
                      colorText: Color(0xFF27445F),
                    );
                  }
                },
              ),
            ),
            Container(
              height: 80.h,
              width: 200,
            )
          ],
        ),
      ),
    );
  }

  final List<String> size = [
    'XXXL',
    'XXL',
    'XL',
    'L',
    'M',
    'S',
  ];
  final List<DropdownMenuItem<String>>? items = [
    DropdownMenuItem(
        value: 'Adidas',
        child: Center(
            child: Text(
          'Adidas',
        ))),
    DropdownMenuItem(
        value: 'Nike',
        child: Center(
            child: Text(
          'Nike',
        ))),
    DropdownMenuItem(
        value: 'Puma',
        child: Center(
            child: Text(
          'Puma',
        ))),
  ];

  final List<PickColor> colorsSub = [
    PickColor(
        value: 'a', text: 'colorgradients'.tr, color: Get.theme.primaryColor),
    PickColor(
        value: 'b',
        text: 'احمر فاتح',
        color: Color.fromARGB(255, 246, 123, 114)),
    PickColor(
        value: 'c',
        text: 'اخضر فاتح',
        color: Color.fromARGB(255, 126, 226, 129)),
    PickColor(
        value: 'd',
        text: 'اصفر فاتح',
        color: Color.fromARGB(255, 226, 216, 128))
  ];
  final List<PickColor> colorsorigin = [
    PickColor(value: 'a', text: 'maincolors'.tr, color: Get.theme.primaryColor),
    PickColor(value: 'b', text: 'احمر', color: Colors.red),
    PickColor(value: 'c', text: 'اخضر', color: Colors.green),
    PickColor(value: 'd', text: 'اصفر', color: Colors.yellow)
  ];
}

class PickColor {
  String text;
  String value;
  Color color;
  PickColor({
    required this.value,
    required this.text,
    required this.color,
  });
}
