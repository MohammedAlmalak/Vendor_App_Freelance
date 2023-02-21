import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/staticData.dart';
import 'package:vendor_app_freelance/common/linear_progress_rate.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../main.dart';
import '../../myProduct/view/productReport.dart';

class AcceptItemStatus extends StatelessWidget {
  AcceptItemStatus({
    Key? key,
  }) : super(key: key);
  final List<Product> data = staticData.getAllProducts
      .where((element) => element.productID == 2 || element.productID == 4)
      .toList();

  // [
  //   AcceptItem(
  //       name: 'حذاء رياضي',
  //       num: '102',
  //       rate: '34%+',
  //       image: AppAssets.shose,
  //       parcentage: 78),
  //   AcceptItem(
  //       name: 'تي شيرت',
  //       num: '33',
  //       rate: '10%+',
  //       image: AppAssets.adidasTshert,
  //       parcentage: 43),
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        primary: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) => SizedBox(width: 12.w),
        itemCount: data.length,
        itemBuilder: (c, i) => Container(
          width: 166.w,
          // height: 180.h,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              navigateScree(
                  ProductReport(
                    argumentProdData: data[i],
                  ),
                  context);
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(data[i].productName!,
                                  style: TextStyle(
                                      color: Color(0xff697A8D),
                                      fontSize: 15.sp)),
                              Text(data[i].productDemand.toString(),
                                  style: TextStyle(
                                      color: Color(0xff566A7F),
                                      fontSize: 25.sp)),
                              Container(
                                width: 53.w,
                                height: 22.h,
                                color: Color(0xffD6F5FC),
                                child: Center(
                                    child: Text(
                                  data[i].feedData!.rating,
                                  style: TextStyle(
                                    color: Color(0xff34CEF0),
                                    fontSize: 13.sp,
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Image.asset(data[i].productImg!))
                      ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'salepercentage'.tr,
                            // 'نسبة البيع',
                            style: TextStyle(
                                color: Color(0xffA1ACB8), fontSize: 13.sp),
                          ),
                          LinearProgressRate(
                              percentage: data[i].salePercentage!),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AcceptItem {
  String? name, num, rate, image;
  double? parcentage;
  AcceptItem({
    this.name,
    this.num,
    this.rate,
    this.image,
    this.parcentage,
  });
}
