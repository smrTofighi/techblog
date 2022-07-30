import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/views/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBar,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.navigationBar,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const TecApp());
}

class TecApp extends StatelessWidget {
  const TecApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //? localizations -------------------------
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', 'IR'), // Farsi, no country code
        ],
        locale: const Locale('fa', 'IR'),
        //? Theme ---------------------------------
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)
            ),
            filled: true,
            fillColor: Colors.white
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return textTheme.headline1;
                  } else {
                    return textTheme.subtitle1;
                  }
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return SolidColors.seeMore;
                  } else {
                    return SolidColors.primery;
                  }
                },
              ),
            ),
          ),
          fontFamily: 'Samim',
          //? TextTheme --------------------
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontFamily: 'Samim',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle,
              ),
              subtitle1: TextStyle(
                fontFamily: 'Samim',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSubTitle,
              ),
              headline2: TextStyle(
                fontFamily: 'Samim',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: SolidColors.hashTagTitle,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Samim',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              headline3: TextStyle(
                fontFamily: 'Samim',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.seeMore,
              ),
              headline4: TextStyle(
                fontFamily: 'Samim',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              headline5: TextStyle(
                fontFamily: 'Samim',
                fontSize: 14,
                color: SolidColors.hintText,
                fontWeight: FontWeight.w700,
              )),
        ),
        home: const SplashView());
  }
}
