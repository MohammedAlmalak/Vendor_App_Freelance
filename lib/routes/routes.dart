import 'package:get/get.dart';
import 'package:vendor_app_freelance/routes/routes_name.dart';
import 'package:vendor_app_freelance/screens/account/view/account.dart';
import 'package:vendor_app_freelance/screens/account/view/productSalesDetails.dart';
import 'package:vendor_app_freelance/screens/addProducr/view/addProduct.dart';
import 'package:vendor_app_freelance/screens/branches/view/addStore.dart';
import 'package:vendor_app_freelance/screens/branches/view/branchProducts.dart';
import 'package:vendor_app_freelance/screens/branches/view/branches.dart';
import 'package:vendor_app_freelance/screens/feedback/view/feedBack.dart';
import 'package:vendor_app_freelance/screens/login/view/login.dart';
import 'package:vendor_app_freelance/screens/mostPurchasedItems/view/mostPurchasedItems.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productEditing.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productItems.dart';
import 'package:vendor_app_freelance/screens/myProduct/view/productReport.dart';
import 'package:vendor_app_freelance/screens/notification/view/notification.dart';
import 'package:vendor_app_freelance/screens/orderStatusDetails/view/orderStatusDetails.dart';
import 'package:vendor_app_freelance/services/theme/nav_bar/nav_bar.dart';
import 'package:vendor_app_freelance/splashScreen/splashScreen.dart';
import '../screens/allReport/view/all_Report_scree.dart';
import '../screens/home/view/home.dart';
import '../screens/myProduct/view/my_product.dart';
import '../screens/oeders/view/orders_screen.dart';
import '../screens/visitNumber/view/visit_number.dart';
import '../services/theme/nav_bar/nav_bar_binding.dart';

class AppPages {
  static const INITIAL = Routes.NavBar;
  static const SPLASH = Routes.splashScreen;
  static final routes = [
    GetPage(
      name: Routes.NavBar,
      page: () => NavBar(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: Routes.Home,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.orders,
      page: () => OrdersScreen(),
    ),
    GetPage(
      name: Routes.account,
      page: () => Account(),
    ),
    GetPage(
      name: Routes.myProduct,
      page: () => MyProduct(),
    ),
    GetPage(
      name: Routes.addProduct,
      page: () => AddProduct(),
    ),
    GetPage(
      name: Routes.visitNumber,
      page: () => VisitNumber(),
    ),
    GetPage(
      name: Routes.feedBack,
      page: () => FeedBack(),
    ),
    GetPage(
      name: Routes.branches,
      page: () => Branches(),
    ),
    GetPage(
      name: Routes.allReport,
      page: () => AllReport(),
    ),
    GetPage(
      name: Routes.notification,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Routes.branchProducts,
      page: () => BranchProducts(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => splashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => login(),
    ),
    GetPage(
      name: Routes.addStore,
      page: () => addStore(),
    ),
    GetPage(
      name: Routes.mostPurchasedItems,
      page: () => mostPurchasedItems(),
      // transition: Transition.zoom
    ),
    GetPage(
      name: Routes.productSalesDetails,
      page: () => productSalesDetails(),
    ),
    GetPage(
      name: Routes.productItems,
      page: () => productItems(),
    ),
    GetPage(
      name: Routes.productEditing,
      page: () => productEditing(),
    ),
    GetPage(
      name: Routes.ProductReport,
      page: () => ProductReport(),
    ),
    GetPage(
      name: Routes.orderStatusDetails,
      page: () => OrderStatusDetails(),
    ),
  ];
}
