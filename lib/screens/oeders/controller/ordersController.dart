import 'package:get/get.dart';
import 'package:vendor_app_freelance/staticData.dart';
import '../../../primaryClasses/orders.dart';

class ordersController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    FilterdList != null ? FilterdList! : ordersList;
    isExpanded = List.generate(
        FilterdList != null ? FilterdList!.length : ordersList.length,
        (index) => false);
  }

  late List<bool> isExpanded;
  //late List<Order> _orders;

  changeExpan(int index) {
    isExpanded[index] = !isExpanded[index];
    // print(isExpanded);
    update();
  }

  List<Order> ordersList = staticData.getAllOrders;
  List<Order>? FilterdList; /* = staticData.getAllProducts */
  genderFiltration(int gender) {
    FilterdList = ordersList
        .where(
          (element) => element.orderProduct.productGender == gender,
        )
        .toList();
    update();
  }

  statusFiltration(int status) {
    FilterdList = ordersList
        .where(
          (element) => element.orderStatusInt == status,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = ordersList
        .where(
          (element) =>
              element.orderProduct.productBrand!.brandLocationId == branch,
        )
        .toList();
    update();
  }

  // priceFiltration(bool isAscending) {
  //   if (isAscending) {
  //     FilterdList != null
  //         ? FilterdList!
  //             .sort(((a, b) => a.orderProduct.productPrice.compareTo(b.orderProduct.productPrice)))
  //         : ordersList
  //             .sort(((a, b) => a.orderProduct.productPrice.compareTo(b.orderProduct.productPrice)));
  //   } else {
  //     FilterdList != null
  //         ? FilterdList!
  //             .sort(((a, b) => b.orderProduct.productPrice.compareTo(a.orderProduct.productPrice)))
  //         : ordersList
  //             .sort(((a, b) => b.orderProduct.productPrice.compareTo(a.orderProduct.productPrice)));
  //   }
  //   update();
  // }

  categoryFiltration(List<int> categories) {
    List<Order> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        ordersList.forEach((element) {
          if (element.orderProduct.productCtegory == categories[i]) {
            categoryList.add(element);
          }
        });
      }
      FilterdList = categoryList;
    }
    update();
  }

  // String deliveryTime = 's';
  // changeDeliveryTime(String time) {
  //   deliveryTime = time;
  //   update();
  // }
}
