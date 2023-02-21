import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/screens/orderStatusDetails/widget/statusDetailCard.dart';

import '../../../common/backButton.dart';
import '../../../common/datePicker_widget.dart';
import '../../../common/scafold_appbar_drawer.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../../../popUpsDialogs/priceDialog/view/priceDialog.dart';
import '../controller/statusDetailsCon.dart';

class OrderStatusDetails extends StatelessWidget {
  final int? orderStatusInt;
  OrderStatusDetails({Key? key, this.orderStatusInt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: 'الطلبات',
        body: GetBuilder<StatusDetailsCon>(
          init: StatusDetailsCon(),
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
                          : controller.getOrderList(orderStatusInt!).length,
                      itemBuilder: (BuildContext context, int index) {
                        return StatusDetailCard(
                            order: controller.FilterdList != null
                                ? controller.FilterdList![index]
                                : controller
                                    .getOrderList(orderStatusInt!)[index]);
                      })),
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        ));
  }
}
