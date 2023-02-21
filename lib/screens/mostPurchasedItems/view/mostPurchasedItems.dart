import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/popUpsDialogs/priceDialog/view/priceDialog.dart';
import 'package:vendor_app_freelance/screens/mostPurchasedItems/widget/mostPurchasedCard.dart';
import '../../../common/backButton.dart';
import '../../../common/datePicker_widget.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../controller/mostPurchasedController.dart';

class mostPurchasedItems extends StatelessWidget {
  const mostPurchasedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: 'mostpurchased'.tr,
        body: GetBuilder<mostPurchasedController>(
          init: mostPurchasedController(),
          builder: (controller) => Column(
            children: [
              SizedBox(height: 10.h),
              DatePickerWidget(),
              SizedBox(height: 10.h),
              SizedBox(
                height: 30.h,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryDialog(
                            onSelectedCategory: (val) {
                              controller.categoryFiltration(val);
                            },
                          ),
                          genderDialog(
                            onGenderSelected: (val) {
                              controller.genderFiltration(val);
                            },
                          ),
                          branchDialog(
                            onBranchSelected: (val) {
                              controller.branchFiltration(val);
                            },
                          ),
                          priceDialog(
                            isAscending: (val) {
                              controller.priceFiltration(val);
                            },
                          )
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: backButton())
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.FilterdList != null
                          ? controller.FilterdList!.length
                          : controller.mostPurchasedProd.length,
                      itemBuilder: (BuildContext context, int index) {
                        return mostPurchasedCard(
                            prod: controller.FilterdList != null
                                ? controller.FilterdList![index]
                                : controller.mostPurchasedProd[index]);
                      })),
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        ));
  }
}
