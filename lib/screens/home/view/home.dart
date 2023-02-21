import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/home/widget/Card_area_chart.dart';
import 'package:vendor_app_freelance/screens/home/widget/circular_Slider_card.dart';
import 'package:vendor_app_freelance/screens/home/widget/order_status.dart';
import 'package:vendor_app_freelance/screens/home/widget/row_text.dart';
import 'package:vendor_app_freelance/screens/home/widget/twoCardListTile.dart';
import 'package:vendor_app_freelance/screens/mostPurchasedItems/view/mostPurchasedItems.dart';
import '../widget/accept_item_status.dart';
import '../widget/card_stack.dart';
import '../widget/circular_chart_rate.dart';
import '../widget/column_chart.dart';
import '../widget/most_place_bay.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      color: Color(0xffFCFCFC),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          // offset: Offset(0, 0), //(x,y)
          blurRadius: 2,
        ),
      ],
    );
    return ScafoldWidget(
        elevation: 0,
        body: ListView(
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              color: Colors.white,
              child: CardStack(),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 16.w, left: 10.w),
                      child: RowText()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    height: 160.h, //145
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (c, i) => OrderStatus(
                              index: i,
                            )),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 172.h,
                            width: 166.w,
                            decoration: boxDecoration,
                            child: CircularSliderCard(),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 172.h,
                            width: 166.w,
                            child: BuildCardListTile(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Card(
                        margin: EdgeInsets.zero,
                        child: Container(height: 250.h, child: ColumChart())),
                  ),
                  SizedBox(height: 20.h),
                  CardAreaChart(),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Container(
                        width: 343.w,
                        height: 185.h,
                        child: InkWell(
                            onTap: () {
                              navigateScree(mostPurchasedItems(), context);
                              // Get.toNamed(Routes.mostPurchasedItems);
                            },
                            child: CircularChartRate()),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'approvedproducts'.tr,
                      //'المنتجات الموافق عليها',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AcceptItemStatus(),
                  ),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'mostpurchasedareas'.tr,
                      //'اكثر المناطق شراء',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: MostPlaceBuy(),
                  ),
                  Container(
                    height: 80.h,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
