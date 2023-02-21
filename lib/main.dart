import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vendor_app_freelance/routes/routes.dart';
import 'package:vendor_app_freelance/services/translate/translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => TranslationService().init());
  await GetStorage.init();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

navigateScree(Widget screen, BuildContext context) {
  pushNewScreen(
    context,
    screen: screen,
    withNavBar: true, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.scale,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), //375 × 812
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        title: 'Vendor App',
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: Get.find<TranslationService>().supportedLocales(),
        translationsKeys: Get.find<TranslationService>().translations,
        locale: Get.find<TranslationService>().getLocale(),
        fallbackLocale: Get.find<TranslationService>().fallbackLocale,
        defaultTransition: Transition.zoom,
        theme: AppTheme.getLightTheme(),
        // darkTheme: ThemeData.dark(),
        getPages: AppPages.routes,
        initialRoute: AppPages.SPLASH,
      ),
    );
  }
}
