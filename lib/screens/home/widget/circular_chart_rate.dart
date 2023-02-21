import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularChartRate extends StatelessWidget {
  CircularChartRate({Key? key}) : super(key: key);
  /* final List<ChartData> chartData = [
    ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
  ]; */
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Color(0xff1DD8BD)),
      ChartData('David', 10, Color(0xff5EEFD7)),
    ];
    final List<RowData> rowData = [
      RowData('type'.tr, 'حذاء رياضي'),
      RowData('productcode'.tr, '252555'),
      RowData('trademark'.tr, 'Adidas'),
      RowData('numberofpurchasedtimes'.tr, '25'),
    ];
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'mostpurchasedproducts'.tr,
                // 'اكثر العناصر شراء',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor),
              ),
              ...List.generate(4, (index) => buildRow(rowData, index))
            ],
          ),
        )),
        Expanded(
          child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                      child: Center(
                child: Text('62%\n' + 'purchasepercent'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.sp, color: Color.fromRGBO(0, 0, 0, 0.5))),
              )))
            ],
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  radius: '100%',
                  //endAngle: 260,
                  innerRadius: '75%',
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ],
          ),
        ),
      ],
    );
  }

  buildRow(List<RowData> rowData, index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowData[index].label,
          style: TextStyle(fontSize: 13.sp, color: Color(0xff27445F)),
        ),
        //SizedBox(width: 20.w),
        Container(
          width: 60.w,
          child: Text(
            rowData[index].text,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: index == rowData.length - 1 ? 17.sp : 11.sp,
              fontWeight: index == rowData.length - 1
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: Color(0xff575757),
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class RowData {
  RowData(
    this.label,
    this.text,
  );
  final String label;
  final String text;
}
