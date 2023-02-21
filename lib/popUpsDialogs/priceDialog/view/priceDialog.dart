import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:vendor_app_freelance/popUpsDialogs/priceDialog/controller/priceController.dart';

import '../../../common/button_widget.dart';
import '../../../services/theme/app_assets.dart';
import '../../rowDialog.dart';

getpriceDialog() {
  return Get.defaultDialog(
    title: 'theprice'.tr,
    titleStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
    barrierDismissible: false,
    confirm: CommonButton(
      text: "done".tr,
      width: 100.w,
      height: 30.h,
      onTap: () {
        Get.back();
      },
    ),
    content: Container(
        width: 500.w,
        height: 350.h,
        child: GetBuilder<priceController>(
            init: priceController(),
            builder: ((controller) => ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "sortbyprice".tr,
                        //'تصنيف حسب السعر',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFF26511),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 5.r,
                              backgroundColor: Color(0xFFF26511),
                            ),
                            Container(
                              height: 120.h,
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            CircleAvatar(
                              radius: 5.r,
                              backgroundColor: Color(0xFFF26511),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                "from".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                controller.theLowest,
                                style: const TextStyle(
                                  color: Color(0xFFF26511),
                                ),
                              ),
                            ),
                            Stack(alignment: Alignment.centerLeft, children: [
                              Container(
                                height: 1.h,
                                width: 220.w,
                                color: Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 25.r,
                                backgroundColor: const Color(0xFFF26511),
                                child: IconButton(
                                    onPressed: () {
                                      controller.ontap();
                                    },
                                    icon: const Icon(
                                      Icons.import_export,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ]),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                "to".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                controller.theHighest,
                                style: const TextStyle(
                                  color: Color(0xFF0A157C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "priceaverage".tr,
                            //   "متوسط السعر",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.start.toString().length > 6
                                    ? controller.start
                                        .toString()
                                        .substring(0, 6)
                                    : controller.start.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                controller.end.toString().length > 6
                                    ? controller.end.toString().substring(0, 6)
                                    : controller.end.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SfRangeSlider(
                            activeColor: const Color(0xFFF26511),
                            min: 0.0,
                            max: 1000.0,
                            values: controller.values,
                            interval: 20,
                            showTicks: false,
                            showLabels: false,
                            enableTooltip: true,
                            stepSize: 50,
                            minorTicksPerInterval: 1,
                            onChanged: (SfRangeValues values) {
                              controller.onSliderChange(values);
                            },
                          ),
                        ],
                      ),
                    ])))),
  );
}

class priceDialog extends StatelessWidget {
  Function(bool)? isAscending;
  priceDialog({Key? key, this.isAscending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<priceController>(
      init: priceController(),
      builder: (controller) => RowDialog(
          ImgDialog: AppAssets.priceDialog,
          SelctedValue: controller.selectedFromToPrice,
          openDialog: () async {
            await getpriceDialog();
            if (isAscending != null) {
              isAscending!(controller.isAscending);
            }
          }),
    );
  }
}
