import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/getRowData.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

class mostPurchasedCard extends StatelessWidget {
  Product prod;
  mostPurchasedCard({Key? key, required this.prod}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      padding: const EdgeInsets.all(10),
      height: .25.sh,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5), blurRadius: 2.0,
              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Center(child: prod.productCategoryIcon!),
              ),
              SizedBox(
                height: 10.h,
              ),
              getRowData(Label: 'productname'.tr, txt: prod.productName!),
              getRowData(
                  Label: 'thebranch'.tr,
                  Img: SvgPicture.asset(AppAssets.building),
                  txt: prod.productBrand!.brandLocation!),
              getRowData(
                  Label: 'theprice'.tr,
                  Img: SvgPicture.asset(AppAssets.label),
                  txt: prod.productPrice.toString() + " " + "ksacurrency".tr),
              prod.productColor != null
                  ? getRowData(
                      Label: 'color'.tr,
                      Img: SvgPicture.asset(AppAssets.blackCheck),
                      txt: prod.productColor!)
                  : Container(),
              prod.productSize != null
                  ? getRowData(
                      Label: 'size'.tr,
                      Img: SvgPicture.asset(
                        AppAssets.ML,
                        color: Get.theme.primaryColor,
                      ),
                      txt: prod.productSize!)
                  : Container(),
            ],
          ),
          // Container(
          //   color: Colors.blue,
          //   height: .2.sh,
          //   width: .3.sw,
          //   child: LayoutBuilder(
          //       builder: (BuildContext context, BoxConstraints constraints) {
          //     double innerHeight = constraints.maxHeight;
          //     double innerWidth = constraints.maxWidth;
          //     return SizedBox(
          //       height: .65 * innerHeight,
          //       width: .2 * innerWidth,
          //       child: Image.asset(prod.productImg),
          //     );
          //   }),
          // )
          Container(
            height: .22.sh,
            width: .3.sw,
            child: Image.asset(prod.productImg!),
          )
        ],
      ),
    );
  }
}
