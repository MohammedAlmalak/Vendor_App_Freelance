import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';
import 'card_detail.dart';

class CardStack extends StatelessWidget {
  CardStack({
    Key? key,
  }) : super(key: key);

  final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Color(0xffFCFCFC),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        offset: Offset(0, 0), //(x,y)
        blurRadius: 10.0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: Container(
              height: 40.h,
              // color: Colors.amber,
            )),
        Positioned(
          left: 16.3.w,
          // right: 16,
          child: Card(
            margin: EdgeInsets.zero,
            child: Container(
              height: 126.h,
              width: 343.w,
              decoration: boxDecoration,
              child: Padding(
                padding: EdgeInsets.only(right: 17.w, left: 17.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CardDetails(),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          child: Image.asset(
                            AppAssets.clockperson,
                          ),
                          //     Stack(
                          //   children: [
                          //     SvgPicture.asset(
                          //       AppAssets.backgroundPerson,
                          //       height: 60.h,
                          //     ),
                          //     SvgPicture.asset(
                          //       AppAssets.person,
                          //       height: 60.w,
                          //     ),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            ...List.generate(3, (index) => RowOfClock(index)),
                          ],
                        ),
                        Expanded(
                          child: RowOfTime(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

        /*  Container(
          decoration: BoxDecoration(
            color: Color(0xffFCFCFC),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 5.0,
              ),
            ],
          ),
          height: 160.h,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Align(
                alignment: Alignment.topCenter,
                child: HeaderWidget(title: 'الرئيسية')),
          ),
        ), */
        /*      Positioned(
            bottom: 13.h,
            right: 16,
            left: 16,
            child: ) */
      ],
    );
  }

  Widget RowOfTime() {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 8.sp, color: Get.theme.primaryColor),
      child: Container(
        width: 88.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'thehour'.tr,
              ),
              Text(
                'theminute'.tr,
              ),
              Text(
                'thesecond'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget RowOfClock(int index) {
    final List<int> time = [1, 19, 35];
    final boxDecorationTime = BoxDecoration(
      color: Color(0xffFCFCFC),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          offset: Offset(0, 0), //(x,y)
          blurRadius: 2.0,
        ),
      ],
    );
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 18.w,
          height: 20.h,
          decoration: boxDecorationTime,
          child: Center(
              child: Text(
            time[index].toString(),
            style: TextStyle(fontSize: 11.sp, color: Get.theme.primaryColor),
          )),
          //color: Colors.red,
        ),
        if (index != 2)
          Text(
            ':',
            style: TextStyle(color: Get.theme.primaryColor),
          ),
      ],
    );
  }
}
