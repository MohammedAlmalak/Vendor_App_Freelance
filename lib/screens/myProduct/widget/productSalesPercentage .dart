import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class productSalesPercentage extends StatelessWidget {
  const productSalesPercentage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<salesData> proSalesData = [
      salesData(day: 1, percentage: 20.5),
      salesData(day: 2, percentage: 30.5),
      salesData(day: 3, percentage: 55.5),
      salesData(day: 4, percentage: 70.5),
      salesData(day: 5, percentage: 40.5),
    ];
    final List<Color> color = <Color>[];

    color.add(Colors.deepOrange[50]!.withOpacity(0.4));
    color.add(Colors.deepOrange[200]!.withOpacity(0.4));
    color.add(Colors.deepOrange.withOpacity(0.4));
    color.add(Colors.deepOrange[200]!.withOpacity(0.4));
    color.add(Colors.deepOrange[50]!.withOpacity(0.4));
    color.add(Colors.deepOrange.withOpacity(0.4));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.4);
    stops.add(0.8);
    stops.add(4);
    stops.add(8);
    stops.add(0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    var textStyle2 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold);
    return SfCartesianChart(
        enableAxisAnimation: true,
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        /*   title: ChartTitle(
            text: '   معدل المبيعات',
            alignment: ChartAlignment.far,
            textStyle: TextStyle(
                color: Get.theme.primaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold)), */
        // borderWidth: 2,
        // primaryYAxis: NumericAxis(isVisible: true),

        primaryYAxis: NumericAxis(
          interval: 100,
          maximum: 100,
          anchorRangeToVisiblePoints: false,
          edgeLabelPlacement: EdgeLabelPlacement.none,
          placeLabelsNearAxisLine: false, crossesAt: 30,
          labelFormat: '{value}%',
          rangePadding: ChartRangePadding.round,
          //  majorGridLines: ,
          //   title: AxisTitle(text: 'النسبة', textStyle: textStyle2),
        ),
        primaryXAxis: NumericAxis(
          maximum: 5,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          minorGridLines: MinorGridLines(width: 0),

          majorTickLines:
              MajorTickLines(size: 6, width: 2, color: Get.theme.primaryColor),
          minorTickLines: MinorTickLines(size: 4, width: 2, color: Colors.grey),
          minorTicksPerInterval: 1,
          // rangePadding: ChartRangePadding.round,
          title: AxisTitle(
            text: 'day'.tr,
            textStyle: textStyle2,
          ),
        ),
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
        series: <ChartSeries>[
          SplineAreaSeries<salesData, int>(
              borderColor: Get.theme.primaryColor,
              borderWidth: 2,
              dataSource: proSalesData,
              gradient: gradientColors,
              //dashArray: <double>[5, 5],
              /*   dataLabelSettings: DataLabelSettings(
                  labelIntersectAction: LabelIntersectAction.none), */
              splineType: SplineType.natural,
              xAxisName: 'اليوم',
              yAxisName: 'النسبة',
              xValueMapper: (salesData data, _) => data.day,
              yValueMapper: (salesData data, _) => data.percentage)
        ]);
  }
}

class salesData {
  final int day;
  final double percentage;
  salesData({required this.day, required this.percentage});
}
