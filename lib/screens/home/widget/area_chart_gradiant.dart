import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../primaryClasses/ChartData.dart';

class AreaChartGradiant extends StatelessWidget {
  AreaChartGradiant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 34.3),
      ChartData(2, 39.2),
      ChartData(3, 45.2),
      ChartData(4, 52.8),
      ChartData(5, 45),
      ChartData(6, 37),
      ChartData(7, 40),
      ChartData(8, 50),
      ChartData(9, 60),
      ChartData(10, 70),
      ChartData(11, 80),
      ChartData(12, 85),
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
          interval: 20,
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
          maximum: 12,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          minorGridLines: MinorGridLines(width: 0),

          majorTickLines:
              MajorTickLines(size: 6, width: 2, color: Get.theme.primaryColor),
          minorTickLines: MinorTickLines(size: 4, width: 2, color: Colors.grey),
          minorTicksPerInterval: 1,
          // rangePadding: ChartRangePadding.round,
          title: AxisTitle(text: 'month'.tr, textStyle: textStyle2),
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
          SplineAreaSeries<ChartData, int>(
              borderColor: Get.theme.primaryColor,
              borderWidth: 2,
              dataSource: chartData,
              gradient: gradientColors,
              //dashArray: <double>[5, 5],
              /*   dataLabelSettings: DataLabelSettings(
                  labelIntersectAction: LabelIntersectAction.none), */
              splineType: SplineType.natural,
              xAxisName: 'الشهر',
              yAxisName: 'النسبة',
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]);
  }
}
