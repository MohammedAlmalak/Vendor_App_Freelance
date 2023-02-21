import 'package:flutter/material.dart';

class AppTheme {
/* 
  ThemeMode getThemeMode() {
    String _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == "dark") {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark
                .copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
                .copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }

   */
  static ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: Color(0xffF26511),
        primarySwatch: MaterialColor(
          0xffff4700,
          const <int, Color>{
            50: Color(0xffF26511), //10%
            100: Color(0xffF26511), //20%
            200: Color.fromARGB(248, 247, 58, 0), //30%
            300: Color.fromARGB(248, 247, 58, 0), //40%
            400: Color.fromARGB(248, 247, 58, 0), //50%
            500: Color.fromARGB(248, 247, 58, 0), //60%
            600: Color.fromARGB(248, 247, 58, 0), //70%
            700: Color.fromARGB(248, 247, 58, 0), //80%
          },
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: Color(0xffFCFCFC),
        fontFamily: 'Cairo',
        textTheme: TextTheme()
        /*  textTheme: GoogleFonts.cairoTextTheme(

          //Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ), */
        /*
         textTheme: GoogleFonts.getTextTheme(
            'Cairo',
            TextTheme(
              headline6: TextStyle(
                  //fontSize: 12.0.sp,
                  //fontWeight: FontWeight.w700,
                  color: Get.theme.primaryColor,
                 /*  height: 1.3 */),
            )
            /*   TextTheme(
                headline6: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.3),
                headline5: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline4: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline3: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline2: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.4),
                headline1: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w300,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.4),
                subtitle2: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                subtitle1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.2),
                bodyText2: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                bodyText1: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                caption: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: Ui.parseColor(setting.value.accentColor),
                    height: 1.2),
              ), */
            )

        
          accentColor: Ui.parseColor(setting.value.mainDarkColor),
            dividerColor:
                Ui.parseColor(setting.value.accentDarkColor, opacity: 0.1),
            focusColor: Ui.parseColor(setting.value.accentDarkColor),
            hintColor: Ui.parseColor(setting.value.secondDarkColor),
            toggleableActiveColor: Ui.parseColor(setting.value.mainDarkColor),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: Ui.parseColor(setting.value.mainColor)),
            ),
            colorScheme: ColorScheme.dark(
              primary: Ui.parseColor(setting.value.mainDarkColor),
              secondary: Ui.parseColor(setting.value.mainDarkColor),
            ),
            textTheme: GoogleFonts.getTextTheme(
              'Cairo',
              TextTheme(
                headline6: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.3),
                headline5: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline4: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline3: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.3),
                headline2: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.4),
                headline1: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w300,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.4),
                subtitle2: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                subtitle1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.mainColor),
                    height: 1.2),
                bodyText2: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                bodyText1: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Ui.parseColor(setting.value.secondColor),
                    height: 1.2),
                caption: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: Ui.parseColor(setting.value.accentColor),
                    height: 1.2),
              ),
            ) */
        );
    /*   ThemeData(
                fontFamily: 'Montserrat',
                primaryColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    elevation: 0, foregroundColor: Colors.white),
                brightness: Brightness.light,
                accentColor: Ui.parseColor(setting.value.mainColor),
                dividerColor: Ui.parseColor(setting.value.mainColor),
                focusColor: Ui.parseColor(setting.value.mainColor),
                hintColor: Ui.parseColor(setting.value.mainColor),
                textTheme: TextTheme(
                  headline6: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.3),
                  headline5: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline4: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline3: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline2: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.4),
                  headline1: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w300,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.4),
                  subtitle2: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  subtitle1: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.2),
                  bodyText2: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  bodyText1: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  caption: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Ui.parseColor(setting.value.accentColor),
                      height: 1.2),
                ),
              ); */
  }
/* 
  ThemeData getDarkTheme() {
    return //   change font dynamically
        getLocale().toString().startsWith('ar')
            ? ThemeData(
                primaryColor: Color(0xFF252525),
                floatingActionButtonTheme:
                    FloatingActionButtonThemeData(elevation: 0),
                scaffoldBackgroundColor: Color(0xFF2C2C2C),
                brightness: Brightness.dark,
                accentColor: Ui.parseColor(setting.value.mainDarkColor),
                dividerColor:
                    Ui.parseColor(setting.value.accentDarkColor, opacity: 0.1),
                focusColor: Ui.parseColor(setting.value.accentDarkColor),
                hintColor: Ui.parseColor(setting.value.secondDarkColor),
                toggleableActiveColor:
                    Ui.parseColor(setting.value.mainDarkColor),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      primary: Ui.parseColor(setting.value.mainColor)),
                ),
                colorScheme: ColorScheme.dark(
                  primary: Ui.parseColor(setting.value.mainDarkColor),
                  secondary: Ui.parseColor(setting.value.mainDarkColor),
                ),
                textTheme: GoogleFonts.getTextTheme(
                  'Cairo',
                  TextTheme(
                    headline6: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Ui.parseColor(setting.value.mainColor),
                        height: 1.3),
                    headline5: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.3),
                    headline4: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.3),
                    headline3: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.3),
                    headline2: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Ui.parseColor(setting.value.mainColor),
                        height: 1.4),
                    headline1: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w300,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.4),
                    subtitle2: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.2),
                    subtitle1: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Ui.parseColor(setting.value.mainColor),
                        height: 1.2),
                    bodyText2: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.2),
                    bodyText1: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Ui.parseColor(setting.value.secondColor),
                        height: 1.2),
                    caption: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Ui.parseColor(setting.value.accentColor),
                        height: 1.2),
                  ),
                ))
            : ThemeData(
                fontFamily: 'Montserrat',
                primaryColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    elevation: 0, foregroundColor: Colors.white),
                brightness: Brightness.light,
                accentColor: Ui.parseColor(setting.value.mainColor),
                dividerColor: Ui.parseColor(setting.value.mainColor),
                focusColor: Ui.parseColor(setting.value.mainColor),
                hintColor: Ui.parseColor(setting.value.mainColor),
                textTheme: TextTheme(
                  headline6: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.3),
                  headline5: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline4: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline3: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.3),
                  headline2: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.4),
                  headline1: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w300,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.4),
                  subtitle2: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  subtitle1: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.mainColor),
                      height: 1.2),
                  bodyText2: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  bodyText1: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Ui.parseColor(setting.value.secondColor),
                      height: 1.2),
                  caption: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Ui.parseColor(setting.value.accentColor),
                      height: 1.2),
                ),
              );
  }
 */
}
