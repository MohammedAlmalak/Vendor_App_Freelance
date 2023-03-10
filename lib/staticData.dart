import 'package:flutter/material.dart';
import 'package:vendor_app_freelance/primaryClasses/products.dart';
import 'package:vendor_app_freelance/screens/feedback/widget/feedBackCard_widget.dart';

import 'primaryClasses/brand.dart';
import 'primaryClasses/orders.dart';
import 'services/theme/app_Icons.dart';
import 'services/theme/app_assets.dart';

class staticData {
  static final List<Product> getAllProducts = [
    Product(
      productID: 1,
      productBrand: brand(
          brandName: "ADIDAS",
          brandCategory: "FASHION",
          brandCategoryIcon: const Icon(
            MyIcons.fashiontwo,
            color: Colors.white,
          ),
          brandImg: AppAssets.nike,
          brandLocation: "الحياة مول",
          brandLocationId: 0),
      productName: "جاكيت",
      productImg: AppAssets.tshertjacket,
      productPrice: 420,
      productNewPrice: 320,
      productDemand: 8,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
        size: 35,
      ),
      productGender: 0,
      productSize: "L",
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'احمد رائد علي',
        date: "27/10/2022",
        rating: "5/5",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.tshertjacket,
      ),
    ),
    Product(
      productID: 2,
      productBrand: brand(
        brandName: "ADIDAS",
        brandCategory: "FASHION",
        brandCategoryIcon: const Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
        ),
        brandImg: AppAssets.nike,
        brandLocation: "الحياة مول",
        brandLocationId: 0,
      ),
      productName: "تي شيرت",
      productImg: AppAssets.adidasTshert,
      productPrice: 350,
      productNewPrice: 266,
      productDemand: 33,
      salePercentage: 43.0,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
      ),
      productGender: 0,
      productSize: "XL",
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'احمد علي',
        date: "27/10/2022",
        rating: "+10%",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.shose,
      ),
    ),
    Product(
      productID: 3,
      productBrand: brand(
        brandName: "ADIDAS",
        brandCategory: "FASHION",
        brandCategoryIcon: const Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
        ),
        brandImg: AppAssets.nike,
        brandLocation: "الحياة مول",
        brandLocationId: 0,
      ),
      // brandImg: Image.asset(
      //   'images/7.png',
      //   fit: BoxFit.cover,
      // ),
      productName: "هوديز",
      productImg: AppAssets.hodies,
      productPrice: 400,
      productNewPrice: 304,
      productDemand: 20,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
      ),
      productGender: 2,
      productSize: "M",
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'احمد علي',
        date: "27/10/2022",
        rating: "5/5",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.shose,
      ),
    ),
    Product(
      productID: 4,
      productBrand: brand(
        brandName: "ADIDAS",
        brandCategory: "FASHION",
        brandCategoryIcon: const Icon(MyIcons.fashiontwo, color: Colors.white),
        brandImg: AppAssets.nike,
        brandLocation: "النخيل مول",
        brandLocationId: 1,
      ),
      productName: "حذاء رياضي",
      productImg: AppAssets.shose,
      productPrice: 250,
      productNewPrice: 190,
      productDemand: 102,
      salePercentage: 78.0,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
      ),
      productGender: 0,
      productSize: "34",
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'احمد علي',
        date: "27/10/2022",
        rating: "+34%",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.shose,
      ),
    ),
    Product(
      productID: 5,
      productBrand: brand(
        brandName: "ADIDAS",
        brandCategory: "FASHION",
        brandCategoryIcon: const Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
        ),
        brandImg: AppAssets.nike,
        brandLocation: "النخيل مول",
        brandLocationId: 1,
      ),
      // brandImg: Image.asset(
      //   'images/7.png',
      //   fit: BoxFit.cover,
      // ),
      productName: "حقيبة رياضية",
      productImg: AppAssets.bag,
      productPrice: 120,
      productNewPrice: 91,
      productDemand: 8,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
      ),
      productGender: 0,
      productSize: "L",
      productCtegory: 0,
    ),
    Product(
      productID: 6,
      productBrand: brand(
        brandName: "ADIDAS",
        brandCategory: "FASHION",
        brandCategoryIcon: const Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
          size: 25,
        ),
        brandImg: AppAssets.nike,
        brandLocation: "النخيل مول",
        brandLocationId: 1,
      ),
      productName: "كاب",
      productImg: AppAssets.cap,
      productPrice: 70,
      productNewPrice: 53,
      productDemand: 20,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
        size: 35,
      ),
      productGender: 2,
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'رائد علي',
        date: "27/10/2022",
        rating: "5/5",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.cap,
      ),
    ),
    Product(
      productID: 7,
      productBrand: brand(
        brandName: "Zara",
        brandCategory: "FASHION",
        brandImg: AppAssets.zara,
        brandCategoryIcon: Icon(
          MyIcons.fashiontwo,
          color: Colors.white,
        ),
        brandLocation: "الرياض مول",
        brandLocationId: 3,
      ),
      productName: "فستان",
      productImg: AppAssets.dress,
      productPrice: 120,
      productDemand: 8,
      productColor: "أسود",
      productCategoryIcon: Icon(
        MyIcons.fashiontwo,
        color: Colors.white,
      ),
      productGender: 1,
      productSize: "S",
      productCtegory: 0,
      feedData: FeedBackData(
        name: 'مشاعل علي',
        date: "27/10/2022",
        rating: "5/5",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.dress,
      ),
    ),
    Product(
      productID: 8,
      productBrand: brand(
        brandName: "Chanel",
        brandCategory: "COSMETICS",
        brandImg: AppAssets.chanel,
        brandCategoryIcon: Icon(
          MyIcons.cosmetics,
          color: Colors.white,
        ),
        brandLocation: "الرياض مول",
        brandLocationId: 3,
      ),
      productName: "مسكارا",
      productImg: AppAssets.mascara,
      productPrice: 90,
      productDemand: 15,
      productCategoryIcon: Icon(
        MyIcons.cosmetics,
        color: Colors.white,
      ),
      productGender: 1,
      productSize: '60 ML',
      productCtegory: 1,
    ),
    Product(
      productID: 9,
      productBrand: brand(
        brandName: "Chanel",
        brandCategory: "COSMETICS",
        brandImg: AppAssets.chanel,
        brandCategoryIcon: Icon(
          MyIcons.cosmetics,
          color: Colors.white,
        ),
        brandLocation: "الرياض مول",
        brandLocationId: 3,
      ),
      productName: "كريم الأساس",
      productImg: AppAssets.mask,
      productPrice: 150,
      productDemand: 18,
      productCategoryIcon: Icon(
        MyIcons.cosmetics,
        color: Colors.white,
      ),
      productGender: 1,
      productSize: "100 ML",
      productCtegory: 1,
    ),
    Product(
      productID: 10,
      productBrand: brand(
        brandName: "CHANEL",
        brandCategory: "COSMETICS",
        brandCategoryIcon: const Icon(
          MyIcons.cosmetics,
          color: Colors.white,
        ),
        brandImg: AppAssets.chanel,
        brandLocation: "بانوراما مول",
        brandLocationId: 2,
      ),
      productName: "البرايمر الأساسي",
      productImg: AppAssets.foundationCream,
      productPrice: 70,
      productCategoryIcon: Icon(
        MyIcons.cosmetics,
        color: Colors.white,
      ),
      productGender: 1,
      productSize: "100 ML",
      productDemand: 16,
      productCtegory: 1,
      feedData: FeedBackData(
        name: 'أصايل أحمد',
        date: "27/10/2022",
        rating: "5/5",
        feedBacktxt:
            'رضا العملاء يساهم في تحسين أداء شركتك واستقرار مبيعاتك ونموها! لأن العميل الراضي سيكرر تجربة الشراء ويقنع عميل محتمل بالتجربة! وتعد تقييمات العملاء أفضل وسيلة للتأكد من أن العملاء راضون عن خدماتك ومنتجاتك.',
        feedBackImg: AppAssets.foundationCream,
      ),
    ),
    Product(
      productID: 11,
      productBrand: brand(
        brandName: "CHANEL",
        brandCategory: "COSMETICS",
        brandCategoryIcon: const Icon(
          MyIcons.cosmetics,
          color: Colors.white,
        ),
        brandImg: AppAssets.chanel,
        brandLocation: "بانوراما مول",
        brandLocationId: 2,
      ),
      productName: "الكونسيلر",
      productImg: AppAssets.bouder,
      productPrice: 70,
      productGender: 1,
      productSize: "100 ML",
      productDemand: 25,
      productCtegory: 1,
    ),
  ];
  static final List<Order> getAllOrders = [
    Order(
        orderId: 005254,
        //  orderStatus: "تم التسليم",
        //orderStatusInt: 0,
        orderTime: "12/4/2022 06:30 م",
        receiptTime: "12/4/2022 07:25 م",
        orderProduct: getAllProducts[1]),
    Order(
        orderId: 005824,
        orderStatus: "تم التسليم",
        orderStatusInt: 0,
        orderTime: "12/4/2022 06:30 م",
        receiptTime: "12/4/2022 07:25 م",
        orderProduct: getAllProducts[3]),
    Order(
        orderId: 007176,
        orderStatus: "قيد التجهيز",
        orderStatusInt: 2,
        orderTime: "12/4/2022 10:30 ص",
        receiptTime: "12/4/2022 11:40 ص",
        orderProduct: getAllProducts[8]),
    Order(
        orderId: 008976,
        orderStatus: "قيد التجهيز",
        orderStatusInt: 2,
        orderTime: "12/4/2022 10:30 ص",
        receiptTime: "12/4/2022 11:40 ص",
        orderProduct: getAllProducts[2]),
    Order(
        orderId: 003451,
        orderStatus: "جاهز للتسليم",
        orderStatusInt: 1,
        orderTime: "12/4/2022 06:30 م",
        receiptTime: "12/4/2022 07:25 م",
        orderProduct: getAllProducts[1]),
    Order(
        orderId: 005254,
        orderStatus: "تم التسليم",
        orderStatusInt: 0,
        orderTime: "12/4/2022 06:30 م",
        receiptTime: "12/4/2022 07:25 م",
        orderProduct: getAllProducts[6]),
    Order(
        orderId: 003221,
        orderStatus: "جاهز للتسليم",
        orderStatusInt: 1,
        orderTime: "12/4/2022 06:30 م",
        receiptTime: "12/4/2022 07:25 م",
        orderProduct: getAllProducts[10]),
    Order(
        orderId: 005628,
        orderStatus: "ملغى",
        orderStatusInt: 3,
        orderTime: "12/4/2022 10:30 ص",
        receiptTime: "12/4/2022 11:40 ص",
        orderProduct: getAllProducts[0]),
  ];
  static final List<brand> getAllStores = [
    brand(
      brandName: "مول الرياض",
      brandItems: ["أحذية", "عطور", "بناطيل", "تي شيرت", "جاكيت"],
      brandCategory: "FASHION",
    ),
    brand(
      brandName: "الحياة مول",
      brandItems: ["أحذية", "عطور", "بناطيل", "تي شيرت"],
      brandCategory: "COSMETICS",
    ),
    brand(
      brandName: "بوليفارد الرياض",
      brandItems: ["أحذية", "بناطيل", "تي شيرت", "جاكيت"],
      brandCategory: "FASHION",
    ),
    brand(
      brandName: "رويال مول",
      brandItems: ["أحذية", "عطور", "بناطيل", "تي شيرت", "جاكيت"],
      brandCategory: "FASHION",
    ),
    brand(
      brandName: "النخيل مول",
      brandItems: ["أحذية", "عطور", "تي شيرت", "جاكيت"],
      brandCategory: "COSMETICS",
    ),
    brand(
      brandName: "بانوراما مول",
      brandItems: ["أحذية", "عطور", "بناطيل", "تي شيرت", "جاكيت"],
      brandCategory: "FASHION",
    ),
  ];
}
