import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/common/datePicker_widget.dart';
import 'package:vendor_app_freelance/common/linear_progress_rate.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/screens/allReport/controller/all_report_controller.dart';
import 'package:vendor_app_freelance/screens/allReport/widget/circular_chart.dart';
import 'package:vendor_app_freelance/screens/allReport/widget/toggle_button.dart';

import '../../home/widget/most_place_bay.dart';

class AllReport extends StatelessWidget {
  AllReport({Key? key}) : super(key: key);
  final List<MostPlassBuy> mostBuy = [
    MostPlassBuy(
      place: 'الرياض مول',
      parcentage: 43,
      number: 55,
    ),
    MostPlassBuy(
      place: 'الخبر مول',
      parcentage: 33,
      number: 25,
    ),
    MostPlassBuy(
      place: 'الحياة مول',
      parcentage: 65,
      number: 78,
    ),
    MostPlassBuy(
      place: 'جدة مول',
      parcentage: 18,
      number: 17,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'reports'.tr,
      body: ListView(
        children: [
          SizedBox(height: 10.h),
          DatePickerWidget(),
          SizedBox(height: 10.h),
          CircularChart(),
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Container(
                width: 343.w,
                height: 232.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'branches'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Color(0xff79787E)),
                            ),
                            GetBuilder<AllReportController>(
                              init: AllReportController(),
                              id: 'number',
                              builder: (Controller) => ToggleButtonWidget(
                                onPressed: (index) =>
                                    Controller.changeToggleBotton(index),
                                isSelected: Controller.isSelected,
                              ),
                            ),
                          ]),
                    ),
                    ...List.generate(
                        mostBuy.length,
                        (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('${mostBuy[index].place}')),
                                    //SizedBox(width: 10.w),
                                    Expanded(
                                        flex: 3,
                                        child: GetBuilder<AllReportController>(
                                          id: 'number',
                                          builder: (controller) =>
                                              LinearProgressRate(
                                            width: 200.w,
                                            percentage:
                                                mostBuy[index].parcentage! * 2,
                                            numPar: mostBuy[index].parcentage!,
                                            number: controller.isSelected[0]
                                                ? mostBuy[index].number
                                                : null,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 74.h,
          )
        ],
      ),
    );
  }
}
