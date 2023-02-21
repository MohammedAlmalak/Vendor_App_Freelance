import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../services/theme/app_assets.dart';
import '../controller/accountController.dart';

class overView extends StatelessWidget {
  overView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            margin: EdgeInsets.zero,
            child: Container(
              width: 343.w,
              height: 342.h,
              child: Center(
                child: GetBuilder<accountController>(
                    init: accountController(),
                    builder: ((controller) => SleekCircularSlider(
                        onChange: (value) {},
                        initialValue: controller.overViewConter,
                        innerWidget: (v) => Center(
                                child: Text(
                              (controller.overViewConter * 5).toString() +
                                  " " +
                                  "ksacurrency".tr,
                              style: TextStyle(fontSize: 30.sp),
                            )),
                        appearance: CircularSliderAppearance(
                          // spinnerMode: true,
                          customColors: CustomSliderColors(
                            dynamicGradient: true,
                            progressBarColor: Get.theme.primaryColor,
                          ),
                          customWidths: CustomSliderWidths(
                              //handlerSize: 20,
                              progressBarWidth: 17,
                              shadowWidth: 10,
                              handlerSize: 0,
                              trackWidth: 17),
                          size: 250,
                        )))),
              ),
              //TODO
            ),
          ),
        ),
        SizedBox(height: 10.5.h),
        ...List.generate(
            3,
            (index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 23.5.w, vertical: 10.h),
                  child: rowImageTextPrice(RowWithSVG[index]),
                )),
      ],
    );
  }

  Widget rowImageTextPrice(RowImagePriceText rowWithSVG) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(AppAssets.orangeBackGroound),
                  SvgPicture.asset(rowWithSVG.AssetImage!),
                ],
              ),
              Text(
                rowWithSVG.title!,
                style: GoogleFonts
                    .cairo(), /* TextStyle(color: Color(0xff808080)), */
              ),
              Text(
                rowWithSVG.price!,
                style: TextStyle(color: Color(0xff042C5C)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<RowImagePriceText> RowWithSVG = [
    RowImagePriceText(
        AssetImage: AppAssets.tshertLogo,
        price: '2000' + " " + "ksacurrency".tr,
        title: 'تي شيرت'),
    RowImagePriceText(
        AssetImage: AppAssets.prfumLogo,
        price: '2000' + " " + "ksacurrency".tr,
        title: 'عطور'),
    RowImagePriceText(
        AssetImage: AppAssets.dressLogo,
        price: '2000' + " " + "ksacurrency".tr,
        title: 'فستان')
  ];
}

class RowImagePriceText {
  String? AssetImage;
  String? title;
  String? price;
  RowImagePriceText({this.AssetImage, this.price, this.title});
}
