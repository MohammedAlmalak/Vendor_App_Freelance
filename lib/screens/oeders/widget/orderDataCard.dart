import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:vendor_app_freelance/common/getRowData.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';
import 'package:vendor_app_freelance/screens/oeders/widget/expanCard.dart';
import 'package:vendor_app_freelance/screens/oeders/widget/orderButtons.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../popUpsDialogs/cancellationReasonDialog/view/cancellationDialog.dart';
import '../controller/ordersController.dart';

class OrderDataCard extends StatelessWidget {
  final Order order;
  final int? index;
  OrderDataCard({
    Key? key,
    required this.order,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ordersController>(
        init: ordersController(),
        builder: ((controller) => ExpanCard(
              cardHeader: getCardHeader(),
              cardBody: getCardBody(),
              Img: Image.asset(order.orderProduct.productImg!),
              orderStatus: order.orderStatus,
              isExpanded: controller.isExpanded[index!],
              onCardTap: () {
                controller.changeExpan(index!);
              },
            )));
  }

  Widget getCardHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.orderProduct.productName! +
              " " +
              order.orderProduct.productBrand!.brandName!,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff575757)),
        ),
        Text(
          "theprice".tr +
              " " +
              order.orderProduct.productPrice.toString() +
              " " +
              "ksacurrency".tr,
          style: TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
        ),
        SizedBox(height: 10.h),
        getRowData(
          Label: 'categories'.tr,
          txt: order.orderProduct.productBrand!.brandCategory,
          Img: order.orderProduct.productCategoryIcon,
        ),
        getRowData(
          Label: "trademark".tr,
          txt: order.orderProduct.productBrand!.brandName!,
          Img: Image.asset(order.orderProduct.productBrand!.brandImg!),
        ),
        order.orderStatus != null
            ? getRowData(
                Label: 'orderstatus'.tr,
                txt: order.orderStatus!,
                Img: Container(
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: 1,
                    backgroundColor: getStatusColor(),
                  ),
                ),
              )
            : getRowData(
                Label: 'orderstatus'.tr,
                txt: "لم يحدد بعد",
                Img: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(width: .5, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: CircleAvatar(
                    radius: 1,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
      ],
    );
  }

  Widget getCardBody() {
    return Expanded(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          getRowData(
              Label: 'orderno'.tr,
              Img: SvgPicture.asset(
                AppAssets.calender,
              ),
              txt: order.orderId.toString()),
          getRowData(
              Label: 'ordertime'.tr,
              Img: SvgPicture.asset(
                AppAssets.clock,
                color: Get.theme.primaryColor,
              ),
              txt: "06:26 م"),
          getRowData(
              Label: 'thebranch'.tr,
              Img: SvgPicture.asset(
                AppAssets.building,
              ),
              txt: order.orderProduct.productBrand!.brandLocation!),
          order.orderProduct.productColor != null
              ? getRowData(
                  Label: 'color'.tr,
                  Img: Container(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 1,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  txt: order.orderProduct.productColor!)
              : Container(),
          SizedBox(
            height: 5.h,
          ),
          order.orderProduct.productSize != null
              ? getRowData(
                  Label: 'size'.tr,
                  Img: SvgPicture.asset(
                    AppAssets.ML,
                    color: Get.theme.primaryColor,
                  ),
                  txt: order.orderProduct.productSize!)
              : Container(),
          Row(
            children: [
              getRowData(
                  Label: 'receipttime'.tr,
                  Img: SvgPicture.asset(
                    AppAssets.clock,
                    color: Get.theme.primaryColor,
                  ),
                  txt: "during".tr),
              Container(
                  width: 70.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      border: Border.all(width: 0, color: Color(0xffDFE3E9))),
                  /*   decoration: BoxDecoration(
                                    border: Border.all(width: 0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.r)),
                                  ), */
                  child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      alignment: Alignment.center,
                      iconEnabledColor: Get.theme.primaryColor,
                      iconDisabledColor: Get.theme.primaryColor,
                      dropdownColor: Colors.white,
                      items: items,
                      value: 's',
                      onChanged: (v) {})),
              // order.orderStatus == "متآخر"
              //     ? Text(
              //         "متآخر 12 د",
              //         style: TextStyle(color: Colors.red),
              //       )
              //     : Container()
            ],
          ),
          SizedBox(height: 10.h),
          if (order.orderStatus == "قيد التجهيز")
            //|| order.orderStatus == "ملغى")
            orderButtons(
              txt: "theorderhasbeenprepared".tr,
              btnWidth: 175.w,
            ),
          if (order.orderStatus == "جاهز للتسليم")
            orderButtons(
                btnWidth: 175.w,
                backGroungColor: Colors.green,
                txt: "theorderhasbeendelivered".tr),
          if (order.orderStatus == null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 82.w,
                  height: 22.h,
                  child: GFButton(
                    color: Color(0xff4EFF78),
                    onPressed: () {},
                    text: "accept".tr,
                    textStyle: TextStyle(fontSize: 12.sp),
                    icon: Icon(
                      Icons.check_rounded,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 13.w),
                Container(
                  width: 82.w,
                  height: 22.h,
                  child: GFButton(
                    color: Color.fromARGB(218, 241, 52, 52),
                    onPressed: () {
                      cancellationReasonDialog();
                    },
                    text: "cancel".tr,
                    textStyle: TextStyle(fontSize: 12.sp),
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  final List<DropdownMenuItem<String>>? items = [
    DropdownMenuItem(
        value: 's',
        child: Center(
            child: Text(
          '30 د',
          style: TextStyle(fontSize: 13.sp),
        ))),
    DropdownMenuItem(
        value: 'a',
        child: Center(
            child: Text(
          '60 د',
          style: TextStyle(fontSize: 13.sp),
        ))),
    DropdownMenuItem(
        value: 'sa',
        child: Center(
            child: Text(
          '15 د',
          style: TextStyle(fontSize: 13.sp),
        ))),
  ];
  Color getStatusColor() {
    if (order.orderStatusInt == 0) {
      return Color(0xff2FB4BD);
    } else if (order.orderStatusInt == 1) {
      return Color.fromARGB(255, 25, 23, 182);
    } else if (order.orderStatusInt == 2) {
      return Get.theme.primaryColor;
    } else {
      return Color(0xFFDF3939);
    }
  }
}
