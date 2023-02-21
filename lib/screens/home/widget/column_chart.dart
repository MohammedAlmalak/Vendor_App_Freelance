import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../primaryClasses/ChartData.dart';

class ColumChart extends StatelessWidget {
  ColumChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 70, Colors.teal, 'احذية', AppAssets.labelTeal),
      ChartData(3, 80, Colors.orange[600], 'بنطال', AppAssets.labelOrange),
      ChartData(2, 53, Colors.blue[900], 'تي شيرت', AppAssets.labelBlue),
      ChartData(4, 60, Get.theme.primaryColor, 'عطور', AppAssets.labelPrimary),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          title: ChartTitle(
              text: 'mostpurchasedcategories'.tr,
              // 'اكثر الفئات شراء',
              alignment: ChartAlignment.center,
              textStyle: TextStyle(
                  color: Get.theme.primaryColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold)),
          // margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10),

          legend: Legend(
            toggleSeriesVisibility: true,
            isVisible: true,
            legendItemBuilder:
                (String name, dynamic series, dynamic point, int index) {
              return Container(
                width: 120.w,
                height: 120.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      chartData.length,
                      (index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 10.w,
                            height: 10.h,
                            color: chartData[index].color,
                          ),
                          SizedBox(width: 20.w),
                          Text('${chartData[index].name}',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            // Legend will be placed at the left
            position: LegendPosition.left,
          ),
          primaryYAxis: NumericAxis(isVisible: false),
          primaryXAxis: NumericAxis(isVisible: false),
          margin: EdgeInsets.zero,
          series: <ChartSeries<ChartData, int>>[
            ColumnSeries<ChartData, int>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              spacing: 0.15,
              isVisibleInLegend: true,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r)),
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.outer,
                builder: (dynamic data, dynamic point, dynamic series,
                    int pointIndex, int seriesIndex) {
                  return Container(
                    height: 50.h,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          data.label,
                          width: 15.w,
                          height: 15.h,
                        ),
                        //SizedBox(height: 5.h),
                        Text(
                          data.y.toInt().toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
