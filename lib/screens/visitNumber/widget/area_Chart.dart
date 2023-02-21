import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AreaChart extends StatelessWidget {
  AreaChart({Key? key}) : super(key: key);
  final List<ChartData> chartData = [
    ChartData(1, 5),
    ChartData(2, 28),
    ChartData(3, 34),
    ChartData(4, 32),
    ChartData(5, 40),
    ChartData(6, 35),
    ChartData(7, 28),
    ChartData(8, 34),
    ChartData(9, 10),
    ChartData(10, 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: SfCartesianChart(
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              itemPadding: 0,
              padding: 0,
              legendItemBuilder:
                  (String name, dynamic series, dynamic point, int index) {
                return Container(
                    height: 30,
                    width: 80,
                    child: Row(children: <Widget>[
                      SvgPicture.asset(
                        AppAssets.clock,
                        color: Get.theme.primaryColor,
                      ),
                      SizedBox(width: 8.w),
                      Text('hour'.tr),
                    ]));
              },
              // Overflowing legend content will be wraped
              overflowMode: LegendItemOverflowMode.wrap),
          primaryYAxis: NumericAxis(interval: 50, labelFormat: '{value}%'),
          /*   primaryXAxis: CategoryAxis(
              title: AxisTitle(
            text: 'ساعة',
          )), */
          trackballBehavior: TrackballBehavior(
              enable: true,
              shouldAlwaysShow: true,
              lineColor: Colors.green,
              activationMode: ActivationMode.singleTap,
              //builder: builderMarker,
              tooltipSettings: InteractiveTooltip(
                  color: Colors.white,
                  canShowMarker: false,
                  format: 'point.y',
                  borderColor: Colors.white,
                  textStyle: TextStyle(color: Color(0xff2FB4BD))),
              markerSettings: TrackballMarkerSettings(
                  markerVisibility: TrackballVisibilityMode.visible,
                  height: 15,
                  shape: DataMarkerType.circle,
                  borderWidth: 0,
                  width: 15,
                  color: Colors.deepOrange)),
          title: ChartTitle(),
          //primaryXAxis: DateTimeAxis(),
          series: <ChartSeries>[
            AreaSeries<ChartData, int>(
                dataSource: chartData,
                color: Color(0xffE6E6E6),
                // borderMode: AreaBorderMode.excludeBottom,
                borderColor: Get.theme.primaryColor,
                borderWidth: 2,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
