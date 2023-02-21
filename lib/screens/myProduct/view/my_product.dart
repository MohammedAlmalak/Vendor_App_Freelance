import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/popUpsDialogs/priceDialog/controller/priceController.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productItems.dart';
import '../../../common/card_widget.dart';
import '../../../popUpsDialogs/branchDialog/controller/branchController.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/controller/categoryController.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/controller/genderController.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../../../popUpsDialogs/priceDialog/view/priceDialog.dart';
import '../controller/myProductController.dart';
import '../widget/cardItem.dart';

class MyProduct extends StatelessWidget {
  MyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: 'myproducts'.tr,
        body: GetBuilder<myProductController>(
          init: myProductController(),
          builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(children: [
              SizedBox(height: 19.h),
              Row(children: [
                CardWidget(
                  width: 289.w,
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Get.theme.primaryColor),
                        hintText: 'thesearch'.tr,
                        contentPadding: EdgeInsets.all(8.r)),
                  ),
                ),
                SizedBox(width: 12.w),
                CardWidget(
                  width: 44.w,
                  height: 40.h,
                  child: Icon(Icons.format_list_bulleted_rounded,
                      size: 35.sp, color: Get.theme.primaryColor),
                ),
              ]),
              SizedBox(height: 20.h),
              SizedBox(
                height: 30.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryDialog(
                      onSelectedCategory: (val) {
                        controller.categoryFiltration(
                            Get.find<categoryController>().selectedCat);
                      },
                    ),
                    genderDialog(
                      onGenderSelected: (val) {
                        controller.genderFiltration(
                            Get.find<genderController>().gender);
                      },
                    ),
                    branchDialog(
                      onBranchSelected: (val) {
                        controller.branchFiltration(
                            Get.find<branchController>().branch);
                      },
                    ),
                    priceDialog(
                      isAscending: (val) {
                        controller.priceFiltration(
                            Get.find<priceController>().isAscending);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.h),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.FilterdList != null
                        ? controller.FilterdList!.length
                        : controller.myProductList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: controller.FilterdList != null
                              ? ItemCard(
                                  prod: controller.FilterdList![index],
                                  onViewTap: () {
                                    navigateScree(
                                        productItems(
                                            argumentData:
                                                controller.FilterdList![index]),
                                        context);
                                    // Get.toNamed(Routes.productItems,
                                    //     arguments: staticData.getAllProducts[index]);
                                  },
                                  withTwoBtns: false,
                                )
                              : ItemCard(
                                  prod: controller.myProductList[index],
                                  onViewTap: () {
                                    navigateScree(
                                        productItems(
                                            argumentData: controller
                                                .myProductList[index]),
                                        context);
                                    // Get.toNamed(Routes.productItems,
                                    //     arguments: staticData.getAllProducts[index]);
                                  },
                                  withTwoBtns: false,
                                ));
                    }),
              ),
              Container(
                height: 80.h,
              )
            ]),
          ),
        ));
  }
}
