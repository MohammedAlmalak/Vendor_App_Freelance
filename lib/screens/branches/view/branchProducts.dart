import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/popUpsDialogs/branchDialog/view/branchDialog.dart';
import 'package:vendor_app_freelance/popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import 'package:vendor_app_freelance/popUpsDialogs/priceDialog/view/priceDialog.dart';
import 'package:vendor_app_freelance/screens/branches/widget/branchProductCard.dart';
import '../../../common/datePicker_widget.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../controller/BranchProductsCon.dart';

class BranchProducts extends StatelessWidget {
  const BranchProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: 'منتجات الفرع',
        body: GetBuilder<BranchProductsCon>(
          init: BranchProductsCon(),
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
                          priceDialog(isAscending: (val) {
                            controller.priceFiltration(val);
                          }),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: backButton())
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.FilterdList != null
                      ? controller.FilterdList!.length
                      : controller.branchProductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: .7,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return BranchProductCard(
                        prod: controller.FilterdList != null
                            ? controller.FilterdList![index]
                            : controller.branchProductList[index]);
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ));
  }
}
