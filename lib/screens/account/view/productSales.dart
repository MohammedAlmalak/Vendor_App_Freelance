import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/main.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';
import 'package:vendor_app_freelance/screens/account/view/productSalesDetails.dart';
import 'package:vendor_app_freelance/screens/account/widget/salesListTile.dart';

import '../../../primaryClasses/brand.dart';
import '../../../primaryClasses/products.dart';
import '../../../services/theme/app_Icons.dart';
import '../../../services/theme/app_assets.dart';

class productSales extends StatelessWidget {
  productSales({Key? key}) : super(key: key);
  List<Order> _orders = getOrders();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (c, i) => Divider(
              endIndent: 10.w,
              height: 0,
              indent: 10.w,
              color: Color(0xff042C5C),
            ),
        itemCount: _orders.length,
        itemBuilder: (context, index) => slaesListTile(
            order: _orders[index],
            onListTap: () {
              navigateScree(
                  productSalesDetails(argumentOrderData: _orders[index]),
                  context);
              // Get.toNamed(Routes.productSalesDetails,
              //     arguments: _orders[index]);
            }));
  }
}

late List<Order> orders;
List<Order> getOrders() {
  return orders = [
    Order(
      orderId: 0026524,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 06:30 م",
      receiptTime: "12/4/2022 07:25 م",
      orderProduct: Product(
        productID: 5,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الحياة مول",
        ),
        productName: "تي شيرت",
        productImg: AppAssets.adidasTshert,
        productPrice: 180,
        productDemand: 10,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0089522,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 10:30 ص",
      receiptTime: "12/4/2022 11:40 ص",
      orderProduct: Product(
        productID: 2,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الرياض مول",
        ),
        productName: "هودي",
        productImg: AppAssets.tshertjacket,
        productPrice: 200,
        productDemand: 8,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0026524,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 06:30 م",
      receiptTime: "12/4/2022 07:25 م",
      orderProduct: Product(
        productID: 5,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الحياة مول",
        ),
        productName: "تي شيرت",
        productImg: AppAssets.adidasTshert,
        productPrice: 180,
        productDemand: 10,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0089522,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 10:30 ص",
      receiptTime: "12/4/2022 11:40 ص",
      orderProduct: Product(
        productID: 2,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الرياض مول",
        ),
        productName: "هودي",
        productImg: AppAssets.tshertjacket,
        productPrice: 200,
        productDemand: 8,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0026524,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 06:30 م",
      receiptTime: "12/4/2022 07:25 م",
      orderProduct: Product(
        productID: 5,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الحياة مول",
        ),
        productName: "تي شيرت",
        productImg: AppAssets.adidasTshert,
        productPrice: 180,
        productDemand: 10,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0089522,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 10:30 ص",
      receiptTime: "12/4/2022 11:40 ص",
      orderProduct: Product(
        productID: 2,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الرياض مول",
        ),
        productName: "هودي",
        productImg: AppAssets.tshertjacket,
        productPrice: 200,
        productDemand: 8,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0026524,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 06:30 م",
      receiptTime: "12/4/2022 07:25 م",
      orderProduct: Product(
        productID: 5,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الحياة مول",
        ),
        productName: "تي شيرت",
        productImg: AppAssets.adidasTshert,
        productPrice: 180,
        productDemand: 10,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
    Order(
      orderId: 0089522,
      orderStatus: "تم التسليم",
      orderTime: "12/4/2022 10:30 ص",
      receiptTime: "12/4/2022 11:40 ص",
      orderProduct: Product(
        productID: 2,
        productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandImg: AppAssets.nike,
          brandCategoryIcon: Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandLocation: "الحياة مول",
        ),
        productName: "هودي",
        productImg: AppAssets.tshertjacket,
        productPrice: 200,
        productDemand: 8,
        productColor: "أسود",
        productCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 35,
        ),
      ),
    ),
  ];
}
