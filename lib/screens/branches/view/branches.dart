import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/screens/branches/widget/addStoreCard.dart';
import 'package:vendor_app_freelance/screens/branches/widget/branchCard.dart';
import 'package:vendor_app_freelance/screens/branches/widget/buttonsRow.dart';

import '../../../common/backButton.dart';
import '../controller/branchesController.dart';

class Branches extends StatelessWidget {
  const Branches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      body: Container(
        margin: EdgeInsets.only(bottom: 50.h),
        child: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              backButton(),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
          buttonsRow(),
          Expanded(
              child: GetBuilder<branchesController>(
            //init: branchesController(),  the controller has been initialized in buttonsRow()
            builder: (controller) => GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.isEditMode == true
                  ? controller.branchesStores.length + 1
                  : controller.branchesStores.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .7,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                if (controller.isEditMode == true) {
                  if (index == 0) {
                    return addStoreCard();
                  }
                  int branchListInx = index - 1;
                  return BranchCard(
                      branchName:
                          controller.branchesStores[branchListInx].brandName!,
                      storeItems:
                          controller.branchesStores[branchListInx].brandItems!);
                } else {
                  return BranchCard(
                      branchName: controller.branchesStores[index].brandName!,
                      storeItems: controller.branchesStores[index].brandItems!);
                }
              },
            ),
          )),
        ]),
      ),
    );
  }
}




// class store {
//   String storeName;
//   List<String> storeItems;
//   store({required this.storeName, required this.storeItems});
// }
