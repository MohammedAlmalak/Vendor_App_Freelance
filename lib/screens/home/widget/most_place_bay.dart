import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vendor_app_freelance/common/linear_progress_rate.dart';
import 'package:vendor_app_freelance/screens/allReport/controller/all_report_controller.dart';

import '../../../common/date_picker_container.dart';

class MostPlaceBuy extends StatelessWidget {
  MostPlaceBuy({
    Key? key,
  }) : super(key: key);
  final List<MostPlassBuy> mostBuy = [
    MostPlassBuy(
      place: 'الخبر',
      parcentage: 43,
    ),
    MostPlassBuy(
      place: 'الرياض',
      parcentage: 33,
    ),
    MostPlassBuy(
      place: 'جدة',
      parcentage: 65,
    ),
    MostPlassBuy(
      place: 'تبوك',
      parcentage: 18,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222.h,
      width: 343.w,
      //color: Colors.red,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      /*   height: 25.h, width: 133.w, */ child:
                          DatePickerWithContainer()),
                ],
              ),
              ...List.generate(
                  mostBuy.length,
                  (index) => Expanded(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text('${mostBuy[index].place}')),
                            //  SizedBox(width: 26.w),
                            Expanded(
                                flex: 4,
                                child: LinearProgressRate(
                                  width: 200.w,
                                  percentage: mostBuy[index].parcentage! * 2,
                                  numPar: mostBuy[index].parcentage!,
                                )),
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class MostPlassBuy {
  String? place;
  double? parcentage;
  double? number;

  MostPlassBuy({
    this.place,
    this.parcentage,
    this.number,
  });
}
