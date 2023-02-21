import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/popUpsDialogs/branchDialog/controller/branchController.dart';
import 'package:vendor_app_freelance/popUpsDialogs/categoryDialog/controller/categoryController.dart';
import 'package:vendor_app_freelance/popUpsDialogs/orderStatusDialog/controller/orderStatusController.dart';
import 'package:vendor_app_freelance/popUpsDialogs/orderStatusDialog/view/orderStatusDialog.dart';
import 'package:vendor_app_freelance/screens/oeders/controller/ordersController.dart';
import 'package:vendor_app_freelance/screens/oeders/widget/orderDataCard.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/controller/genderController.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  // final List head = [
  //   AppAssets.category,
  //   AppAssets.type,
  //   AppAssets.branch,
  //   AppAssets.orderStatus
  // ];
  // final controller = Get.put(ordersController());
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: 'orders'.tr,
        body: GetBuilder<ordersController>(
          init: ordersController(),
          builder: (controller) => Column(
            children: [
              SizedBox(height: 20.h),
              // Clasifaction(clasifaction: head),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
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
                    orderStatusDialog(
                      onStatusSelected: (val) {
                        controller.statusFiltration(
                            Get.find<orderStatusController>().status);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    height: 41.h,
                    child: Center(
                      child: Text(
                        "ordersno".tr +
                            "  ........................................... " +
                            controller.ordersList.length.toString() +
                            " " +
                            "order".tr,
                        style: TextStyle(
                            fontSize: 17.sp, color: Get.theme.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.FilterdList != null
                        ? controller.FilterdList!.length
                        : controller.ordersList.length,
                    itemBuilder: (context, index) {
                      return OrderDataCard(
                          index: index,
                          order: controller.FilterdList != null
                              ? controller.FilterdList![index]
                              : controller.ordersList[index]);
                    }),
              ),

              Container(
                height: 100,
              ),
            ],
          ),
        ));
  }

  // final List<RowDetail> dataCard = [
  //   RowDetail(
  //       label: 'رقم الطلب',
  //       text: '0058964',
  //       icon: SvgPicture.asset(AppAssets.calender)),
  //   RowDetail(
  //       label: 'وقت الطلب',
  //       text: '6:26 م',
  //       icon: SvgPicture.asset(AppAssets.time)),
  //   RowDetail(
  //       label: 'الفرع',
  //       text: 'الحياة مول',
  //       icon: SvgPicture.asset(AppAssets.building)),
  //   RowDetail(
  //     label: 'اللون',
  //     text: 'اخضر',
  //     icon: Container(
  //       width: 10.w,
  //       height: 10.h,
  //       decoration:
  //           BoxDecoration(shape: BoxShape.circle, color: Color(0xff1CFF42)),
  //     ),
  //   ),
  //   RowDetail(label: 'الحجم', text: 'XXL', icon: Text('')),
  //   RowDetail(
  //       label: 'وقت التسليم',
  //       text: 'خلال',
  //       icon: SvgPicture.asset(
  //         AppAssets.clock,
  //         height: 12.h,
  //         color: Colors.black,
  //       )),
  // ];
  // final List<RowDetail> dataCard2 = [
  //   RowDetail(
  //       label: 'التصنيف',
  //       text: 'موضة',
  //       icon: SvgPicture.asset(AppAssets.calender)),
  //   RowDetail(
  //       label: 'العلامة التجارية',
  //       text: 'NIKE',
  //       icon: SvgPicture.asset(AppAssets.time)),
  // ];
}
