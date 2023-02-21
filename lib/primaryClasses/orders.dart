import 'package:vendor_app_freelance/primaryClasses/products.dart';

class Order {
  int orderId;
  int? numberOfProduct;
  String? orderStatus;
  int? orderStatusInt;
  Product orderProduct;
  String? orderTime;
  String? receiptTime;
  Order(
      {required this.orderId,
      this.numberOfProduct,
      this.orderStatus,
      this.orderStatusInt,
      required this.orderProduct,
      this.orderTime,
      this.receiptTime});
}
