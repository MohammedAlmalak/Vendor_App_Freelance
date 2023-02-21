import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/orderStatusDetails/view/orderStatusDetails.dart';

class CircularChart extends StatelessWidget {
  CircularChart({Key? key}) : super(key: key);
  final List<ChartData> chartData = [
    ChartData('delivered'.tr, 15, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('prepared'.tr, 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('inpreparation'.tr, 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('canceled'.tr, 52, Color.fromRGBO(255, 189, 57, 1))
  ];
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        margin: EdgeInsets.zero,
        borderWidth: 10.w,
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '101\n',
                    style: TextStyle(
                        fontSize: 20.sp,
                        height: 1.7.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    children: [
                      TextSpan(
                          text: 'totalorders'.tr,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black54))
                    ]),
              ),
            ),
          )
        ],
        title: ChartTitle(
            alignment: ChartAlignment.center,
            text: 'orders'.tr,
            textStyle: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff27445F),
                fontFamily: 'Cairo')),
        legend: Legend(
          isVisible: true,
          legendItemBuilder:
              (String name, dynamic series, dynamic point, int index) {
            return InkWell(
              onTap: () {
                navigateScree(
                    OrderStatusDetails(orderStatusInt: index), context);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 105.w,
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.h,
                        color: point.color,
                      ),
                      Text('$name\n${point.y}',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios,
                          color: Get.theme.primaryColor),
                    ],
                  ),
                ),
              ),
            );
          },
          // Legend will be placed at the left
          position: LegendPosition.left,
        ),
        series: <CircularSeries>[
          // Renders doughnut chart

          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              innerRadius: '85%',
              // startAngle: 100,
              // Ending angle of doughnut
              // endAngle: 100,

              //radius: '60',
              explode: true,
              explodeAll: true,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
