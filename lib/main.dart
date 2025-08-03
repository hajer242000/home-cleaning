import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Screens/Auth/complete_your_profile.dart';
import 'package:homecleaning/Screens/Auth/create_account.dart';
import 'package:homecleaning/Screens/Auth/new_password.dart';
import 'package:homecleaning/Screens/Auth/sign_in.dart';
import 'package:homecleaning/Screens/Auth/verify_code.dart';
import 'package:homecleaning/Screens/Launch/on_boarding.dart';
import 'package:homecleaning/Screens/Launch/splash.dart';
import 'package:homecleaning/Screens/Launch/start_app.dart';
import 'package:homecleaning/Screens/Launch/welcome.dart';
import 'package:homecleaning/Screens/Location/enter_your_location.dart';
import 'package:homecleaning/Screens/Location/location_access.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:homecleaning/controller_getx/app_controller.dart';
import 'package:homecleaning/core/api/dio_consumer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Get.put(AppController(api: DioConsumer(dio: Dio())));
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: MyApp(),
    ),
  );
}
//----------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        scaffoldBackgroundColor: tertiaryColor,
        fontFamily: 'Inter',
        appBarTheme: AppBarTheme(
          color: tertiaryColor,

          centerTitle: true,

          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),

      getPages: [
        //Launch
        GetPage(name: '/splash', page: () => Splash()),
        GetPage(name: '/welcome', page: () => Welcome()),
        GetPage(name: '/onboarding', page: () => Onboarding()),
        GetPage(name: '/start', page: () => StartApp()),

        //Auth
        GetPage(name: '/signIn', page: () => SignIn()),
        GetPage(name: '/signUp', page: () => CreateAccount()),
        GetPage(name: '/newPassword', page: () => NewPassword()),
        GetPage(name: '/verifyCode', page: () => VerifyCode()),
        GetPage(name: '/completeProfile', page: () => CompleteYourProfile()),

        //Location
        GetPage(name: '/locationAccess', page: () => LocationAccess()),
        GetPage(name: '/enterLocation', page: () => EnterYourLocation()),
      ],

      home: Splash(),
    );
  }
}
