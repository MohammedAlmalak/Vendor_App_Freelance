import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/popUpsDialogs/cancellationReasonDialog/view/cancellationDialog.dart';
import 'package:vendor_app_freelance/screens/notification/widget/notificationCard.dart';
import 'package:vendor_app_freelance/screens/oeders/view/singleOrderPage.dart';
import 'package:vendor_app_freelance/staticData.dart';
import '../../../../services/theme/app_assets.dart';
import '../../../services/translate/translate.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationCard> _notifications = getNotifications(context);
    return ScafoldWidget(
        title: 'notifications'.tr,
        body: Container(
          margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 25.h),
          width: double.infinity,
          height: .8.sh,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0.r,
                offset: Offset(2, 2), // shadow direction: bottom right
              )
            ],
            border: Border.all(width: .5, color: const Color(0xFFBDBDBD)),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r),
            ),
          ),
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              AppAssets.notification,
            ),
            Container(
              width: .97.sw,
              height: .79.sh,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _notifications.length,
                  itemBuilder: (context, index) {
                    return _notifications[index];
                  }),
            ),
          ]),
        ));
  }
}

List<NotificationCard> notifications = [];
List<NotificationCard> getNotifications(BuildContext context) {
  notifications = [
    NotificationCard(
      notificationTxt:
          "delayinpreparingorderNo".tr + " " + "07176055684" + "  ",
      importantTxt: "12" + "min".tr,
      onTap: () {
        navigateScree(
            singleOrderPage(
              ord: staticData.getAllOrders
                  .firstWhere((element) => element.orderId == 007176),
            ),
            context);
      },
    ),
    NotificationCard(
      notificationTxt: "remainfordeliveringyourorder".tr + "  ",
      importantTxt: "5" + "min".tr,
      onTap: () {
        navigateScree(
            singleOrderPage(
              ord: staticData.getAllOrders
                  .firstWhere((element) => element.orderId == 003451),
            ),
            context);
      },
    ),
    NotificationCard(
      notificationTxt: Get.find<TranslationService>().getLocale() ==
              Locale("ar")
          ? "hasbeencanceled".tr + " " + "orderNo".tr + " " + "5883285" + "  "
          : "orderNo".tr + " " + "5883285" + " " + "hasbeencanceled".tr + "  ",
      importantTxt: "sendcancellationreason".tr,
      onTap: () {
        cancellationReasonDialog();
      },
    ),
  ];
  return notifications;
}
