import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/button_widget.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/screens/myProduct/widget/imgSlider.dart';
import 'package:vendor_app_freelance/screens/myProduct/widget/productSizes.dart';

import '../../../common/appbar_widget.dart';
import '../../../common/multySelect.dart';
import '../../addProducr/widget/rowTitleWithTextFeild.dart';
import '../controller/myProductController.dart';

class productEditing extends StatelessWidget {
  productEditing({
    Key? key,
    this.argumentProdData,
  }) : super(key: key);
  final Product? argumentProdData;
  // product argumentProdData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: "myproducts".tr,
        body: GetBuilder<myProductController>(
            init: myProductController(),
            builder: ((controller) => ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    imgSlider(images: [
                      Image.asset(argumentProdData!.productImg!),
                      Image.asset(argumentProdData!.productImg!),
                    ]),
                    // Stack(alignment: AlignmentDirectional.center, children: [
                    //   Card(
                    //     child: Container(
                    //       padding: const EdgeInsets.all(10),
                    //       height: 250.h,
                    //       width: double.infinity,
                    //       child: Image.asset(prod.productImg),
                    //     ),
                    //   ),
                    //   Positioned.directional(
                    //       top: 10,
                    //       end: 10,
                    //       textDirection: Directionality.of(context),
                    //       child: backButton()),
                    // ]),
                    Container(
                      margin: EdgeInsets.all(10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWithTextField(title: 'productname'.tr),
                          SizedBox(height: 12.h),
                          TitleWithTextField(title: 'trademark'.tr),
                          SizedBox(height: 12.h),
                          TitleWithTextField(
                              title: 'type'.tr,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.r)),
                                    border: Border.all(
                                        width: 1, color: Color(0xffDFE3E9))),
                                child: DropdownButton(
                                    underline: Container(),
                                    isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Get.theme.primaryColor),
                                    alignment: Alignment.center,
                                    iconEnabledColor: Get.theme.primaryColor,
                                    iconDisabledColor: Get.theme.primaryColor,
                                    dropdownColor: Colors.white,
                                    items: items,
                                    value: controller.productType,
                                    onChanged: (v) {
                                      controller
                                          .changeProductType(v.toString());
                                    }),
                              )),
                          SizedBox(height: 12.h),
                          //TODO multy select
                          MultySelectWidget(
                            title: Text(
                              'thebranch'.tr,
                              style: TextStyle(color: Color(0xff575757)),
                            ),
                            optionsList: [
                              choices(id: 1, name: "الحياة مول"),
                              choices(id: 2, name: "جدة مول"),
                              choices(id: 2, name: "رياض مول"),
                            ],
                          ),
                          SizedBox(height: 12.h),

                          ///
                          Row(
                            children: [
                              TitleWithTextField(title: 'theprice'.tr),
                              SizedBox(width: 5.w),
                              Text('ksacurrency'.tr,
                                  style: TextStyle(color: Color(0xff3D3A3A)))
                            ],
                          ),
                          SizedBox(height: 12.h),
                          //TODO Colors
                          Row(
                            children: [
                              Text('availablesizes'.tr),
                              SizedBox(width: 12.h),
                              productSizes(),
                              // ...List.generate(
                              //     controller.sizes.length,
                              //     (index) => InkWell(
                              //         onTap: (() {
                              //           controller.addToSizes(controller
                              //               .sizes[index].keys
                              //               .elementAt(0));
                              //           // controller.removeFromSizes(controller
                              //           //     .sizes[index].keys
                              //           //     .elementAt(0));
                              //         }),
                              //         child: Container(
                              //           padding: EdgeInsets.all(5),
                              //           child: Text(
                              //               controller.sizes[index].values
                              //                   .elementAt(0),
                              //               style: TextStyle(
                              //                 color: controller.selectedSizes
                              //                         .contains(controller
                              //                             .sizes[index])
                              //                     ? Get.theme.primaryColor
                              //                     : Colors.grey,
                              //               )),
                              //         )))
                            ],
                          ),
                          SizedBox(height: 12.h),
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
                              Text('pricediscount'.tr),
                            ],
                          ),
                          SizedBox(height: 12.h),

                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'discountpercentage'.tr,
                                      style:
                                          TextStyle(color: Color(0xff575757)),
                                    ),
                                    Container(
                                      height: 24.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Color(0xff707070)),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
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
                                  value: 50,
                                  min: 0,
                                  max: 100,
                                  onChanged: (v) {}),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'productdescription'.tr,
                            style: TextStyle(color: Color(0xff575757)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: TextField(
                              /*   minLines:
                  3,  */ // any number you need (It works as the rows for the textarea)
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              cursorHeight: 30,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Get.theme.primaryColor),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 5.h),
                                //label: Text("وصف المنتج"),
                                labelStyle: TextStyle(color: Color(0xff575757)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffDFE3E9), width: 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonButton(
                          text: "approval".tr,
                          txtStyle: TextStyle(fontSize: 15.sp),
                          width: 110.w,
                          height: 40.h,
                          onTap: () {},
                        ),
                        SizedBox(width: 15.w),
                        SizedBox(
                          width: 120.w,
                          height: 40.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Get.theme.primaryColor,
                              ),
                              Text(
                                "deleteproduct".tr,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Get.theme.primaryColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 80.h,
                    ),
                  ],
                ))));
  }

  final List<DropdownMenuItem<String>>? items = [
    DropdownMenuItem(
        value: '1',
        child: Center(
            child: Text(
          'تي شيرت',
        ))),
    DropdownMenuItem(
        value: '2',
        child: Center(
            child: Text(
          'جاكيت',
        ))),
    DropdownMenuItem(
        value: '3',
        child: Center(
            child: Text(
          'حذاء',
        ))),
  ];
}
