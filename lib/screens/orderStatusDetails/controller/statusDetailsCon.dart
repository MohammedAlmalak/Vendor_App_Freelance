import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';
import 'package:vendor_app_freelance/staticData.dart';

class StatusDetailsCon extends GetxController {
  late List<Order> ordersStatusList;
  List<Order> getOrderList(int statusInt) {
    return ordersStatusList = staticData.getAllOrders
        .where((element) => element.orderStatusInt == statusInt)
        .toList();
  }

  List<Order>? FilterdList;

  genderFiltration(int gender) {
    FilterdList = ordersStatusList
        .where(
          (element) => element.orderProduct.productGender == gender,
        )
        .toList();
    update();
  }

  branchFiltration(int branch) {
    FilterdList = ordersStatusList
        .where(
          (element) =>
              element.orderProduct.productBrand!.brandLocationId == branch,
        )
        .toList();
    update();
  }

  priceFiltration(bool isAscending) {
    FilterdList = ordersStatusList;
    if (isAscending) {
      // FilterdList != null
      //     ?
      FilterdList!.sort(((a, b) => a.orderProduct.productPrice!
          .compareTo(b.orderProduct.productPrice!)));
      // : ordersStatusList.sort(((a, b) => a.orderProduct.productPrice!
      //     .compareTo(b.orderProduct.productPrice!)));
    } else {
      // FilterdList != null
      //     ?
      FilterdList!.sort(((a, b) => b.orderProduct.productPrice!
          .compareTo(a.orderProduct.productPrice!)));
      // : ordersStatusList.sort(((a, b) => b.orderProduct.productPrice!
      //     .compareTo(a.orderProduct.productPrice!)));
    }
    update();
  }

  categoryFiltration(List<int> categories) {
    List<Order> categoryList = [];
    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        ordersStatusList.forEach((element) {
          if (element.orderProduct.productCtegory == categories[i]) {
            categoryList.add(element);
          }
        });
      }
      FilterdList = categoryList;
    }
    update();
  }
}
