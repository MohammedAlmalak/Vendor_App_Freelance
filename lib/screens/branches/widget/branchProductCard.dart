import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';

class BranchProductCard extends StatelessWidget {
  Product prod;
  BranchProductCard({Key? key, required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Container(
        width: .4.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0.r,
              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          border: Border.all(width: .5, color: const Color(0xFFBDBDBD)),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: .17.sh,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double innerHeight = constraints.maxHeight;
                double innerWidth = constraints.maxWidth;

                return Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: innerHeight * .88,
                      width: innerWidth,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: 2.isEven ? Colors.pink[50] : Colors.blue[50],
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Center(
                          child: Image.asset(
                        prod.productImg!,
                        fit: BoxFit.contain,
                      )),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: const Color(0xFFF26511),
                        child: prod.productBrand?.brandCategoryIcon,
                      )),
                  Positioned(
                      top: 5,
                      left: 15,
                      child: SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset(
                          prod.productBrand!.brandImg!,
                          fit: BoxFit.contain,
                        ),
                      )),
                ]);
              }),
            ),
            Text(prod.productName!),
            Text("theprice".tr +
                " " +
                prod.productPrice.toString() +
                " " +
                "ksacurrency".tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF26511),
                    //  borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      prod.productDemand.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // CircleAvatar(
                //   radius: 17.r,
                //   backgroundColor: const Color(0xFFF26511),
                //   child: Center(
                //     child: Text(
                //       prod.productDemand.toString(),
                //       style: TextStyle(
                //           color: Colors.white, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "order".tr,
                  style: TextStyle(
                      color: const Color(0xFFF26511),
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
