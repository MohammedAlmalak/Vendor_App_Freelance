import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/appbar_widget.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/clasifaction_widget.dart';
import 'package:vendor_app_freelance/common/datePicker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/screens/feedback/widget/feedBackCard_widget.dart';

import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../controller/feedBackCon.dart';

class FeedBack extends StatelessWidget {
  FeedBack({Key? key}) : super(key: key);
  // final List clasifaction = [
  //   AppAssets.category,
  //   AppAssets.type,
  //   AppAssets.branch,
  // ];
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: "التقيمات",
        body: GetBuilder<feedBackCon>(
          init: feedBackCon(),
          builder: (controller) => Column(
            children: [
              SizedBox(height: 10.h),
              DatePickerWidget(),
              SizedBox(height: 10.h),
              // Clasifaction(clasifaction: clasifaction),
              SizedBox(
                height: 30.h,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryDialog(
                            onSelectedCategory: (val) {
                              controller.categoryFiltration(val);
                            },
                          ),
                          genderDialog(
                            onGenderSelected: (val) {
                              controller.genderFiltration(val);
                            },
                          ),
                          branchDialog(
                            onBranchSelected: (val) {
                              controller.branchFiltration(val);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: backButton())
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.FilterdList != null
                        ? controller.FilterdList!.length
                        : controller.feedBackList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FeedBackCard(
                              feedData: controller.FilterdList != null
                                  ? controller.FilterdList![index].feedData!
                                  : controller.feedBackList[index].feedData!));
                    }),
              ),
              // ...List.generate(
              //   5,
              //   (index) => Padding(
              //       padding: const EdgeInsets.all(8.0), child: FeedBackCard()),
              // )
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        ));
  }
}
