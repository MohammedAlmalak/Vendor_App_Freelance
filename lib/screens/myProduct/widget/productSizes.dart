import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/myProductController.dart';

class productSizes extends StatelessWidget {
  const productSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40.h,
        child: GetBuilder<myProductController>(
            // init: myProductController(),
            builder: ((controller) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.sizes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (() {
                        controller.isInSelectedSizes(
                            controller.sizes[index].sizeIndex);
                        // controller.removeFromSizes(controller
                        //     .sizes[index].keys
                        //     .elementAt(0));
                      }),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(controller.sizes[index].sizeName,
                            style: TextStyle(
                              color: controller.selectedSizes.contains(
                                      controller.sizes[index].sizeIndex)
                                  ? Get.theme.primaryColor
                                  : Colors.grey,
                            )),
                      ));
                }))),
      ),
    );
  }
}

class Size {
  int sizeIndex;
  String sizeName;
  Size({required this.sizeIndex, required this.sizeName});
}
