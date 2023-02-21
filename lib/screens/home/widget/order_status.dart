import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/screens/orderStatusDetails/view/orderStatusDetails.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class OrderStatus extends StatelessWidget {
  OrderStatus({
    Key? key,
    this.index,
  }) : super(key: key);
  final index;
  final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: Color(0xffFCFCFC),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        // offset: Offset(0, 0), //(x,y)
        blurRadius: 4,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateScree(OrderStatusDetails(orderStatusInt: index), context);
      },
      child: Container(
        decoration: boxDecoration,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        width: 125.w,
        child: Column(
          children: [
            SizedBox(height: 7.h),
            card[index],
            SizedBox(height: 8.h),
            numOrder[index],
            // Expanded(
            //     child: ChartOrders(
            //   index: index,
            // )),
            Expanded(child: getWave[index]),
            // Expanded(
            //   child: ClipPath(
            //     clipper: waveClipper(),
            //     child: Container(
            //       color: Colors.red,
            //       height: 30.h,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  final List<Widget> card = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.doneOrder,
              height: 25.h,
              width: 25.w,
            ),
            SvgPicture.asset(
              AppAssets.trueIcon,
              height: 12.h,
              width: 12.w,
            ),
          ],
        ),
        Text(
          'delivered'.tr,
          //'تم التسليم',
          style: TextStyle(color: Color(0xff2FB4BD)),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.iqnoringOrder,
              height: 25.h,
              width: 25.w,
            ),
            SvgPicture.asset(
              AppAssets.clockIgn,
              height: 15.h,
              width: 15.w,
            ),
          ],
        ),
        Text(
          'prepared'.tr,
          //'جاهز للتسليم',
          style: TextStyle(color: Color.fromARGB(255, 25, 23, 182)),
          maxLines: 2,
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.waitingOrder,
              height: 25.h,
              width: 25.w,
            ),
            SvgPicture.asset(
              AppAssets.clock,
              height: 15.h,
              width: 15.w,
            ),
          ],
        ),
        Text(
          'inpreparation'.tr,
          // 'قيد التجهيز',
          style: TextStyle(color: Get.theme.primaryColor),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.redRectangle,
              height: 25.h,
              width: 25.w,
            ),
            SvgPicture.asset(
              AppAssets.canceledorders,
              height: 15.h,
              width: 15.w,
            ),
          ],
        ),
        Text(
          'canceled'.tr,
          //  'ملغي',
          style: TextStyle(color: Color(0xFFDF3939)),
        ),
      ],
    ),
  ];
  final List<Widget> numOrder = [
    Text(
      '34\n' + 'order'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(height: 1.5, fontSize: 13.sp, color: Color(0xff2FB4BD)),
    ),
    Text(
      '9\n' + 'order'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
          height: 1.5,
          fontSize: 13.sp,
          color: Color.fromARGB(255, 25, 23, 182)),
    ),
    Text(
      '21\n' + 'order'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
          height: 1.5, fontSize: 13.sp, color: Get.theme.primaryColor),
    ),
    Text(
      '5\n' + 'order'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(height: 1.5, fontSize: 13.sp, color: Color(0xFFDF3939)),
    )
  ];
}

final List<Widget> getWave = [
  buildWave(
    config: CustomConfig(
      gradients: [
        [
          Color.fromARGB(255, 248, 217, 199),
          Color.fromARGB(255, 239, 225, 216)
        ],
        [Color(0xff2FB4BD), Color.fromARGB(255, 204, 230, 232)]
      ],
      durations: [
        35000,
        // 19440,
        10800,
        // 6000
      ],
      heightPercentages: [
        0.20,
        // 0.23,
        //  0.25,
        0.30
      ],
      // blur: _blur,
      gradientBegin: Alignment.bottomLeft,
      gradientEnd: Alignment.topRight,
    ),
  ),
  buildWave(
    config: CustomConfig(
      gradients: [
        [
          Color.fromARGB(255, 248, 217, 199),
          Color.fromARGB(255, 239, 225, 216)
        ],
        [Color.fromARGB(255, 25, 23, 182), Color.fromARGB(255, 207, 206, 238)],
      ],
      durations: [
        35000,
        // 19440,
        10800,
        // 6000
      ],
      heightPercentages: [
        0.20,
        // 0.23,
        //  0.25,
        0.30
      ],
      // blur: _blur,
      gradientBegin: Alignment.bottomLeft,
      gradientEnd: Alignment.topRight,
    ),
  ),
  buildWave(
    config: CustomConfig(
      gradients: [
        [
          Color.fromARGB(255, 248, 217, 199),
          Color.fromARGB(255, 239, 225, 216)
        ],
        [Color(0xFFF26511), Color.fromARGB(255, 235, 181, 149)],
      ],
      durations: [
        35000,
        // 19440,
        10800,
        // 6000
      ],
      heightPercentages: [
        0.20,
        // 0.23,
        //  0.25,
        0.30
      ],
      // blur: _blur,
      gradientBegin: Alignment.bottomLeft,
      gradientEnd: Alignment.topRight,
    ),
  ),
  buildWave(
    config: CustomConfig(
      gradients: [
        [
          Color.fromARGB(255, 248, 217, 199),
          Color.fromARGB(255, 239, 225, 216)
        ],
        [Color(0xFFDF3939), Color.fromARGB(255, 239, 173, 173)],
      ],
      durations: [
        35000,
        // 19440,
        10800,
        // 6000
      ],
      heightPercentages: [
        0.20,
        // 0.23,
        //  0.25,
        0.30
      ],
      // blur: _blur,
      gradientBegin: Alignment.bottomLeft,
      gradientEnd: Alignment.topRight,
    ),
  )
];

// buildWave({
//   required Color waveColor,
// }) {
//   return Container(
//     height: 60.h,
//     width: double.infinity,
//     clipBehavior: Clip.antiAlias,
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//     child: Stack(children: [
//       Container(
//         width: 100.w,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(200),
//               topLeft: Radius.circular(15),
//             ),
//             color: waveColor),
//       ),
//       Container(
//         width: 55.w,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(50),
//               topLeft: Radius.circular(70),
//             ),
//             color: Colors.red),
//       ),
//     ]),
//   );
// }

buildWave({
  required Config config,
  Color backgroundColor = Colors.transparent,
  // DecorationImage backgroundImage,
  double height = 60.0,
}) {
  return Container(
    height: height,
    width: double.infinity,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child:
        //  Card(
        //   // elevation: 12.0,
        //   // margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        //   clipBehavior: Clip.antiAlias,
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //   child:
        WaveWidget(
      config: config,
      backgroundColor: backgroundColor,
      // backgroundImage: backgroundImage,
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 0,
    ),
    // ),
  );
}

// class ChartOrders extends StatelessWidget {
//   const ChartOrders({
//     Key? key,
//     this.index,
//   }) : super(key: key);
//   final index;
//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [
//       ChartData(2018, 3.203),
//       ChartData(2017, 7.401),
//       ChartData(2016, 4.304),
//       ChartData(2015, 6.222),
//       ChartData(2014, 3.225),
//       ChartData(2013, 1.5002),
//     ];
//     final List<List<Color>> color = <List<Color>>[[], [], [], []];
//     color[0].add(Colors.blue[50]!);
//     color[0].add(Colors.blue[200]!);
//     color[0].add(Colors.blue);
//     color[1].add(Colors.blue[50]!);
//     color[1].add(Color.fromARGB(255, 65, 63, 179));
//     color[1].add(Color.fromARGB(255, 55, 19, 155));
//     color[2].add(Colors.blue[50]!);
//     color[2].add(Color.fromARGB(255, 230, 113, 45));
//     color[2].add(Color.fromARGB(255, 245, 103, 22));
//     color[3].add(Colors.blue[50]!);
//     color[3].add(Color.fromARGB(255, 240, 128, 128));
//     color[3].add(Color(0xFFDF3939));

//     final List<List<double>> stops = <List<double>>[[], [], [], []];
//     stops[0].add(0.0);
//     stops[0].add(0.5);
//     stops[0].add(1.0);
//     stops[1].add(0.0);
//     stops[1].add(0.5);
//     stops[1].add(1.0);
//     stops[2].add(0.0);
//     stops[2].add(0.5);
//     stops[2].add(1.0);
//     stops[3].add(0.0);
//     stops[3].add(0.5);
//     stops[3].add(1.0);

//     final LinearGradient gradientColors =
//         LinearGradient(colors: color[index], stops: stops[index]);
//     return SfCartesianChart(
//         margin: EdgeInsets.zero,
//         plotAreaBorderWidth: 0, //
//         // borderWidth: 2,
//         primaryYAxis: NumericAxis(isVisible: false),
//         primaryXAxis: NumericAxis(isVisible: false),
//         series: <ChartSeries>[
//           SplineAreaSeries<ChartData, int>(
//               borderColor: Colors.black,
//               // borderWidth: 2,
//               dataSource: chartData,
//               gradient: gradientColors,
//               dashArray: <double>[5, 5],
//               dataLabelSettings: DataLabelSettings(
//                   labelIntersectAction: LabelIntersectAction.none),
//               xValueMapper: (ChartData data, _) => data.x,
//               yValueMapper: (ChartData data, _) => data.y)
//         ]);
//   }
//}

// class waveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0.0, size.height * .3);
//     path.cubicTo(size.width * .2, (size.height * .7), 2 * (size.width / 4),
//         size.height / 2, size.width * .5, 0.0);
//     path.cubicTo(
//         size.width * .5, 0.0, size.width * .7, size.height, size.width, 0.0);
//     // path.quadraticBezierTo(
//     //     size.width * .2, size.height - 5, size.width * .3, 0);
//     // path.relativeQuadraticBezierTo(
//     //     size.width * .3, size.height + 30, size.width * 5, 0);
//     // path.relativeQuadraticBezierTo(
//     //     size.width * .5, size.height + 10, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
