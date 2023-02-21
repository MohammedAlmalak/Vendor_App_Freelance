import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productEditing.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productReport.dart';
import '../../../common/appbar_widget.dart';
import '../../../common/card_widget.dart';
import '../../../popUpsDialogs/branchDialog/view/branchDialog.dart';
import '../../../popUpsDialogs/categoryDialog/view/categoryDialog.dart';
import '../../../popUpsDialogs/genderDialog/view/genderDialog.dart';
import '../../../popUpsDialogs/priceDialog/view/priceDialog.dart';
import '../controller/myProductController.dart';
import '../widget/cardItem.dart';

class productItems extends StatelessWidget {
  productItems({Key? key, this.argumentData}) : super(key: key);
  final Product? argumentData;
  // product argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: "منتجاتي",
        body: GetBuilder<myProductController>(
          init: myProductController(),
          builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(children: [
              SizedBox(height: 19.h),
              Row(children: [
                CardWidget(
                  width: 289.w,
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Get.theme.primaryColor),
                        hintText: 'thesearch'.tr,
                        contentPadding: EdgeInsets.all(8.r)),
                  ),
                ),
                SizedBox(width: 12.w),
                CardWidget(
                  width: 44.w,
                  height: 40.h,
                  child: Icon(Icons.format_list_bulleted_rounded,
                      size: 35.sp, color: Get.theme.primaryColor),
                ),
              ]),
              SizedBox(height: 20.h),
              SizedBox(
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          priceDialog(isAscending: (val) {
                            controller.priceFiltration(val);
                          }),
                        ],
                      ),
                    ),
                    backButton()
                  ],
                ),
              ),
              SizedBox(height: 27.h),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.FilterdList != null
                        ? controller.FilterdList!.length
                        : controller.myProductList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: ItemCard(
                          prod: argumentData!,
                          withTwoBtns: true,
                          onEditBtnTap: () {
                            navigateScree(
                                productEditing(argumentProdData: argumentData),
                                context);
                            // Get.toNamed(Routes.productEditing, arguments: argumentData);
                          },
                          onReportBtnTap: () {
                            navigateScree(
                                ProductReport(
                                  argumentProdData: argumentData,
                                ),
                                context);

                            // Get.toNamed(Routes.ProductReport, arguments: argumentData);
                          },
                        ),
                      );
                    }),
              ),
              Container(
                height: 80.h,
              )
            ]),
          ),
        ));
  }
}

// late List<product> allProducts;
// List<product> getAllProducts() {
//   return allProducts = [
//     product(
//       productID: 2,
//       productBrand: brand(
//         brandName: "ADIDAS",
//         brandCategory: "FASHION",
//         brandImg: AppAssets.nike,
//         brandCategoryIcon: Icon(
//           MyIcons.fashiontwo,
//           color: Colors.white,
//         ),
//         brandLocation: "الحياة مول",
//       ),
//       productName: "هودي",
//       productImg: AppAssets.tshertjacket,
//       productPrice: 200,
//       productDemand: 8,
//       productColor: "أسود",
//       productCategoryIcon: Icon(
//         MyIcons.fashiontwo,
//         color: Colors.white,
//         size: 35,
//       ),
//     ),
//     product(
//       productID: 2,
//       productBrand: brand(
//         brandName: "ADIDAS",
//         brandCategory: "FASHION",
//         brandImg: AppAssets.nike,
//         brandCategoryIcon: Icon(
//           MyIcons.fashiontwo,
//           color: Colors.white,
//         ),
//         brandLocation: "الحياة مول",
//       ),
//       productName: "هودي",
//       productImg: AppAssets.tshertjacket,
//       productPrice: 200,
//       productDemand: 8,
//       productColor: "أسود",
//       productCategoryIcon: Icon(
//         MyIcons.fashiontwo,
//         color: Colors.white,
//         size: 35,
//       ),
//     ),
//     product(
//       productID: 2,
//       productBrand: brand(
//         brandName: "ADIDAS",
//         brandCategory: "FASHION",
//         brandImg: AppAssets.nike,
//         brandCategoryIcon: Icon(
//           MyIcons.fashiontwo,
//           color: Colors.white,
//         ),
//         brandLocation: "الحياة مول",
//       ),
//       productName: "هودي",
//       productImg: AppAssets.tshertjacket,
//       productPrice: 200,
//       productDemand: 8,
//       productColor: "أسود",
//       productCategoryIcon: Icon(
//         MyIcons.fashiontwo,
//         color: Colors.white,
//         size: 35,
//       ),
//     ),
//     product(
//       productID: 2,
//       productBrand: brand(
//         brandName: "ADIDAS",
//         brandCategory: "FASHION",
//         brandImg: AppAssets.nike,
//         brandCategoryIcon: Icon(
//           MyIcons.fashiontwo,
//           color: Colors.white,
//         ),
//         brandLocation: "الحياة مول",
//       ),
//       productName: "هودي",
//       productImg: AppAssets.tshertjacket,
//       productPrice: 200,
//       productDemand: 8,
//       productColor: "أسود",
//       productCategoryIcon: Icon(
//         MyIcons.fashiontwo,
//         color: Colors.white,
//         size: 35,
//       ),
//     ),
//     product(
//       productID: 2,
//       productBrand: brand(
//         brandName: "ADIDAS",
//         brandCategory: "FASHION",
//         brandImg: AppAssets.nike,
//         brandCategoryIcon: Icon(
//           MyIcons.fashiontwo,
//           color: Colors.white,
//         ),
//         brandLocation: "الحياة مول",
//       ),
//       productName: "هودي",
//       productImg: AppAssets.tshertjacket,
//       productPrice: 200,
//       productDemand: 8,
//       productColor: "أسود",
//       productCategoryIcon: Icon(
//         MyIcons.fashiontwo,
//         color: Colors.white,
//         size: 35,
//       ),
//     ),
//   ];
// }
