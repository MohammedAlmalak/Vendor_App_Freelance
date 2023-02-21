import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/primaryClasses/brand.dart';
import 'package:vendor_app_freelance/services/location/view/geolocaltion.dart';
import '../../../common/button_widget.dart';
import '../../../common/multySelect.dart';
import '../../../services/theme/app_assets.dart';
import '../../addProducr/widget/rowTitleWithTextFeild.dart';
import '../controller/addStoreController.dart';
import '../controller/branchesController.dart';

class addStore extends StatelessWidget {
  addStore({Key? key}) : super(key: key);
  List<String> _selectedChoices = [];
  final storeName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: "addStore".tr,
        body: GetBuilder<addStoreController>(
          init: addStoreController(),
          builder: (controller) => ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [backButton()],
              ),
              SizedBox(height: 12.h),
              TitleWithTextField(
                title: 'storename'.tr,
                txtController: storeName,
              ),
              SizedBox(height: 12.h),
              TitleWithTextField(title: 'trademark'.tr),
              SizedBox(height: 12.h),
              TitleWithTextField(
                  title: 'thebranch'.tr,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        border: Border.all(width: 1, color: Color(0xffDFE3E9))),
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
                        value: controller.branch,
                        onChanged: (val) {
                          controller.changeBranch(val.toString());
                        }),
                  )),
              SizedBox(height: 12.h),
              //TODO multy select
              MultySelectWidget(
                title: Text(
                  'categories'.tr,
                  style: TextStyle(color: Color(0xff575757)),
                ),
                optionsList: [
                  choices(id: 1, name: "عطور"),
                  choices(id: 2, name: "أحذية"),
                  choices(id: 3, name: "ملايس"),
                  choices(id: 4, name: "بناطيل"),
                  choices(id: 5, name: "تي شيرت"),
                  choices(id: 6, name: "جاكيت"),
                ],
                selectedOptions: (selectedChoices) {
                  selectedChoices.forEach((element) {
                    _selectedChoices.add(element!.name!);
                  });
                },
              ),
              SizedBox(height: 12.h),
              Text(
                'location'.tr,
                style: TextStyle(color: Color(0xff575757)),
              ),
              Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        border: Border.all(width: 1, color: Color(0xffDFE3E9))),
                    child: DropdownButton(
                        underline: Container(),
                        isExpanded: true,
                        style: TextStyle(
                            fontSize: 15.sp, color: Get.theme.primaryColor),
                        alignment: Alignment.center,
                        iconEnabledColor: Get.theme.primaryColor,
                        iconDisabledColor: Get.theme.primaryColor,
                        dropdownColor: Colors.white,
                        items: country,
                        value: controller.country,
                        onChanged: (v) {
                          controller.changeCountry(v.toString());
                        }),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 100.w.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        border: Border.all(width: 1, color: Color(0xffDFE3E9))),
                    child: DropdownButton(
                        underline: Container(),
                        isExpanded: true,
                        style: TextStyle(
                            fontSize: 15.sp, color: Get.theme.primaryColor),
                        alignment: Alignment.center,
                        iconEnabledColor: Get.theme.primaryColor,
                        iconDisabledColor: Get.theme.primaryColor,
                        dropdownColor: Colors.white,
                        items: city,
                        value: controller.city,
                        onChanged: (v) {
                          controller.changeCity(v.toString());
                        }),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.locationPin,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'chooseyourlocation'.tr,
                    style: TextStyle(color: Color(0xff575757)),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // Container(color: Colors.grey, height: 250.h),
              Geolocation(),
              SizedBox(height: 20.h),
              SizedBox(
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                      onTap: () {
                        // Get.back();
                        if (storeName.text != "" &&
                            _selectedChoices.isNotEmpty) {
                          Get.find<branchesController>().addToStores(brand(
                            brandName: storeName.text,
                            brandCategory: "FASHION",
                            brandItems: _selectedChoices,
                          ));
                          Get.snackbar(
                            "إضافة متجر جديد",
                            "تم إضافة المتجر الخاص بك بنجاح",
                            backgroundColor:
                                Get.theme.primaryColor.withOpacity(.05),
                            colorText: Color(0xFF27445F),
                          );
                          Navigator.of(context).pop();
                        } else {
                          Get.snackbar(
                            "تحذير !",
                            "يجب إدخال اسم المتجر و التصنيفات الخاصة بالمتجر",
                            backgroundColor:
                                Get.theme.primaryColor.withOpacity(.05),
                            colorText: Color(0xFF27445F),
                          );
                        }
                      },
                      text: "add".tr,
                      txtStyle: TextStyle(fontSize: 14.sp),
                      width: 100.w,
                      height: 35.h,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "delete".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffEF723C),
                            fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 75.h,
              ),
            ],
          ),
        ));
  }
}

final List<DropdownMenuItem<String>>? items = [
  DropdownMenuItem(
      value: 'a',
      child: Center(
          child: Text(
        'الحياة مول',
      ))),
  DropdownMenuItem(
      value: 'b',
      child: Center(
          child: Text(
        'النخيل مول',
      ))),
  DropdownMenuItem(
      value: 'c',
      child: Center(
          child: Text(
        'بانوراما مول',
      ))),
  DropdownMenuItem(
      value: 'd',
      child: Center(
          child: Text(
        'الرياض مول',
      ))),
];
final List<DropdownMenuItem<String>>? country = [
  DropdownMenuItem(
      value: 'KSA',
      child: Center(
          child: Text(
        'السعودية',
      ))),
  DropdownMenuItem(
      value: 'KUW',
      child: Center(
          child: Text(
        'الكويت',
      ))),
];
final List<DropdownMenuItem<String>>? city = [
  DropdownMenuItem(
      value: 'Riyadh',
      child: Center(
          child: Text(
        'الرياض',
      ))),
  DropdownMenuItem(
      value: 'Jeddah',
      child: Center(
          child: Text(
        'جدة',
      ))),
];
