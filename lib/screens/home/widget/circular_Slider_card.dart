import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';
import 'package:vendor_app_freelance/screens/feedback/view/feedBack.dart';

class CircularSliderCard extends StatelessWidget {
  CircularSliderCard({Key? key}) : super(key: key);
  final slider = SleekCircularSlider(
    initialValue: 48,
    innerWidget: (c) {
      return Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '${c.toInt()}',
            style: TextStyle(
                fontSize: 21.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: '\n' + 'rate'.tr,
                style: TextStyle(fontSize: 12.sp, color: Color(0xff27445F)),
              ),
            ],
          ),
        ),
      );
    },
    appearance: CircularSliderAppearance(
      counterClockwise: true,
      size: 100.sp,
      customColors: CustomSliderColors(
        dynamicGradient: true,
        progressBarColor: Color(0xff6CFEBA),
      ),
      /* infoProperties: InfoProperties(
              bottomLabelText: "jsaa",
              topLabelText: 'ssss',
            ) */
    ),
    //  onChange: (double value) {}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('ratings'.tr
            // 'التقييمات'
            ),
        slider,
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Container(
            width: 120.w,
            height: 20.h,
            child: ElevatedButton(
              onPressed: () {
                navigateScree(FeedBack(), context);
                /*    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => FeedBack())); */
                // Get.toNamed(Routes.feedBack);
              },
              child: Text(
                'allorders'.tr,
                //'جميع الطلبات',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    return Color(0xffEF723C); // Use the component's default.
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class scree2 extends StatelessWidget {
  const scree2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.teal,
      child: Text('dassa'),
    ));
  }
}
